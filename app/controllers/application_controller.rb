class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  
  
  get "/" do
    jobs = Job.alpha_order.all     
    jobs.to_json(include: {company: {methods:[:hired_hipsters]}})    
  end  

  post "/jobs" do
    job = Job.create(
      title: params[:title],
      position: params[:position],
      field: params[:field],
      key_skill: params[:key_skill],
      employment: params[:employment],
      open: true, 
      expired: false, 
      hipster_id: nil, 
      company_id: params[:company_id] 
    )
    job.to_json(include: {company: {methods:[:hired_hipsters]}})
  end

  patch '/jobs/:id' do
    job = Job.find(params[:id])
    job.update(
      hipster_id: params[:hipster_id],
      open: false
      )
    job.to_json(include: {company: {methods:[:hired_hipsters]}})
  end

  delete '/jobs/:id' do
    job = Job.find(params[:id])
    job.destroy
    '{"success message": "Job has been deleted"}'
  end

  get '/hipsters' do
    hipsters = Hipster.alpha_order.all
    hipsters.to_json(methods:[:my_companies], include: :jobs)
  end

  
  post '/hipsters' do
    hipster = Hipster.create(
      name: params[:name],
      bio: params[:bio]
    )
    hipster.to_json(methods:[:my_companies], include: :jobs)    
  end
end
