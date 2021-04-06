# frozen_string_literal: true

class ApplicationsController < ApplicationController
  def new
    @job = Job.find_by_id(params[:job_id])
    @application = @job.applications.build

    # An application belongs to a job
  end

  def show
    @application = Application.find(params[:id])
  end

  def index
    @applications = if @job = Job.find_by_id(params[:job_id])
                      @job.applications
                    else
                      Application.all
                    end
  end

  def create
    @application = current_user.applications.build(applications_params)
    if @application.save
      redirect_to application_path(@application)
    else
      render :new
    end
  end

  def destroy
    @application = Application.find(params[:id])
    @application.destroy
    flash[:notice] = 'Application was successfully destroyed. '

    redirect_to applications_path
  end

  private

  def applications_params
    params.require(:application).permit(:job_id, :date_of_application, :notes)
  end
end
