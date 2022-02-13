class Enterprise < ApplicationRecord
  has_many :employees, dependent: :destroy
end
