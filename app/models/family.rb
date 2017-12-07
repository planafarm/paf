class Family < ApplicationRecord
  belongs_to :sub_sector
  belongs_to :sector

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
