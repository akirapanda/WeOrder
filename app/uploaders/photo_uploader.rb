# encoding: utf-8

class PhotoUploader < CarrierWave::Uploader::Base

  include CarrierWave::MiniMagick


  storage :file
  # storage :fog
  
  version :large do
    process :resize_to_fit => [1024, 1024]
  end
  
  version :normal do
    process :resize_to_fit => [512, 512]
  end
  
  version :small do
    process :resize_to_fit => [128, 128]
  end

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  # Provide a default URL as a default if there hasn't been a file uploaded:
  def default_url
    "photo/#{version_name}.jpg"
  end

end
