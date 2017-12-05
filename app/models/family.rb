class Family < ApplicationRecord
  belongs_to :sub_sector
  belongs_to :sector
end
