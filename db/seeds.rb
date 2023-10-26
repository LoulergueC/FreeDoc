# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
require "faker"

# Patient.destroy_all
# Doctor.destroy_all
# Appointement.destroy_all

# 50.times do |i|
#     Patient.create!(
#         first_name: Faker::Name.first_name,
#         last_name: Faker::Name.last_name
#     )
#     Doctor.create!(
#         first_name: Faker::Name.first_name,
#         last_name: Faker::Name.last_name,
#         speciality: Faker::Job.field,
#         zip_code: Faker::Address.zip_code
#     )
# end

# 400.times do |i|
#     Appointment.create!(
#         date: Faker::Date.between(from: 2.days.ago, to: Date.today),
#         doctor_id: Doctor.all.sample.id,
#         patient_id: Patient.all.sample.id
#     )
# end

# 50.times do |i|
#     City.create!(
#         name: Faker::Address.city,
#         zip: Faker::Address.zip_code
#     )
# end

400.times do |i|
    Doctor.all.sample.update!(
        city_id: City.all.sample.id
    )
    Patient.all.sample.update!(
        city_id: City.all.sample.id
    )
    Appointment.all.sample.update!(
        city_id: City.all.sample.id
    )
end