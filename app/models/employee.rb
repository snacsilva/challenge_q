class Employee < ApplicationRecord
  belongs_to :enterprise
  has_one :leader, dependent: :destroy
  
  validates_uniqueness_of :email
end
