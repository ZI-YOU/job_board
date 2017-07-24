class JobsController < ApplicationController
  before_action :find_job, only: [:show, :edit, :update, :destroy]

  def index
  	@jobs = Job.all.order("created_at DESC")
  end

  def show
  	
  end

  def edit
  	
  end

  def update
  	if @job.update(jobs_params)
  	  redirect_to job_path
  	else
  	  render :edit
  	end
  end

  def new
  	@job = Job.new
  end

  def create
  	@job = Job.new(jobs_params)

  	if @job.save
  	  redirect_to @job
  	else
  	  render :new
  	end
  end

  def destroy
  	@job = Job.find(params[:id])
  	@job.destroy
  	redirect_to root_path
  end

  private

  def jobs_params
  	params.require(:job).permit(:title, :description, :url, :company)
  end

  def find_job
  	@job = Job.find(params[:id])
  end
end