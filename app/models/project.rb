class Project < ActiveRecord::Base
	belongs_to :user
	has_many :crews
    
	validates :client_name, :client_secondname, :budget, :project_name, presence: true

	def combine_names
    (a = [] << [self.client_name, self.client_secondname]).join(' ')
  end
end
