class Testing < ApplicationRecord
  belongs_to :user
  has_many :testing_student
  accepts_nested_attributes_for :testing_student
  has_many :testing_instuctor
end
