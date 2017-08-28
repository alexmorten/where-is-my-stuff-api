class User < ActiveRecord::Base
  # Include default devise modules.
  has_many :items
  has_many :plans
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :trackable, :validatable,
          :confirmable
  include DeviseTokenAuth::Concerns::User
end
