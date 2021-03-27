# frozen_string_literal: true

class CompaniesController < ApplicationController

  
  def index
    @companies = Company.all
  end

  def new
    @company = Company.new
  end

  def show
    @company = Company.find(params[:id])
  end
end
