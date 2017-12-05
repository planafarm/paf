class Product < ApplicationRecord
  belongs_to :sub_sector
  belongs_to :sector
  belongs_to :family
end
