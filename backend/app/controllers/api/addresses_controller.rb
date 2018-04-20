class Api::AddressesController < ApplicationController
  protect_from_forgery unless: -> { request.format.json? }

  # Don't know why, but respond_with is not working. I usually use that to only have json in APIs
  # It's working, but usually you had to set protection_from_forgery...
  # params[:address]: search text
  # If address doesn't exist, return 404 code
  # This could be improved by searching for all addresses that match the parameter, but this is fine for the
  # exercise specification
  def search
    # The exercise says the HTML page has to show only if the address has coverage,
    # but I would show what type too

    address = Address.find_by_address(params[:address])

    if address.blank?
      status = :not_found
      ret = {
          status: :not_found,
          message: 'Address not found in the DB',
          has_coverage: nil
      }
    else
      status = :ok
      message = address.has_coverage? ? "Coverage #{address.coverage_name}" : 'No coverage'
      ret = {
          status: :ok,
          message: message,
          has_coverage: address.has_coverage?
      }
    end

    render json: ret, status: status
  end
end
