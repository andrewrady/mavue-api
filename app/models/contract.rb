class Contract < ApplicationRecord
  belongs_to :head_of_houses, optional: true
  # serialize :items, Array
end
