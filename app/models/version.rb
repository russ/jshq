class Version < ActiveRecord::Base
  belongs_to :package

  validates_presence_of :number, :packaged_file
  validates_uniqueness_of :number, :scope => :package_id

  attr_accessible :number, :authors, :website, :documentation, :packaged_file

  mount_uploader :packaged_file, PackageUploader

  def download!
    increment!(:downloads)
    package.increment!(:downloads)
  end
end
