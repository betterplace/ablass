class SinProjectsController < ApplicationController
  include Concerns::SinShared

  respond_to :html
  respond_to :json, only: %i[ index show ]

  helper_method :current_sin

  def index
    @sin_projects = current_sin.projects
    respond_with(@sin_projects)
  end

  def show
    @sin_project = current_sin.projects.find(params[:id])
    respond_with(@sin_project)
  end

  def temperature
    @sin_project = current_sin.projects.find(params[:id])
    respond_with(@sin_project)
  end
end
