class Affiliate < ApplicationRecord
    has_many :athletes
    has_many :coaches
    has_secure_password
end
