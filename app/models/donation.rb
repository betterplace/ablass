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

  def sync_amount_in_background
    Thread.new { sync_amount }
  end

  def sync_amount
    client_donation = BetterplaceApi.new.get(
      "/clients/ablass/client_donations",
      params: { facets: "client_reference:#{token}" }
    ).data.first
    self.amount_in_cents = client_donation.amount_in_cents
    save!
  rescue => e
    logger.error e
    return false
  end

  private

  def generate_token
    self.token ||= Tins::Token.new bits: 128
  end
end
