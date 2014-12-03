class Crew < ActiveRecord::Base
  validates :name, :secondname, presence: true
end
