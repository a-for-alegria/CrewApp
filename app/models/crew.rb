class Crew < ActiveRecord::Base
  validates :name, :secondname, presence: true
  has_attached_file :avatar
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

  def combine_names
    a = [] << [self.name, self.secondname]
    a.join(' ')
  end
end
