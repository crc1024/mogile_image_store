class Multiple < ActiveRecord::Base
  has_images [:banner1, :banner2]

  belongs_to :confirm
end
