#This class represents an address with or without coverage in our Application
class Address < ApplicationRecord
  belongs_to :user
  belongs_to :coverage_type, optional: true
  validates_uniqueness_of :address
  validates_presence_of :address


  # Geocoder settings. Using Geocode to store latitude and longitude for future usage.
  geocoded_by :address
  # after_validation :geocode # auto-fetch coordinates. Disabled because of api limit


  # Gets coverage name
  def coverage_name
    has_coverage? ? coverage_type.name : 'No coverage'
  end

  # Gets if has coverage
  def has_coverage?
    !coverage_type.blank?
  end
end
