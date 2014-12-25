# coding: utf-8
require 'spec_helper'

describe MogileImageStore do
  context "Validators" do
    context "Height" do
      describe "with <=500 validation" do
        before{ @image = ImageHeightMax500.new }
        it "should accept 445 image" do
          @image.image = ActionDispatch::Http::UploadedFile.new({
            filename: 'sample.png',
            tempfile: File.open("#{File.dirname(__FILE__)}/../../sample.png")
          })
          expect(@image.valid?).to be_truthy
        end

        it "should not accept 544 image" do
          @image.image = ActionDispatch::Http::UploadedFile.new({
            filename: 'sample.jpg',
            tempfile: File.open("#{File.dirname(__FILE__)}/../../sample.jpg")
          })
          expect(@image.valid?).to be_falsey
        end
      end

      describe "with >=500 validation" do
        before{ @image = ImageHeightMin500.new }
        it "should not accept 445 image" do
          @image.image = ActionDispatch::Http::UploadedFile.new({
            filename: 'sample.png',
            tempfile: File.open("#{File.dirname(__FILE__)}/../../sample.png")
          })
          expect(@image.valid?).to be_falsey
        end

        it "should accept 544 image" do
          @image.image = ActionDispatch::Http::UploadedFile.new({
            filename: 'sample.jpg',
            tempfile: File.open("#{File.dirname(__FILE__)}/../../sample.jpg")
          })
          expect(@image.valid?).to be_truthy
        end
      end

      describe "with 430-500 validation" do
        before{ @image = ImageHeightMin430Max500.new }
        it "should not accept 420 image" do
          @image.image = ActionDispatch::Http::UploadedFile.new({
            filename: 'sample.gif',
            tempfile: File.open("#{File.dirname(__FILE__)}/../../sample.gif")
          })
          expect(@image.valid?).to be_falsey
        end

        it "should accept 445 image" do
          @image.image = ActionDispatch::Http::UploadedFile.new({
            filename: 'sample.png',
            tempfile: File.open("#{File.dirname(__FILE__)}/../../sample.png")
          })
          expect(@image.valid?).to be_truthy
        end

        it "should not accept 544 image" do
          @image.image = ActionDispatch::Http::UploadedFile.new({
            filename: 'sample.jpg',
            tempfile: File.open("#{File.dirname(__FILE__)}/../../sample.jpg")
          })
          expect(@image.valid?).to be_falsey
        end
      end

      describe "with <=500 validation of old form" do
        before{ @image = ImageHeightMax500OldForm.new }
        it "should accept 445 image" do
          @image.image = ActionDispatch::Http::UploadedFile.new({
            filename: 'sample.png',
            tempfile: File.open("#{File.dirname(__FILE__)}/../../sample.png")
          })
          expect(@image.valid?).to be_truthy
        end

        it "should not accept 544 image" do
          @image.image = ActionDispatch::Http::UploadedFile.new({
            filename: 'sample.jpg',
            tempfile: File.open("#{File.dirname(__FILE__)}/../../sample.jpg")
          })
          expect(@image.valid?).to be_falsey
        end
      end

      describe "with error message of <=500 validation" do
        before{ @image = ImageHeightMax500.new }
        it "should not accept 544 image" do
          @image.image = ActionDispatch::Http::UploadedFile.new({
            filename: 'sample.jpg',
            tempfile: File.open("#{File.dirname(__FILE__)}/../../sample.jpg")
          })
          expect(@image.valid?).to be_falsey
          expect(@image.errors[:image].shift).to eq('\'s height must be smaller than 500 pixels.')
        end
      end

      describe "with ja error message of <=500 validation" do
        before do
          @image = ImageHeightMax500.new
          I18n.locale = :ja
        end
        after do
          I18n.locale = I18n.default_locale
        end

        it "should not accept 544 image" do
          @image.image = ActionDispatch::Http::UploadedFile.new({
            filename: 'sample.jpg',
            tempfile: File.open("#{File.dirname(__FILE__)}/../../sample.jpg")
          })
          expect(@image.valid?).to be_falsey
          expect(@image.errors[:image].shift).to eq('の高さは500pixel以下でなければなりません。')
        end
      end

      describe "with custom error message of <=500 validation" do
        before{ @image = ImageHeightMax500CustomMsg.new }
        it "should not accept 544 image" do
          @image.image = ActionDispatch::Http::UploadedFile.new({
            filename: 'sample.jpg',
            tempfile: File.open("#{File.dirname(__FILE__)}/../../sample.jpg")
          })
          expect(@image.valid?).to be_falsey
          expect(@image.errors[:image].shift).to eq('custom')
        end
      end

      describe "with ==420 validation" do
        before{ @image = ImageHeight420.new }
        it "should accept 420 image" do
          @image.image = ActionDispatch::Http::UploadedFile.new({
            filename: 'sample.png',
            tempfile: File.open("#{File.dirname(__FILE__)}/../../sample.gif")
          })
          expect(@image.valid?).to be_truthy
        end

        it "should not accept 544 image" do
          @image.image = ActionDispatch::Http::UploadedFile.new({
            filename: 'sample.jpg',
            tempfile: File.open("#{File.dirname(__FILE__)}/../../sample.jpg")
          })
          expect(@image.valid?).to be_falsey
        end
      end
    end
  end
end

