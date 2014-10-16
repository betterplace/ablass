class DonationsController < ApplicationController
  include Concerns::SinShared

  def create
    sin_project = current_sin.projects.find(params[:project_id])
    donation = Donation.create!(
      { sin_project: sin_project } | params.slice(:amount_in_cents, :sin_detail))
    @betterplace_donation_url = betterplace_donation_url(
      sin_project,
      params: {
        :desktop                                         => true,
        :client_id                                       => 'ablass',
        :'donation_presenter[donation_amount]'           => donation.amount_in_cents / 100,
        :'donation_presenter[donation_client_reference]' => donation.token,
      }
    )
    params[:standalone].to_i == 1 or redirect_to @betterplace_donation_url
  end

  def show
    @no_header = true
    if @donation = Donation.find_by_token(params[:donation_client_reference])
      @donation.sync_amount_in_background
    else
      render text: 'ouch, no such donation', status: :not_found # TODO make this a bit nicer
    end
  end

  private

  def betterplace_donation_url(sin_project, lang: I18n.locale, params: {})
    url = "#{Rails.configuration.betterplace_platform_url}"\
      "/#{lang}/projects/#{sin_project.betterplace_id}/client_donations/new"
    params.present? and url << "?#{params.to_param}"
    url
  end
end
