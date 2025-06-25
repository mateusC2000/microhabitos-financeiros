FactoryBot.define do
  factory :financial_goal do
    title { "Guardar dinheiro" }
    description { "Economizar para uma viagem" }
    target_value { 1000.0 }
    due_date { 1.month.from_now }
    user_id { 1 }
  end
end
