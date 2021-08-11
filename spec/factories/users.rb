FactoryBot.define do

  factory :user do
    nickname              {"tarou"}
    email                 {"sample@gmail.com"}
    password    {"123a45"}
    password_confirmation {password}
    family_name           {"山田"}
    family_name_reading      {"ヤマダ"}
    first_name            {"太郎"}
    first_name_reading       {"タロウ"}
    birth_date             {"2000-01-01"}
  end

end
