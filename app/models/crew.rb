class Crew < ActiveRecord::Base
  belongs_to :client

  validates :name, :secondname, :rate, presence: true
  has_attached_file :avatar
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
  BANK_CARD_REGEX = /\A\d\d\d\d\s\d\d\d\d\s\d\d\d\d\s\d\d\d\d\z/
  validates :bank_card, allow_blank: true, format: {with: BANK_CARD_REGEX}

  def combine_names
    a = [] << [self.name, self.secondname]
    a.join(' ')
  end
end
