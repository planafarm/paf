class Sector < ApplicationRecord
  has_many :sub_sectors, dependent: :destroy
  has_many :families, through: :sub_sectors, dependent: :destroy

  # Allows active_admin to submit json as text and have it stored as json
  def info=(value)
    value = begin
      JSON.parse(value)
    rescue JSON::ParserError
      value
    end
    super(value)
  end
end
