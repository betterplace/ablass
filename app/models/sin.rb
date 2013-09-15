class Sin < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true

  has_many :projects, class_name: SinProject
end
