class ImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def default_url(*args)
    "http://192.168.0.193/defaults/default.png"
  end

  # Process files as they are uploaded:
  # process scale: [200, 300]
  #
  # def scale(width, height)
  #   # do something
  # end

  version :thumb do
    process resize_to_fit: [150, 150]
  end

  def extension_whitelist
    %w(jpg jpeg png)
  end

  def asset_host
    "http://192.168.0.193"
  end
end
