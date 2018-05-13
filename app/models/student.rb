class Student < ApplicationRecord
  belongs_to :user
  has_many :sales
  has_many :notes
end
