# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


#movement seeds

kneepushup = Movement.create(name: "Knee Push-up", description: "", skill_level: "Beginner", category: "Bodyweight", scale_option_id: nil, muscle_group: "Full Body")
pushup = Movement.create(name: "Push-up", description: "", skill_level: "Beginner", category: "Bodyweight", scale_option_id: kneepushup, muscle_group: "Full Body")
burpee = Movement.create(name: "Burpee", description: "", skill_level: "Beginner", category: "Bodyweight", scale_option_id: pushup, muscle_group: "Full Body")
box_stand_ups = Movement.create(name: "Box Stand Ups", description: "", skill_level: "Beginner", category: "Bodyweight", scale_option_id: nil, muscle_group: "Lower Body")
airsquat = Movement.create(name: "Air Squat", description: "", skill_level: "Beginner", category: "Bodyweight", scale_option_id: box_stand_ups, muscle_group: "Lower Body")
dbsnatch = Movement.create(name: "DB Snatch", description: "", skill_level: "Intermediate", category: "Weightlifting", scale_option_id: burpee, muscle_group: "Full Body")
backsquat = Movement.create(name: "Backsquat", description: "", skill_level: "Intermediate", category: "Weightlifting", scale_option_id: airsquat, muscle_group: "Posterior Chain")
frontsquat = Movement.create(name: "Frontsquat", description: "", skill_level: "Intermediate", category: "Weightlifting", scale_option_id: airsquat, muscle_group: "Lower Body")
overheadsquat = Movement.create(name: "Overhead Squat", description: "", skill_level: "Intermediate", category: "Weightlifting", scale_option_id: airsquat, muscle_group: "Full Body")
strictpress = Movement.create(name: "Strict Press", description: "", skill_level: "Beginner", category: "Weightlifting", scale_option_id: pushup, muscle_group: "Upper Body")
pushpress = Movement.create(name: "Push Press", description: "", skill_level: "Intermediate", category: "Weightlifting", scale_option_id: pushup, muscle_group: "Upper Body")
pushjerk = Movement.create(name: "Push Jerk", description: "", skill_level: "Advanced", category: "Weightlifting", scale_option_id: pushup, muscle_group: "Upper Body")
splitjerk = Movement.create(name: "Split Jerk", description: "", skill_level: "Advanced", category: "Weightlifting", scale_option_id: pushup, muscle_group: "Upper Body")
musclesnatch = Movement.create(name: "Muscle Snatch", description: "", skill_level: "Intermediate", category: "Powerlifting", scale_option_id: dbsnatch, muscle_group: "Upper Body")
powersnatch = Movement.create(name: "Power Snatch", description: "", skill_level: "Intermediate", category: "Powerlifting", scale_option_id: dbsnatch, muscle_group: "Full Body")
squatsnatch = Movement.create(name: "Squat Snatch", description: "", skill_level: "Advanced", category: "Powerlifting", scale_option_id: dbsnatch, muscle_group: "Full Body")
thruster = Movement.create(name: "Thruster", description: "", skill_level: "Intermediate", category: "Weightlifting", scale_option_id: airsquat, muscle_group: "Full Body")
ringrow = Movement.create(name: "Ring Row", description: "", skill_level: "Beginner", category: "Gymnastics", scale_option_id: nil, muscle_group: "Upper Body")
pullup = Movement.create(name: "Pull Up", description: "", skill_level: "Beginner", category: "Gymnastics", scale_option_id: ringrow, muscle_group: "Upper Body")






#  Affiliate Seeds
hq = Affiliate.create(name: "HealthQuota", email: "healthquota@gmail.com", location: "Mies", password: "healthquota")

# Coach Seeds
faris = Coach.create(first_name: "Faris", last_name: "Aziz", email: "farisaziz12@gmail.com", password: "faziz", affiliate: hq)

# Athlete Seeds
js = Athlete.create(first_name: "John", last_name: "Smith", email: "john@gmail.com", password: "johnsmith", coach: faris)

# Workout Seeds
wod1 = Workout.create(name: "Fran", wod_type: "Couplet", rep_scheme: "21-15-9", category: "Weightlifting", date: Date.today, score: "6:54", coach: faris, athlete: js)

# WorkoutMovements

wm1 = WorkoutMovement.create(workout: wod1, movement: thruster)
wm2 = WorkoutMovement.create(workout: wod1, movement: pullup)

puts "seeds done"