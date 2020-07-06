class Contact < ActiveRecord::Base
  # C ontact form validations	
  validates :name, presence: true
  validates :email, presence: true
  validates :comments, presence: true

end