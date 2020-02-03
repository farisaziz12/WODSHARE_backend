class CoachSerializer < ActiveModel::Serializer
    attributes :id, :first_name, :last_name, :email, :account_type, :token
end
