class Admin::AccessRequestsController < ApplicationController
  def index
    @access_requests = AccessRequest.all
  end

  def update
    @access_request = AccessRequest.find(params[:id])
    if @access_request.update(access_request_params)
      redirect_to admin_access_requests_path, notice: 'Access granted'
    else
      render :index
    end
  end

  def destroy
    @access_request = AccessRequest.find(params[:id])
    @access_request.destroy
    redirect_to admin_access_requests_path, notice: 'Access denied'
  end

  private

  def access_request_params
    params.require(:access_request).permit(:status)
  end
end
