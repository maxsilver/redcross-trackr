# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

if Rails.env.development?
  region_michigan = Region.create({:name => "Michigan"})

  chapter_gr = Chapter.create({
    :name => "Greater Grand Rapids Chapter",
    :region => region_michigan
  })
  chapter_kzoo = Chapter.create({
    :name => "Greater Kalamazoo Area Chapter",
    :region => region_michigan
  })


  location_gr_church = Location.create({
    :name => "Fountain Street Church",
    :chapter => chapter_gr
  })
  location_gr_school = Location.create({
    :name => "Uniton High School",
    :chapter => chapter_gr
  })


  location_kzoo_mission = Location.create({
    :name => "Kalamazoo Gospel Mission",
    :chapter => chapter_gr
  })


end