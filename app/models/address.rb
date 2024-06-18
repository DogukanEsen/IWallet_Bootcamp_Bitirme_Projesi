class Address < ApplicationRecord
  belongs_to :user
  has_one :geo, dependent: :destroy

  accepts_nested_attributes_for :geo

  validates :street, :suite, :city, :zipcode, presence: true
end
