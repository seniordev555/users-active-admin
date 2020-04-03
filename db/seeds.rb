# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
if Rails.env.development?
  if (!AdminUser.exists?)
    AdminUser.create!(
      email: 'admin@example.com',
      password: 'password',
      password_confirmation: 'password',
      first_name: 'Admin',
      last_name: 'Example'
    )
  end

  if (!Genre.exists?)
    5.times do
      Genre.create!(name: Faker::Book.unique.genre)
    end
  end
end
