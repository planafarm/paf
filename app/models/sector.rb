class Sector < ApplicationRecord
  has_many :sub_sectors, dependent: :destroy
  has_many :families, through: :sub_sectors, dependent: :destroy

  def parent
    nil
  end

  # Allows active_admin to submit json as text and have it stored as json
  def info=(value)
    if value.is_a?(String)
      value = begin
        JSON.parse(value)
      rescue JSON::ParserError
        value
      end
    end
    super(value)
  end
end
