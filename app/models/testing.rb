class Testing < ApplicationRecord
  belongs_to :user

  has_many :testing_student, :dependent => :destroy
  accepts_nested_attributes_for :testing_student
  has_many :testing_instructor, :dependent => :destroy
  accepts_nested_attributes_for :testing_instructor
end
