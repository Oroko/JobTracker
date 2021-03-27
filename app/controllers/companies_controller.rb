# frozen_string_literal: true

class CompaniesController < ApplicationController
  before_action :set_company, only: %i[show edit update destroy]
  before_action :authenticate_user!

  def index
    @companies = Company.all
  end

  def new
    @company = Company.new
  end

 def show; end

  # def create
  #   @company = current_user.company.build(job_params)
    
  #   if @job.save!
  #     flash[:notice] = 'Job was successfully created. '
  #     redirect_to root_path
  #   else
  #     render :new
  #   end
  # end

  # def edit; end

  # def update
  #   if @company.update(company_params)
  #     redirect_to root_path
  #   else
  #     render :edit
  #   end
  # end

  def destroy
    @company.destroy
    flash[:notice] = 'company was successfully destroyed. '
    redirect_to companies_path
  end

  private

  # def company_params
  #   params.require(:company).permit(:name, :location, :description, :company_id,
  #                               company_attributes: [:name])
  # end

  def set_company
    @company = Company.find(params[:id])
  end
end
