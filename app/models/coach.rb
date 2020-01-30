class Coach < ApplicationRecord
  belongs_to :affiliate, optional: true
  has_many :athletes
  has_secure_password
  validates :email, uniqueness: true

  def token
    JWT.encode({ athlete_id: self.id, account_type: self.account_type }, ENV['NUTRI'])
  end
end
