class AthleteSerializer < ActiveModel::Serializer
    attributes :id, :first_name, :last_name, :email, :coach_name, :account_type, :token


    def coach_name
      if object.coach
        object.coach.first_name
      else
        nil
      end
    end
end
  