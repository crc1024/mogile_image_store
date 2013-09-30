# coding: utf-8

module MogileImageStore
  #
  # ActionControllerにincludeするモジュール
  #
  module ImageDeletable # :nodoc:
    def self.included(base) # :nodoc:
      base.extend(ClassMethods)
    end
    #
    # ActionControllerにextendされるモジュール
    #
    module ClassMethods
      ##
      # 画像削除機能の利用を宣言する。
      #
      # ==== model
      # 削除したい画像を保持しているモデルクラスを指定。
      # 省略時はコントローラ名より判別。
      #
      # ==== 例:
      #   image_deletable
      #   image_deletable Cast
      # 
      def image_deletable(model=nil)
        cattr_accessor  :image_model

        model = eval(model.to_s) unless model.is_a? ::ActiveRecord::Base

        self.image_model  = model || self.name[/(.+)Controller/,1].singularize.constantize

        class_eval <<-EOV
        include MogileImageStore::ImageDeletable::InstanceMethods
        rescue_from MogileImageStore::ColumnNotFound do |e| render ({:nothing => true, :status => "404 Not Found"}) end
        EOV
      end
    end
    #
    # 各コントローラにincludeされるモジュール
    #
    module InstanceMethods
      # 画像削除を行うアクション
      def image_delete
        begin
          image_model.transaction do
            @record = image_model.lock(true).find(params[:id])
            column = params[:column].to_sym
            raise MogileImageStore::ColumnNotFound unless @record.image_columns.include?(column)
            key = @record[column]
            raise MogileImageStore::ImageNotFound if !key || key.empty?
            @record[column] = nil
            if @record.save!
              MogileImage.destroy_image(key)
              deleted = true
            end
          end
        rescue ::ActiveRecord::RecordInvalid, ::MogileImageStore::ImageNotFound
          redirect_to({ :action => 'edit' },
                      :alert => I18n.translate('mogile_image_store.errors.flashes.delete_failed'))
          return
        end
        redirect_to :action => 'edit'
      end
    end
  end
end

