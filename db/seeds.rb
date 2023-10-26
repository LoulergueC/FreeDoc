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

# réinitialiser les tables avant de créer des données en executant une commande dans le terminal
# system("rails db:reset")

# Création des 5 spécialités
5.times do |i|
    spe = ["cardiologue", "ophtalmologue", "urologue", "gynécologue", "médecin général"]
    Speciality.create!(
        name: spe[i]
    )
end

# Création de 10 villes
10.times do |i|
    City.create!(
        name: Faker::Address.city,
        zip: Faker::Address.zip_code
    )
end

# Création de 50 patients et 50 médecins associés à une ville
50.times do |i|
    Patient.create!(
        first_name: Faker::Name.first_name,
        last_name: Faker::Name.last_name,
        city_id: City.all.sample.id
    )
    Doctor.create!(
        first_name: Faker::Name.first_name,
        last_name: Faker::Name.last_name,
        zip_code: Faker::Address.zip_code,
        city_id: City.all.sample.id
    )
end

# Association de quelques spécialités à nos médecins
100.times do |i|
    JoinTableDoctorsSpeciality.create!(
        doctor_id: Doctor.all.sample.id,
        speciality_id: Speciality.all.sample.id
    )
end

# Création de pas beaucoup de rendez-vous
# Ils sont tous malades ou quoi ?
400.times do |i|
    # Récupération d'une ville au hasard pour pouvoir sélectionner des médecins et des patients associés à cette ville
    city = City.all.sample.id

    Appointment.create!(
        city_id: city,
        date: Faker::Date.between(from: Date.today, to: 20.days.from_now),
        doctor_id: Doctor.where(city_id: city).sample.id,
        patient_id: Patient.where(city_id: city).sample.id
    )
end