class Supplier < ApplicationRecord
  validates :name, presence: true, uniqueness: { scope: :company }
  belongs_to :company
end
