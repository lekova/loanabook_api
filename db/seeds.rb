# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
%w(lina jony gruds splica).each do |name|
  email = "#{name}@#{name}.com"
  next if User.exists? email: email
  User.create!(email: email, password: "1234", password_confirmation: "1234", name: name)
end

Book.create!([
  {title: "The Secret", author: "Rhonda Byrne", year: 2006, price: 12.99, url: "http://www.amazon.com/Secret-Rhonda-Byrne/dp/1582701709/ref=sr_1_1?s=books&ie=UTF8&qid=1438223452&sr=1-1&keywords=the+secret"},
  {title: "The Martian", author: "Andy Weir", year: 2014, price: 9.00, url: "http://www.amazon.com/The-Martian-Andy-Weir/dp/0553418025"},
  {title: "The Alchemist", author: "Paulo Coelho", year: 2006, price: 17.14, url: "www.amazon.com/Alchemist-25th-Anniversary-Paulo-Coelho/dp/0062390627"}
  ])

Loan.create!([
  {loaner_id: 1, borrower_id: 2, date_loaned: 20150623, loan_duration: 20},
  {loaner_id: 1, borrower_id: 3, date_loaned: 20150717, loan_duration: 30},
  {loaner_id: 2, borrower_id: 4, date_loaned: 20150531, loan_duration: 14}
])





