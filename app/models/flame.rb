class Flame < ActiveRecord::Base
  validates :amount_in_cents, presence: true,
    numericality: { only_integer: true, greater_than_or_equal_to: 1 }

  default_scope -> { order(:amount_in_cents) }
end
