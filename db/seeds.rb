# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)
Group.create(:name => "sample")
User.create(:login => "foo", :password => "bar", :password_confirmation => "bar", :name => "hogehoge", :role => 0)
