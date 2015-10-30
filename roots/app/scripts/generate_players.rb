require 'faker'
require 'mysql2'

iterations = ARGV[0]

Integer(iterations).times do
  puts "#{Faker::Internet.user_name}, #{Faker::Name.name}, #{Faker::Number.between(18, 80)}, #{Faker::Address.city}, #{Faker::Address.country_code}"
end
