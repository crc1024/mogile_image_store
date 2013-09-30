require 'spec_helper'

describe ConfirmableAsset, :mogilefs => true do
  before(:all) do
    @prev_cache_time = MogileImageStore.options[:upload_cache]
    MogileImageStore.options[:upload_cache] = 1
  end
  after(:all) do
    MogileImageStore.options[:upload_cache] = @prev_cache_time
  end

  before do
    @mg = MogileFS::MogileFS.new({ :domain => MogileImageStore.backend['domain'], :hosts  => MogileImageStore.backend['hosts'] })
    @confirm = Factory.build(:confirmable_asset)
  end

  context "saving" do
    it "should return hash value when saved" do
      @confirm.set_image_file :asset, "#{File.dirname(__FILE__)}/../sample.txt"
      @confirm.valid?.should be_true
      @confirm.asset.should == 'd2863cc5448b49cfd0ab49dcb0936a89.txt'
      @mg.list_keys('').shift.should == ['d2863cc5448b49cfd0ab49dcb0936a89.txt']
      MogileImage.find_by_name('d2863cc5448b49cfd0ab49dcb0936a89').refcount.should == 0
      MogileImage.find_by_name('d2863cc5448b49cfd0ab49dcb0936a89').keep_till.should_not be_nil
      sleep(1)
      lambda{ @confirm.save! }.should_not raise_error
      @confirm.asset.should == 'd2863cc5448b49cfd0ab49dcb0936a89.txt'
      MogileImage.find_by_name('d2863cc5448b49cfd0ab49dcb0936a89').refcount.should == 1
    end

    it "should increase refcount when saving the same attachment" do
      @confirm.set_image_file :asset, "#{File.dirname(__FILE__)}/../sample.txt"
      @confirm.save!
      @confirm = Factory.build(:confirmable_asset)
      MogileImage.find_by_name('d2863cc5448b49cfd0ab49dcb0936a89').refcount.should == 1
      @confirm.set_image_file :asset, "#{File.dirname(__FILE__)}/../sample.txt"
      @confirm.valid?.should be_true
      @mg.list_keys('').shift.should == ['d2863cc5448b49cfd0ab49dcb0936a89.txt']
      MogileImage.find_by_name('d2863cc5448b49cfd0ab49dcb0936a89').refcount.should == 1
      MogileImage.find_by_name('d2863cc5448b49cfd0ab49dcb0936a89').keep_till.should_not be_nil
      lambda{ @confirm.save! }.should_not raise_error
      @confirm.asset.should == 'd2863cc5448b49cfd0ab49dcb0936a89.txt'
      MogileImage.find_by_name('d2863cc5448b49cfd0ab49dcb0936a89').refcount.should == 2
    end

    it "should not be valid when upload cache was cleared",f:true do
      @confirm.set_image_data :asset, File.open("#{File.dirname(__FILE__)}/../sample.png").read
      @confirm.valid?.should be_true
      MogileImage.find_by_name('60de57a8f5cd0a10b296b1f553cb41a9').refcount.should == 0
      MogileImage.find_by_name('60de57a8f5cd0a10b296b1f553cb41a9').keep_till.should_not be_nil
      sleep(1)
      MogileImage.cleanup_temporary_image
      @confirm.valid?.should be_false
      @confirm.errors[:asset].should == ["has expired. Please upload again."]
      @confirm.asset.should be_nil
      MogileImage.find_by_name('60de57a8f5cd0a10b296b1f553cb41a9').should be_nil
    end

    it "should accept another attachment using set_image_data" do
      @confirm.set_image_data :asset, File.open("#{File.dirname(__FILE__)}/../sample.png").read
      sleep(1)
      MogileImage.cleanup_temporary_image
      @confirm = Factory.build(:confirmable_asset)
      @confirm.set_image_file :asset, "#{File.dirname(__FILE__)}/../sample.png"
      @confirm.valid?.should be_true
      @confirm.asset.should == '60de57a8f5cd0a10b296b1f553cb41a9.png'
      @mg.list_keys('').shift.sort.should == ['60de57a8f5cd0a10b296b1f553cb41a9.png']
      MogileImage.find_by_name('60de57a8f5cd0a10b296b1f553cb41a9').refcount.should == 0
      MogileImage.find_by_name('60de57a8f5cd0a10b296b1f553cb41a9').keep_till.should_not be_nil
      lambda{ @confirm.save! }.should_not raise_error
      @confirm.asset.should == '60de57a8f5cd0a10b296b1f553cb41a9.png'
      MogileImage.find_by_name('60de57a8f5cd0a10b296b1f553cb41a9').refcount.should == 1
    end
  end

  context "overwriting" do
    it "should delete old attachment when overwritten" do
      @confirm.set_image_file :asset, "#{File.dirname(__FILE__)}/../sample.png"
      @confirm.save!
      sleep(1)
      @confirm.set_image_file :asset, "#{File.dirname(__FILE__)}/../sample.gif"
      @confirm.valid?.should be_true
      @confirm.asset.should == '5d1e43dfd47173ae1420f061111e0776.gif'
      MogileImage.find_by_name('60de57a8f5cd0a10b296b1f553cb41a9').refcount.should == 1
      MogileImage.find_by_name('5d1e43dfd47173ae1420f061111e0776').refcount.should == 0
      lambda{ @confirm.save }.should_not raise_error
      @confirm.asset.should == '5d1e43dfd47173ae1420f061111e0776.gif'
      MogileImage.find_by_name('60de57a8f5cd0a10b296b1f553cb41a9').should be_nil
      MogileImage.find_by_name('5d1e43dfd47173ae1420f061111e0776').refcount.should == 1
      @mg.list_keys('').shift.sort.should ==
        ['5d1e43dfd47173ae1420f061111e0776.gif']
    end
  end

  context "saving without uploading attachment" do
    it "should preserve asset name" do
      @confirm.set_image_file :asset, "#{File.dirname(__FILE__)}/../sample.gif"
      @confirm.save
      new_name = @confirm.name + ' new'
      @confirm.name = new_name
      @confirm.valid?.should be_true
      @confirm.name.should == new_name
      @confirm.asset.should == '5d1e43dfd47173ae1420f061111e0776.gif'
      MogileImage.should_not_receive(:commit_image)
      lambda{ @confirm.save }.should_not raise_error
      @confirm.name.should == new_name
      @confirm.asset.should == '5d1e43dfd47173ae1420f061111e0776.gif'
      @mg.list_keys('').shift.sort.should == ['5d1e43dfd47173ae1420f061111e0776.gif']
      MogileImage.find_by_name('5d1e43dfd47173ae1420f061111e0776').refcount.should == 1
    end
  end

  context "deletion" do
    it "should keep record with refcount = 0 when deleting non-expired attachment" do
      @confirm.set_image_file :asset, "#{File.dirname(__FILE__)}/../sample.gif"
      @confirm.save
      lambda{ @confirm.destroy }.should_not raise_error
      @mg.list_keys('').shift.sort.should == ['5d1e43dfd47173ae1420f061111e0776.gif']
      MogileImage.find_by_name('5d1e43dfd47173ae1420f061111e0776').refcount.should == 0
    end

    it "should delete image data when expired" do
      @confirm.set_image_file :asset, "#{File.dirname(__FILE__)}/../sample.gif"
      @confirm.save
      @confirm.destroy
      sleep(1)
      MogileImage.cleanup_temporary_image
      @mg.list_keys('').should be_nil
      MogileImage.all.should == []
    end
  end
end
