# coding: utf-8
require 'spec_helper'

describe MogileImageStore::FormBuilder, mogilefs: true, type: :helper do
  describe "#image_field" do
    before do
      @image_test = Factory.build(:image_test)
    end

    it "should show file field" do
      form_for(@image_test) do |f|
        expect(f.image_field(:image)).to be_equivalent_to '<input id="image_test_image" name="image_test[image]" type="file" />'
      end
    end

    describe "when image exists" do
      before do
        @image_test.set_image_file :image, "#{File.dirname(__FILE__)}/../sample.png"
        @image_test.save
      end

      it "should show file field" do
        @image_test.image = ''
        form_for(@image_test) do |f|
          expect(f.image_field(:image)).to be_equivalent_to '<input id="image_test_image" name="image_test[image]" type="file" />'
        end
      end

      it "should show file field with image and delete link" do
        form_for(@image_test) do |f|
          expect(f.image_field(:image)).to be_equivalent_to '<a href="'+MogileImageStore.backend['base_url']+'raw/60de57a8f5cd0a10b296b1f553cb41a9.png" target="_blank"><img src="'+MogileImageStore.backend['base_url']+'80x80/60de57a8f5cd0a10b296b1f553cb41a9.png" /></a><a href="/test/'+@image_test.id.to_s+'/image_delete/image" data-confirm="Are you sure?">delete</a><br /><input id="image_test_image" name="image_test[image]" type="file" />'
        end
      end

      it "should show file field with image and delete link without confirm" do
        form_for(@image_test) do |f|
          expect(f.image_field(:image, :link_options => {:confirm => false})).to be_equivalent_to '<a href="'+MogileImageStore.backend['base_url']+'raw/60de57a8f5cd0a10b296b1f553cb41a9.png" target="_blank"><img src="'+MogileImageStore.backend['base_url']+'80x80/60de57a8f5cd0a10b296b1f553cb41a9.png" /></a><a href="/test/'+@image_test.id.to_s+'/image_delete/image">delete</a><br /><input id="image_test_image" name="image_test[image]" type="file" />'
        end
      end

      it "should show file field with image without delete link" do
        form_for(@image_test) do |f|
          expect(f.image_field(:image, :deletable => false)).to be_equivalent_to '<a href="'+MogileImageStore.backend['base_url']+'raw/60de57a8f5cd0a10b296b1f553cb41a9.png" target="_blank"><img src="'+MogileImageStore.backend['base_url']+'80x80/60de57a8f5cd0a10b296b1f553cb41a9.png" /></a><br /><input id="image_test_image" name="image_test[image]" type="file" />'
        end
      end

      it "should show file field with image and delete link with width and height" do
        form_for(@image_test) do |f|
          expect(f.image_field(:image, :w => 100, :h => 100)).to be_equivalent_to(
            '<a href="'+MogileImageStore.backend['base_url']+'raw/60de57a8f5cd0a10b296b1f553cb41a9.png" target="_blank"><img src="'+MogileImageStore.backend['base_url']+'100x100/60de57a8f5cd0a10b296b1f553cb41a9.png" /></a><a href="/test/' +
            @image_test.id.to_s +
            '/image_delete/image" data-confirm="Are you sure?">delete</a><br /><input id="image_test_image" name="image_test[image]" type="file" />')
        end
      end

      it "should show file field with image and delete link with options" do
        form_for(@image_test) do |f|
          expect(f.image_field(:image, :w => 100, :h => 100,
                        :image_options => {:alt=>'alt text'},
                        :link_options => {:rel=>'external'},
                        :input_options => {:class=>'upload'})).to be_equivalent_to(
            '<a href="'+MogileImageStore.backend['base_url']+'raw/60de57a8f5cd0a10b296b1f553cb41a9.png" target="_blank"><img alt="alt text" src="'+MogileImageStore.backend['base_url']+'100x100/60de57a8f5cd0a10b296b1f553cb41a9.png" /></a><a href="/test/' +
            @image_test.id.to_s +
            '/image_delete/image" data-confirm="Are you sure?" rel="external">delete</a><br /><input class="upload" id="image_test_image" name="image_test[image]" type="file" />')
        end
      end
    end

    context "confirm" do
      before do
        @confirm = Factory.build(:confirm)
        @confirm.set_image_file :image, "#{File.dirname(__FILE__)}/../sample.png"
        @confirm.valid?
      end

      it "should show hidden field when confirm" do
        form_for(@confirm) do |f|
          expect(f.image_field(:image, :confirm => true)).to be_equivalent_to '<img src="'+MogileImageStore.backend['base_url']+'raw/60de57a8f5cd0a10b296b1f553cb41a9.png" /><br /><input id="confirm_image" name="confirm[image]" type="hidden" value="60de57a8f5cd0a10b296b1f553cb41a9.png" />'
        end
      end
    end
  end

  describe "#attachment_field" do
    before do
      @image_test = Factory.build(:image_test)
    end

    it "should show file field" do
      form_for(@image_test) do |f|
        expect(f.attachment_field(:image)).to be_equivalent_to '<input id="image_test_image" name="image_test[image]" type="file" />'
      end
    end

    context "when attachment exists" do
      before do
        @image_test.set_image_file :image, "#{File.dirname(__FILE__)}/../sample.png"
        @image_test.save
      end

      it "should show file field with delete link" do
        form_for(@image_test) do |f|
          expect(f.attachment_field(:image)).to be_equivalent_to '<a href="'+MogileImageStore.backend['base_url']+'raw/60de57a8f5cd0a10b296b1f553cb41a9.png" target="_blank">[link]</a> <a href="/test/'+@image_test.id.to_s+'/image_delete/image" data-confirm="Are you sure?">delete</a><br /><input id="image_test_image" name="image_test[image]" type="file" />'
        end
      end
    end

    context "on confirmation" do
      before do
        @confirm = Factory.build(:confirm)
        @confirm.set_image_file :image, "#{File.dirname(__FILE__)}/../sample.png"
        @confirm.valid?
      end

      it "should show hidden field" do
        form_for(@confirm) do |f|
          expect(f.attachment_field(:image, :confirm => true)).to be_equivalent_to '<a href="'+MogileImageStore.backend['base_url']+'raw/60de57a8f5cd0a10b296b1f553cb41a9.png" target="_blank">[link]</a><br /><input id="confirm_image" name="confirm[image]" type="hidden" value="60de57a8f5cd0a10b296b1f553cb41a9.png" />'
        end
      end
    end
  end
end
