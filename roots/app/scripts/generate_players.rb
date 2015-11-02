require 'faker'
require 'URI'
require 'active_support'
require 'active_support/core_ext/hash'

iterations = ARGV[0]

Integer(iterations).times do
  first_name = Faker::Name.first_name
  last_name  = Faker::Name.last_name
  user_name  = Faker::Internet.user_name("#{first_name} #{last_name}", %w(. _ -))
  email      = Faker::Internet.safe_email(user_name)

  `curl http://localhost:3000/players --silent -H "Accept: application/json" -H "Content-type: application/json" -X POST --data '{"utf8":"✓","authenticity_token":"arMehNJQ7H5wRIms85CmDTdQsi8UADva4pQ/nPxFiGk=","player":{"name":"#{first_name} #{last_name}","username":"#{email}","age":"#{Faker::Number.between(18, 80)}","city":"#{Faker::Address.city}","country":"US"},"commit":"Create Player"}'`
end
