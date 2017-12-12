class Entry < ApplicationRecord
  belongs_to :user

  validates :index, presence: true
  validates :data, presence: true
end
