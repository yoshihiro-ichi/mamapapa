FactoryBot.define do
  factory :comment do
    content {'comment1'}
    association :user
    # association :facility
  end
end
