class PackageUploader < CarrierWave::Uploader::Base
  storage :fog

  def store_dir
    "packages/#{model.package.name[0,2].downcase}"
  end

  def extension_white_list
    %w(tgz)
  end
end
