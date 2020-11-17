class Change < ActiveRecord::Migration[5.2]
  def change
    remove_column :interventions, :start_date_and_time_of_the_intervention, :string
    remove_column :interventions, :end_date_and_time_of_the_intervention, :string
    add_column :interventions, :start_date_and_time_of_the_intervention, :datetime
    add_column :interventions, :end_date_and_time_of_the_intervention, :datetime
  end
end
