class Client < ActiveRecord::Base
	has_many :crews
    
	validates :client_name, :client_secondname, :project, presence: true

	def combine_names
    a = [] << [self.client_name, self.client_secondname]
    a.join(' ')
  end
end
