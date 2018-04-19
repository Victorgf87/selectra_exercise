# This class represents a coverage for directions
class CoverageType < ApplicationRecord
  has_many :addresses # Maybe we will want to use this in the future.
  validates_uniqueness_of :name
end
