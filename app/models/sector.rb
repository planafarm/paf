class Sector < ApplicationRecord
  has_many :sub_sectors, dependent: :destroy
  has_many :families, through: :sub_sectors, dependent: :destroy
end
