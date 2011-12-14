class Version < ActiveRecord::Base
  belongs_to :package

  validates_presence_of :number
  validates_uniqueness_of :number, :scope => :package_id

  mount_uploader :packaged_file, PackageUploader

  def download!
    increment!(:downloads)
    package.increment!(:downloads)
  end
end
