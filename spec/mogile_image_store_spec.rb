require 'spec_helper'
require 'mogilefs'

describe MogileImageStore do
  it "should be valid" do
    expect(MogileImageStore).to be_a(Module)
  end

  context "configuration" do
    before(:all) do
      @mogilefs_bak = MogileImageStore::Engine.config.mogile_fs
    end
    after(:all) do
      MogileImageStore::Engine.config.mogile_fs = @mogilefs_bak
      MogileImageStore.configure
    end
    it 'should append slash to mount_at only when not ended with slash' do
      MogileImageStore::Engine.config.mogile_fs['test']['mount_at'] = '/foo/'
      MogileImageStore.configure
      expect(MogileImageStore.backend[:mount_at]).to eq('/foo/')
      MogileImageStore::Engine.config.mogile_fs['test']['mount_at'] = '/foo'
      MogileImageStore.configure
      expect(MogileImageStore.backend[:mount_at]).to eq('/foo/')
    end
    it 'should append slash to base_url only when not ended with slash' do
      MogileImageStore::Engine.config.mogile_fs['test']['mount_at'] = '/foo/'
      MogileImageStore::Engine.config.mogile_fs['test']['base_url'] = '/bar/'
      MogileImageStore.configure
      expect(MogileImageStore.backend[:base_url]).to eq('/bar/')
      MogileImageStore::Engine.config.mogile_fs['test']['base_url'] = '/bar'
      MogileImageStore.configure
      expect(MogileImageStore.backend[:base_url]).to eq('/bar/')
    end
    it 'should set base_url to default value on empty' do
      MogileImageStore::Engine.config.mogile_fs['test']['base_url'] = nil
      MogileImageStore.configure
      expect(MogileImageStore.backend[:base_url]).to eq('/image/')
    end
  end
end
