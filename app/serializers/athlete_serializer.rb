class AthleteSerializer < ActiveModel::Serializer
    attributes :first_name, :last_name, :email, :token
  end
  