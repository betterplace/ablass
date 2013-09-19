module Concerns::SinShared
  private

  def current_sin
    @current_sin ||= Sin.find_by_param(params[:sin_id])
  end
end
