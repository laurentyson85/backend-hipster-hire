class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'    


  get '/hire_data' do 
    hipsters = JSON.parse(Hipster.all.to_json(include: :jobs))
    jobs = Job.where(hipster_id: nil)
    {
      hipsters: hipsters,
      jobs: jobs
    }.to_json
  end
  
  post "/jobs" do
    job = Job.create(
      title: params[:title],
      position: params[:position],
      key_skill: params[:key_skill],
      employment: params[:employment],
      open: true, 
      expired: false, 
      hipster_id: nil, 
      company_name: params[:company_name],
      company_slogan: Faker::Company.bs,
      company_logo_url: Faker::Company.logo
    )
    job.to_json(include: :hipster)
  end

  patch '/jobs/:id' do
    job = Job.find(params[:id])    
    job.update(
      hipster_id: params[:hipster_id],
      open: false
      )    
    hipster = JSON.parse(Hipster.find(params[:hipster_id]).to_json(include: :jobs))
    {
      hipster: hipster,
      job: job
    }.to_json
  end

  delete '/jobs/:id' do
    job = Job.find(params[:id])
    job.destroy
    job.to_json
  end  
  
  post '/hipsters' do
    hipster = Hipster.create(
      name: params[:name],
      bio: params[:bio]
    )
    hipster.to_json(include: :jobs)
  end

end
