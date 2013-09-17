class FlamesController < ApplicationController
  respond_to :json

  def index
    @flames = Flame.all
    respond_with(@flames)
  end
end
