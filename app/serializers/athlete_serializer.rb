class AthleteSerializer < ActiveModel::Serializer
    attributes :first_name, :last_name, :email, :account_type, :token
end
  