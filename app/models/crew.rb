class Crew < ActiveRecord::Base
  validates :name, :secondname, presence: true

  def combine_names
    a = [] << [self.name, self.secondname]
    a.join(' ')
  end
end
