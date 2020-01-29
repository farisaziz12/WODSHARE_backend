class Athlete < ApplicationRecord
  belongs_to :coach, optional: true
  has_many :workouts
  has_secure_password
  validates :email, uniqueness: true

  def token
    JWT.encode({ athlete_id: self.id }, ENV['NUTRI'])
end
end
