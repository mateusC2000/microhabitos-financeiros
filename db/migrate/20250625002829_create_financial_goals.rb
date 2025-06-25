class CreateFinancialGoals < ActiveRecord::Migration[8.0]
  def change
    create_table :financial_goals do |t|
      t.string :title
      t.text :description
      t.decimal :target_value
      t.date :due_date
      t.integer :user_id

      t.timestamps
    end
  end
end
