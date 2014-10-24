# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).


['admin', 'user'].each do |role|
  Role.create({name: role})
end

admin = User.create(:password  => "adminadmin", :password_confirmation  => "adminadmin", :role_id  => 1, :email  => "admin@ukr.net", :remember_me => false, :confirmed_at => (DateTime.now - 2.years))
puts 'CREATED ADMIN USER: ' << admin.email