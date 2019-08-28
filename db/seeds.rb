specialties = ["neuro", "cardio", "ortho"]

10.times do
  doc = Doctor.create(
    doc_name: Faker::Name.last_name
  )
  
  10.times do
    user = User.create(
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name
      
    )

    Appointment.create(
      specialty: specialties.sample,
      user_id: user.id,
      doctor_id: doc.id
    )
  end
end

puts "Data Seeded"