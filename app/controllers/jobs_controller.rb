# frozen_string_literal: true

class JobsController < ApplicationController
  def index
    @jobs = Job.all
  end

  def new
    @job = Job.new
  end

  def show
    @job = Job.find(params[:id])
  end

  def create
    @job = Job.create(job_params)

    if @job.save!
      flash[:notice] = 'Job was successfully created. '
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    @job = Job.find(params[:id])
  end

  def update
    @job = Job.find(params[:id])

    if @job.update(job_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    @job = Job.find(params[:id])
    @job.destroy

    redirect_to root_path
  end

  private

  def job_params
    params.require(:job).permit(:title, :url, :description)
  end
end
