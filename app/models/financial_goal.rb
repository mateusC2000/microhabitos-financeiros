class FinancialGoal < ApplicationRecord
  validates :title, :target_value, :due_date, :user_id, presence: true
  validates :target_value, numericality: { greater_than: 0 }
end
