class AddressesController < ApplicationController
  before_action :authenticate_user  # First, we use devise to return user to root if they are not authenticated
  before_action :prevent_not_found, :only => [:show, :edit, :update, :destroy]
  load_and_authorize_resource :address #From cancan, it creates a @address object from params[:id]



  def index
    @user_addresses = current_user.addresses
  end

  def new
    @new_address = current_user.addresses.new
  end

  def create
    # TODO: check if address exists in real world with geocoder
    new_address = current_user.addresses.new(address_params)
    new_address.save
    redirect_to action: :index
  end

  def edit
    # TODO: check if user has permission to edit
    # @address=Address.find(params[:id])
  end

  def update
    # TODO: Show error messages in view
    @address=Address.find(params[:id])

    @address.assign_attributes(address_params)

    if @address.save
      redirect_to action: :index
      return
    else
      render action: :edit
      return
    end
  end

  def destroy
    # TODO: Check if user has permission to delete
    # TODO: Notify deletion

    address = Address.find(params[:id])
    address.delete
    redirect_to action: :index
  end

  private
  # Strong parameters for creating/updating addresses.
  def address_params
    params.require(:address).permit(:address, :coverage_type_id)
  end

  protected

  # Prevents record not found. In case the element doesn't exist, it goes back to the beginning
  def prevent_not_found
    address = Address.find(params[:id])
  rescue ActiveRecord::RecordNotFound => e
    redirect_to root_path

  end
end
