# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
Company.destroy_all
User.destroy_all
Quote.destroy_all

kpmg = Company.create(name: 'KPMG')
pwc = Company.create(name: 'PwC')

accountant = User.create(email: 'accountant@kpmg.com', password: 'password', company: kpmg)
manager = User.create(email: 'manager@kpmg.com', password: 'password', company: kpmg)
eavesdropper = User.create(email: 'eavesdropper@pwc.com', password: 'password', company: pwc)

first = Quote.create(name: 'First Quote', company: kpmg)
second = Quote.create(name: 'Second Quote', company: kpmg)
third = Quote.create(name: 'Third Quote', company: kpmg)
