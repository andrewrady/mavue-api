class TestingStudent < ApplicationRecord
  belongs_to :student
  belongs_to :testing, optional: true
end
