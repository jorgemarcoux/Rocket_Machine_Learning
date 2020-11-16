class Column < ApplicationRecord
  belongs_to :battery
  has_many :elevators, :dependent => :delete_all
  has_many :interventions
end