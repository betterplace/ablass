class SinProject < ActiveRecord::Base
  belongs_to :sin
  validates :sin, presence: true

  validates :name, presence: true
  translates :name, :fallbacks_for_empty_translations => true

  validates :description, presence: true
  translates :description, :fallbacks_for_empty_translations => true

  validates :long_description, presence: true
  translates :long_description, :fallbacks_for_empty_translations => true

  accepts_nested_attributes_for :translations, :allow_destroy => true

  validates :betterplace_id,
    presence: true,
    uniqueness: true,
    numericality: { only_integer: true, greater_than_or_equal_to: 1 }

  delegate :description, :progress_percentage, :open_amount_in_cents,
    to: :betterplace_project, prefix: :betterplace

  mount_uploader :small_picture, SinProjectSmallPictureUploader
  mount_uploader :big_picture, SinProjectBigPictureUploader

  def image
    big_picture_url
  end

  def icon
    small_picture_url
  end

  def needed
    betterplace_open_amount_in_cents / 100
  end

  def donated
    betterplace_progress_percentage
  end

  def betterplace_profile_picture_url
    betterplace_project.profile_picture.links.first.href
  end

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
