class House < ActiveRecord::Base
  validates :address, presence: true
  
  has_many :residents,
    class_name: 'Person',
    foreign_key: :person_id,
    primary_key: :id

end
