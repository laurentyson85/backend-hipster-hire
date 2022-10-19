class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  
  
  get "/" do
    jobs = Job.all 
    jobs.includes(company: :hipsters).to_json(include: {company: {include: :hipsters}})
    #am looking for a company and hipster, so I write it like this so I get ALL the jobs once including ALL the companies and the hipsters. Rather than individual hits to my db
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
