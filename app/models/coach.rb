class Coach < ApplicationRecord
  belongs_to :affiliate, optional: true
  has_many :athletes
  has_secure_password
end
