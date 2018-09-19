class HeadOfHouse < ApplicationRecord
  belongs_to :user
  has_many :student
  has_many :contracts, :dependent => :destroy

  # accepts_nested_attributes_for :contracts, allow_destroy: true
end