FactoryBot.define do
  factory :user do
    name {'市川'}
    email {'yoshi@yahoo.ne.jp'}
    password {'123456'}
    admin {true}
  end
  factory :user2 ,class: User do
    name {'よしひろ'}
    email {'yoshi2@yahoo.ne.jp'}
    password {'123456'}
    admin {false}
  end
  factory :user3 ,class: User do
    name {'みき'}
    email {'miki@yahoo.ne.jp'}
    password {'123456'}
    admin {false}
  end
  factory :user4,class: User do
    name {'はるき'}
    email {'haruki@yahoo.ne.jp'}
    password {'123456'}
    admin {false}
  end
end
