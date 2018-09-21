class Student < ApplicationRecord
  belongs_to :user
  belongs_to :head_of_houses, optional: true
  has_many :sales
  has_many :notes
end
