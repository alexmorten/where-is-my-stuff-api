class Plan < ApplicationRecord
  has_many :items
  belongs_to :user
end
