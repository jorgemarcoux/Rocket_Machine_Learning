class CreateInterventions < ActiveRecord::Migration[5.2]
  def change
    create_table :interventions do |t|
      t.integer :author
      t.references :customer, foreign_key: true
      t.references :building, foreign_key: true
      t.references :battery, foreign_key: true
      t.references :column, foreign_key: true
      t.references :elevator, foreign_key: true
      t.references :employee, foreign_key: true
      t.string :start_date_and_time_of_the_intervention
      t.string :end_date_and_time_of_the_intervention
      t.string :result, default: "Incomplete"
      t.text :report
      t.string :status, default: "Pending"

      t.timestamps
    end
  end
end
