class Battery < ApplicationRecord
  belongs_to :building
  has_many :columns, :dependent => :delete_all
  has_many :interventions

  def battery
    return "Battery ##{self.id}"
  end
end