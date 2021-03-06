class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  alias_method :authenticate, :valid_password?

  def self.from_token_payload(payload)
    self.find payload["sub"]
  end

  has_many :student
  has_many :head_of_house
  has_many :inventory
  has_many :testing
  has_many :product
end
