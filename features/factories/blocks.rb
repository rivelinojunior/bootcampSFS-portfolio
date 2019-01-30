FactoryBot.define do
  factory :block do
    kind { rand(1..10) }
    side { %i[left right].sample }
    sequence(:position) { |position| position }

    portfolio
  end
end
