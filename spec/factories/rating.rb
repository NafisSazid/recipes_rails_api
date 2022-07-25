FactoryBot.define do
  factory :rating do
    score { rand(0..5) }
    recipe
    user
  end
end
