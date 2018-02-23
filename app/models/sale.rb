class Sale < ApplicationRecord
  belongs_to :student
  serialize :items, Array
end
