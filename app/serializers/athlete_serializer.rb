class AthleteSerializer < ActiveModel::Serializer
    attributes :id, :first_name, :last_name, :email, :coach_name, :coach_last_name, :account_type, :token, :deadlift, :clean_and_jerk, :strict_press, :snatch, :backsquat


    def coach_name
      if object.coach
        object.coach.first_name
      else
        nil
      end
    end

    def coach_last_name
      if object.coach
        object.coach.last_name
      else
        nil
      end
    end
end
  