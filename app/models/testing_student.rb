class TestingStudent < ApplicationRecord
  belongs_to :student, optional: true
  belongs_to :testing, optional: true
end
