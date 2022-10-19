puts "🌱 Seeding..."

10.times do 
    company = Company.create(
        name: Faker::Company.name,    
        industry: Faker::Company.industry,
        slogan: Faker::Company.bs,
        logo_url: Faker::Company.logo,
    )

    rand(1..3).times do
        Job.create(
            title: Faker::Job.title,
            position: Faker::Job.position,
            field: Faker::Job.field,
            key_skill: Faker::Job.key_skill,
            employment: Faker::Job.employment_type,
            open: true,
            expired: Faker::Boolean.boolean(true_ratio: 0.2),
            hipster_id: nil,
            company_id: company.id,
        )
    end
end

25.times do 
    hipster = Hipster.create(
        name: Faker::Name.name,      
        bio: Faker::Hipster.sentences,
    )

    rand(1..3).times do
        Job.create(
            title: Faker::Job.title,            
            position: Faker::Job.position,
            field: Faker::Job.field,
            key_skill: Faker::Job.key_skill,
            employment: Faker::Job.employment_type,
            open: false,
            expired: true,
            hipster_id: hipster.id,
            company_id: rand(1..10),
        )
    end
end

puts "✅ Done seeding!"
