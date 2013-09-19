class DonationsController < ApplicationController
  include Concerns::SinShared

  def create
    sin_project = current_sin.projects.find(params[:sin_project_id])
    donation = Donation.create!(
      { sin_project: sin_project } | params.slice(:amount_in_cents))
    redirect_to betterplace_donation_url(
      sin_project,
      :client_id                             => 'ablass',
      :'donation_presenter[donation_amount]' => donation.amount_in_cents,
      :donation_client_reference             => donation.token,
    )
  end

  def show
  end
end
