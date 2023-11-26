class Address < ApplicationRecord
  belongs_to :user
  validates :name, :street, :neighborhood, :number, :zipcode, :city, :state, presence: true

end
