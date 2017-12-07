class SubSector < ApplicationRecord
  belongs_to :sector
  has_many :families, dependent: :destroy

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
