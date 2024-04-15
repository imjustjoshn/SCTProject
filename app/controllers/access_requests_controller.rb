class AccessRequestsController < ApplicationController
    before_action :authenticate_user!

    def new
      @access_request = AccessRequest.new
    end

    def create
      @access_request = current_user.access_requests.build(access_request_params)
      @access_request.status = :pending
      if @access_request.save
        flash[:notice] = "Access request submitted successfully."
      else
        flash[:alert] = "Failed to submit access request."
      end
      redirect_to root_path
    end

    def approve
      access_request = AccessRequest.find(params[:id])
      access_request.update(status: :approved)
      access_request.destroy
      redirect_to admin_access_requests_path, notice: 'Access request approved'
    end
  
    def deny
      access_request = AccessRequest.find(params[:id])
      access_request.update(status: :denied)
      access_request.destroy
      redirect_to admin_access_requests_path, notice: 'Access request denied'
    end

    private

    def access_request_params
      params.require(:access_request).permit(:directory_id)
    end
end
