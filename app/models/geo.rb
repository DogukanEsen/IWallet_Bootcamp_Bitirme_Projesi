class Geo < ApplicationRecord
  belongs_to :address

  validates :lat, :lng, presence: true

end
