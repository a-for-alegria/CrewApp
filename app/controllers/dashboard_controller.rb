class DashboardController < ApplicationController
  before_action :parce_crew, only: [:main_page]
  before_action :parce_projects, only: [:main_page]

	def main_page
		@project_budget = parce_projects.pluck(:budget).sum
    @crew_rate = parce_crew.pluck(:rate).sum

    @crew = Crew.new
    @project = Project.new

    @projects = current_user.projects
    @crews = current_user.crews
	end

	private

	def parce_projects
    @projects = current_user.projects
  end

  def parce_crew
    @crews = current_user.crews
  end
end
