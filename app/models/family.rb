class Family < ApplicationRecord
  belongs_to :sub_sector
  belongs_to :sector
  has_many :products

  def parent
    sub_sector
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
