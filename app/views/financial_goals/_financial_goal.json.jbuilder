json.extract! financial_goal, :id, :title, :description, :target_value, :due_date, :user_id, :created_at, :updated_at
json.url financial_goal_url(financial_goal, format: :json)
