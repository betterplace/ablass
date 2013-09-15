class SinProject < ActiveRecord::Base
  belongs_to :sin

  validates :sin, presence: true
  validates :name, presence: true
  validates :description, presence: true
  validates :betterplace_id, presence: true,
    numericality: { only_integer: true, greater_than_or_equal_to: 1 }
end
