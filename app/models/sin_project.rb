class SinProject < ActiveRecord::Base
  belongs_to :sin
  validates :sin, presence: true

  validates :name, presence: true
  translates :name

  validates :description, presence: true
  translates :description

  validates :betterplace_id,
    presence: true,
    uniqueness: true,
    numericality: { only_integer: true, greater_than_or_equal_to: 1 }
end
