puts "🌱 Seeding..."

8.times do
    Job.create(
        title: Faker::Job.title,
        position: Faker::Job.position,
        key_skill: Faker::Job.key_skill,
        employment: Faker::Job.employment_type,
        open: true,
        expired: false,
        hipster_id: nil,
        company_name: Faker::Company.name,
        company_slogan: Faker::Company.bs,
        company_logo_url: Faker::Company.logo
    )
end


10.times do 
    hipster = Hipster.create(
        name: Faker::Name.name,      
        bio: Faker::Hipster.sentences,
    )

    rand(1..3).times do
        Job.create(
            title: Faker::Job.title,            
            position: Faker::Job.position,
            key_skill: Faker::Job.key_skill,
            employment: Faker::Job.employment_type,
            open: false,
            expired: true,
            hipster_id: hipster.id,
            company_name: Faker::Company.name,
            company_slogan: Faker::Company.bs,
            company_logo_url: Faker::Company.logo
        )
    end
end

puts "✅ Done seeding!"
