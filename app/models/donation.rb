class Donation < ActiveRecord::Base
  belongs_to :sin_project
  validates :sin_project, presence: true

  validates :amount_in_cents, presence: true,
    numericality: { only_integer: true, greater_than_or_equal_to: 1 }

  validates :token, presence: true, uniqueness: true, length: { is: 22 }

  before_validation :generate_token

  def self.find_by_token(token)
    where(token: token).first
  end

  private

  def generate_token
    self.token ||= Tins::Token.new bits: 128
  end
end
