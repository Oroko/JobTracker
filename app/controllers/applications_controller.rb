class ApplicationsController < ApplicationController
  
  def new 
    @job = Job.find_by_id(params[:job_id])
    @application = @job.applications.build

    #An application belongs to a job
  end 

  def index 

  end
end
