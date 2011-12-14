class Package < ActiveRecord::Base
  belongs_to :user
  has_many :versions, :order => "created_at DESC", :dependent => :destroy

  accepts_nested_attributes_for :versions

  validates_presence_of :name
  validates_uniqueness_of :name

  attr_accessible :name, :summary, :description, :versions_attributes

  scope :latest, order("created_at DESC")

  extend FriendlyId

  friendly_id :name, :use => :slugged

  searchable do
    text :name
    text :summary
    text :description
    text :slug
    text :authors do
      versions.map { |v| v.authors }
    end
  end

  def as_json(options = {})
    options[:include] = :versions
    super(options)
  end
end
