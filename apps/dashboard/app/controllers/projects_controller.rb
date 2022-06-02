# frozen_string_literal: true

class ProjectsController < ApplicationController
  # GET /projects/:id
  def show
    @project = Project.find(params[:id])
  end

  # GET /projects
  def index
    @projects = Project.all
  end

  # GET /projects/new
  def new
    if name_or_icon_nil?
      @project = Project.new
    else
      returned_params = { name: params[:name], icon: params[:icon] }
      @project = Project.new(returned_params)
    end
  end

  # GET /projects/:id/edit
  def edit
    @project = Project.find(params[:id])
  end

  # PATCH /projects/:id
  def update
    returned_params = { :id => params[:id], :name => params[:project][:name], :icon => params[:project][:icon], :description => params[:project][:description] }
    @project = Project.new(returned_params)
    Rails.logger.debug('GWB: ' + @project.inspect)

    if @project.valid? && @project.update(project_params)
      redirect_to projects_path, notice: I18n.t('dashboard.jobs_project_manifest_updated')
    else
      flash[:alert] = @project.errors[:name].last || @project.errors[:icon].last
      render :edit
    end
  end

  # POST /projects
  def create
    Rails.logger.debug("Project params are: #{project_params}")
    @project = Project.new(project_params)

    if @project.valid? && @project.save(project_params)
      redirect_to projects_path, notice: I18n.t('dashboard.jobs_project_created')
    else
      flash[:alert] = @project.errors[:name].last || @project.errors[:icon].last
      redirect_to new_project_path(name: params[:project][:name], icon: params[:project][:icon])
    end
  end

  # DELETE /projects/:id
  def destroy
    @project = Project.find(params[:id])

    redirect_to projects_path, notice: I18n.t('dashboard.jobs_project_deleted') if @project.destroy!
  end

  private

  def name_or_icon_nil?
    params[:name].nil? || params[:icon].nil?
  end

  def project_params
    params
      .require(:project)
      .permit(:name, :description, :icon)
  end
end
