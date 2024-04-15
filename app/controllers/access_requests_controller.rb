class AccessRequestsController < ApplicationController
    before_action :authenticate_user!

  def create
    @access_request = current_user.access_requests.build(access_request_params)
    if @access_request.save
      flash[:notice] = "Access request submitted successfully."
    else
      flash[:alert] = "Failed to submit access request."
    end
    redirect_to root_path
  end

  private

  def access_request_params
    params.require(:access_request).permit(:directory_id)
  end
end
