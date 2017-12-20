class Entry < ApplicationRecord
  belongs_to :agent
  belongs_to :supplier

  validates :index, presence: true
  validates :data, presence: true
end
