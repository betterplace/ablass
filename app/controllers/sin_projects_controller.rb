class SinProjectsController < ApplicationController
  respond_to :html, :json

  helper_method :current_sin

  def index
    @sin_projects = current_sin.projects
    respond_with(@sin_projects)
  end

  def show
    @sin_project = current_sin.projects.find(params[:id])
    respond_to(&:html)
  end

  def temperature
    @sin_project = current_sin.projects.find(params[:id])
    respond_to(&:html)
  end

  private

  def current_sin
    @current_sin ||= Sin.find_by_param(params[:sin_id])
  end
end
