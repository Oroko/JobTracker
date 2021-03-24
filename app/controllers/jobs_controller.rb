# frozen_string_literal: true

class JobsController < ApplicationController
  before_action :set_job, only: %i[show edit update destroy]
  before_action :authenticate_user!, except: %i[index show]
  def index
    @jobs = Job.all
  end

  def new
    @job = Job.new
  end

  def show; end

  def create
    @job = Job.create(job_params)

    if @job.save!
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
    @job.destroy
    flash[:notice] = 'Job was successfully destroyed. '
    redirect_to root_path
  end

  private

  def job_params
    params.require(:job).permit(:title, :url, :description)
  end

  def set_job
    @job = Job.find(params[:id])
  end
end
