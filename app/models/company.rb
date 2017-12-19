class Company < ApplicationRecord
  validates :name, presence: true
  has_many :agents, dependent: :destroy
  has_many :suppliers, dependent: :destroy
end
