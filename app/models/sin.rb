class Sin < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true

  validates :display_name, presence: true
  translates :display_name

  validates :explanation, presence: true
  translates :explanation, :fallbacks_for_empty_translations => true

  accepts_nested_attributes_for :translations, :allow_destroy => true

  has_many :projects, class_name: SinProject

  mount_uploader :icon, SinIconUploader
  validates :icon, presence: true

  def to_param
    name
  end

  def self.find_by_param(name)
    where(name: name).first
  end

  def projects_count
    projects.count
  end

  def detailed?
    name == 'other'
  end
end
