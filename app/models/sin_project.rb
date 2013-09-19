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

  delegate :description, :progress_percentage, :open_amount_in_cents,
    to: :betterplace_project, prefix: :betterplace

  mount_uploader :small_picture, SinProjectSmallPictureUploader
  validates :small_picture, presence: true

  mount_uploader :big_picture, SinProjectBigPictureUploader
  validates :big_picture, presence: true

  private

  def betterplace_project
    require 'open-uri'
    @betterplace_project ||= betterplace_id.full? do |id|
      api_url = Rails.configuration.betterplace_api.("/projects/%u.json" % id)
      begin
        JSON.parse(open(api_url).read, object_class: JSON::GenericObject)
      rescue => e
        e.message << " (#{api_url})"
        raise e
      end
    end
  end
end
