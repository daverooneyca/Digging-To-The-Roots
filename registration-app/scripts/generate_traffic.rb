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
  message    = Faker::Lorem.paragraphs(6).join(" ")

  `curl http://localhost:3000/register --silent -H "Accept: application/json" -H "Content-type: application/json" -X POST --data '{"name":"#{first_name} #{last_name}","email":"#{email}"}'`
  `curl http://localhost:3000/contact --silent -H "Accept: application/json" -H "Content-type: application/json" -X POST --data '{"name":"#{first_name} #{last_name}","email":"#{email}","message":"#{message}"}'`
end
