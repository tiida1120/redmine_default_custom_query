class DefaultCustomQuerySettingController < ApplicationController
  unloadable

  before_filter :find_project_by_project_id
  before_filter :authorize

  def update
    @default_query = ProjectsDefaultQuery.find_or_initialize_by_project_id(@project.id)
    @default_query.safe_attributes = params[:settings]
    @default_query.save

    render partial: 'form'
  end
end
