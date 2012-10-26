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
    :name => "Union High School",
    :chapter => chapter_gr
  })


  location_kzoo_mission = Location.create({
    :name => "Kalamazoo Gospel Mission",
    :chapter => chapter_gr
  })


  # *Defining* a item type of "Fire extinguisher"
  # which can have fields of "brand name", and "purchase date"
  fire_extinguisher = ItemTypeDefinition.create({
    :name => "Fire extinguisher"
  })
  color_field = ItemFieldDefinition.create({
    :label => "Brand Name",
    :type => :string,
    :item_type_definition => fire_extinguisher
  })
  purchase_date = ItemFieldDefinition.create({
    :label => "Purchase Date",
    :type => :date,
    :item_type_definition => fire_extinguisher
  })

  # *Creating* an item of type "Fire extinguisher"
  # and filling in fields for its "brand name" and "purchase date"
  item = Item.create({
    :item_type_definition => fire_extinguisher,
    :quantity => 7,
    :location => location_gr_church
  })


end
