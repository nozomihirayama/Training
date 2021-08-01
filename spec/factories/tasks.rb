FactoryBot.define do
  factory :task do
    name { 'テストを書く' }
    content { 'RSpec & Capybara & FactoryBotを準備する' }
    status { 'not_started' }
    deadline { Time.zone.today.days_since(1) }
  end
end