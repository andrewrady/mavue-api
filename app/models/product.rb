class Product < ApplicationRecord
  belongs_to :user
  has_many :subscription, :dependent => :destroy
end
