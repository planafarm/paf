class Agent < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable

  belongs_to :company

  def self.new_with_session(params, _session)
    company_name = params.delete(:company_name)
    record = new(params)
    record.build_company(name: company_name)
    record
  end
end
