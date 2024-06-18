class Company < ApplicationRecord
  belongs_to :user

  validates :name, :catchPhrase, :bs, presence: true

end
