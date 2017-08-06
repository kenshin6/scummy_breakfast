class Image < ApplicationRecord
  belongs_to :post
  mount_uploader :file, FileUploader
end
