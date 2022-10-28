class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'  
  
  get "/jobs" do
    jobs = Job.alpha_order.all    
    jobs.to_json(include: :hipster)    
  end
  
  post '/hipsters' do
    hipster = Hipster.create(
      name: params[:name],
      bio: params[:bio]
    )
    hipster.to_json    
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
      company_slogan: params[:company_slogan],
      company_logo_url: params[:company_logo_url]
    )
    job.to_json(include: :hipster)
  end

  patch '/jobs/:id' do
    job = Job.find(params[:id])
    job.update(
      hipster_id: params[:hipster_id],
      open: false
      )
    job.to_json(include: :hipster)
  end

  delete '/jobs/:id' do
    job = Job.find(params[:id])
    job.destroy
    '{"success message": "Job has been deleted"}'
  end

  get "/hipsters" do
    hipsters = Hipster.all    
    hipsters.to_json(include: :jobs)    
  end  
end
