class Crew < ActiveRecord::Base
  belongs_to :user
  belongs_to :project

  #Regular Expressions
  BANK_CARD_REGEX = /\A\d\d\d\d\s\d\d\d\d\s\d\d\d\d\s\d\d\d\d\z/
  DOB_REGEX = /\A\d\d\.\d\d\.\d\d\d\d\z/

  validates :name, :secondname, :rate, :spec, :dob, presence: true
  has_attached_file :avatar
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
  validates :bank_card, allow_blank: true, format: {with: BANK_CARD_REGEX}
  validates :dob, format: {with: DOB_REGEX}

  def combine_names
    a = [] << [self.name, self.secondname]
    a.join(' ')
  end

  def age
    
  end
end
