class SinsController < ApplicationController
  respond_to :html, :json

  def index
    @sins = Sin.all
    respond_with(@sins)
  end
end
