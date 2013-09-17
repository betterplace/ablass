class SinProjectsController < ApplicationController
  helper_method :current_sin

  def index
    @sin_projects = current_sin.projects
  end

  def show
    @sin_project = current_sin.projects.find(params[:id])
  end

  def temperature
    @sin_project = current_sin.projects.find(params[:id])
  end

  private

  def current_sin
    @current_sin ||= Sin.find_by_param(params[:sin_id])
  end
end
