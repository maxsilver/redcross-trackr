class PictureUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave

  process :tags => Rails.env

  version :thumbnail do
    process :resize_to_fit => [115, 115]
  end
end