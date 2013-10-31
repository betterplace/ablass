class SinsController < ApplicationController
  respond_to :html, :json

  def index
    @sins = Sin.order('id DESC').all
    respond_with(@sins)
  end

  def detail
    unless @sin = Sin.find_by_param(params[:id])
      redirect_to sins_url
    end
  end
end
