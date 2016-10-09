class Template < ApplicationRecord
  belongs_to :user
  has_many :templates
  mount_uploader :image, ImageUploader

end
