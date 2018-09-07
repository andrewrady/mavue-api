class HeadOfHouse < ApplicationRecord
  belongs_to :user
  has_many :student
end