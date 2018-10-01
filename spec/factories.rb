FactoryBot.define do
  factory :list do
    name { Faker::Name.name }
    
    factory :list_with_tasks do
      
      transient do
        tasks_count 5
      end
      
      after(:create) do |list, evaluator|
        FactoryBot.create_list(:task, evaluator.tasks_count, list: list)
      end
    end
  end
  
  factory :task do
    name { Faker::Name.name }
  end
end

#created_users = create_list(:user, 25)