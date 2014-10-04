require 'faker'

25.times do 
  Wiki.create!(
    title:     Faker::Lorem.sentence,
    body:      Faker::Lorem.paragraph
    )
end
wikis = Wiki.all 

puts "Seed finished"
puts "#{Wiki.count} wikis created"
