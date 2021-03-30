# frozen_string_literal: true

class JobsController < ApplicationController
  before_action :set_job, only: %i[show edit update destroy]
  before_action :prevent_access, only: %i[ edit update destroy]
  before_action :authenticate_user!

  def index
    @jobs = Job.all 
    @form_filter_path = jobs_filter_path

  end

  def my_jobs_applications 
    
    filter_handler(Job.where("user_id = #{current_user.id}"))

    @form_filter_path= jobs_my_jobs_applications_path
    render :index
  end

  def filter 
    filter_handler(Job.all)
    @form_filter_path = jobs_filter_path

    render :index
  end 

  def filter_handler(obj) 
     @jobs = obj

    if !params[:title].nil? && !params[:description].nil? && params[:title] != '' && params[:description] != '' 
      @jobs = obj.find_by_title_or_description(params)
    elsif !params[:title].nil? && params[:title] != ''
      @jobs = obj.find_by_title(params)
    elsif !params[:description].nil? && params[:description] != ''
      @jobs = obj.find_by_description(params)
    end 

    @jobs
  end

  def new
    @job = Job.new
    @job.build_company
    
  end

  def show; end

  def create
    @job = current_user.jobs.build(job_params)
    
    if @job.save
      flash[:notice] = 'Job was successfully created. '
      redirect_to root_path
    else
      render :new
    end
  end

  def edit; end

  def update
    if @job.update(job_params)
      redirect_to root_path
    else
      render :edit 
    end
  end

  def destroy
    if @job.applications.count > 1 
      flash[:alert] = 'This Job Has other applicants'
    else
      @job.destroy
      flash[:notice] = 'Job was successfully destroyed. '
    end
    redirect_to root_path

  end

  private

  def job_params
    
    params.require(:job).permit(:title, :url, :description, :company_id,
                                company_attributes: [:name])
  end

  def set_job 
 
    @job = Job.find(params[:id])
    
  end

  def prevent_access 
    
    if @job.user_id != current_user.id 
      flash[:alert] = 'You do not have permission to alter this job'
      redirect_to root_path
    end
  end

end
