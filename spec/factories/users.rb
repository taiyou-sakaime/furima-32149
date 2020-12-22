FactoryBot.define do
  factory :user do
    nickname              {"aaa"}
    email                 {Faker::Internet.free_email}
    password   {"a1a1a1"}
    password_confirmation {password}
    last_name{"山田"}
    first_name{"太郎"}
    last_name_katakana{"ヤマダ"}
    first_name_katakana{"タロウ"}
    birthday{"2000-8-24"}
  end
end