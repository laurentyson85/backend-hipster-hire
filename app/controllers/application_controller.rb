class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  
  get "/" do
    jobs = Job.all
    jobs.to_json
    # jobs.to_json#(include: { companies: { include: :hipsters } }) 
  end

  post "/jobs" do
    job = Job.create(
      title: params[:title],
      position: params[:position],
      field: params[:field],
      key_skill: params[:key_skill],
      employment_type: params[:employment_type],
      open: true, #having true here to start will work, right?
      expired: false, #having false here to start will work, right?
      hipster_id: nil, #having nil here to start will work, right?
      company_id: params[:company_id] #on the frontend, somehow will need to make sure I grab the id of the company creating the job
    )
    job.to_json
  end

  post '/hipsters' do
    hipster = Hipster.create(
      name: params[:name],
      bio: params[:bio]
    )
    hipster.to_json
  end

  patch '/jobs/:id' do
    job = Job.find(params[:id])
    job.update(
      hipster_id: params[:hipster_id] #on the frontend, somehow will need to make sure I grab the id of the hipster being hired
    )
    job.to_json
  end

  delete '/jobs/:id' do
    job = job.find(params[:id])
    job.destroy
    job.to_json #do I need to have this line here? Should I send a confirmation to the frontend or something?
  end
end
