class SubSector < ApplicationRecord
  belongs_to :sector
  has_many :families, dependent: :destroy
end
