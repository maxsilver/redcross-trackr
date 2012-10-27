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
    :current_location => location_gr_church
  })


  # Make a default ADMIN user
  user = User.create(:email => "admin@example.com")
<<<<<<< HEAD
  user.password = "adminadmin"
  user.password_confirmation = "adminadmin"
=======
  user.password = "adminpassword"
  user.password_confirmation = "adminpassword"
>>>>>>> Added state seed data. Also made seed passwords long enough to meet
  user.admin = true
  user.save!

  # Make a default MEMBER user
  user = User.create(:email => "member@example.com")
  user.password = "memberpassword"
  user.password_confirmation = "memberpassword"
  user.admin = true
  user.save!

  State.destroy_all
  State.create([
    { :name => 'Alabama', :abbreviation => 'AL'},
    { :name => 'Alaska', :abbreviation => 'AK'},
    { :name => 'Arizona', :abbreviation => 'AZ'},
    { :name => 'Arkansas', :abbreviation => 'AR'},
    { :name => 'California', :abbreviation => 'CA'},
    { :name => 'Colorado', :abbreviation => 'CO'},
    { :name => 'Connecticut', :abbreviation => 'CT'},
    { :name => 'Delaware', :abbreviation => 'DE'},
    { :name => 'District of Columbia', :abbreviation => 'DC'},
    { :name => 'Florida', :abbreviation => 'FL'},
    { :name => 'Georgia', :abbreviation => 'GA'},
    { :name => 'Hawaii', :abbreviation => 'HI'},
    { :name => 'Idaho', :abbreviation => 'ID'},
    { :name => 'Illinois', :abbreviation => 'IL'},
    { :name => 'Indiana', :abbreviation => 'IN'},
    { :name => 'Iowa', :abbreviation => 'IA'},
    { :name => 'Kansas', :abbreviation => 'KS'},
    { :name => 'Kentucky', :abbreviation => 'KY'},
    { :name => 'Louisiana', :abbreviation => 'LA'},
    { :name => 'Maine', :abbreviation => 'ME'},
    { :name => 'Maryland', :abbreviation => 'MD'},
    { :name => 'Massachusetts', :abbreviation => 'MA'},
    { :name => 'Michigan', :abbreviation => 'MI'},
    { :name => 'Minnesota', :abbreviation => 'MN'},
    { :name => 'Mississippi', :abbreviation => 'MS'},
    { :name => 'Missouri', :abbreviation => 'MO'},
    { :name => 'Montana', :abbreviation => 'MT'},
    { :name => 'Nebraska', :abbreviation => 'NE'},
    { :name => 'Nevada', :abbreviation => 'NV'},
    { :name => 'New Hampshire', :abbreviation => 'NH'},
    { :name => 'New Jersey', :abbreviation => 'NJ'},
    { :name => 'New Mexico', :abbreviation => 'NM'},
    { :name => 'New York', :abbreviation => 'NY'},
    { :name => 'North Carolina', :abbreviation => 'NC'},
    { :name => 'North Dakota', :abbreviation => 'ND'},
    { :name => 'Ohio', :abbreviation => 'OH'},
    { :name => 'Oklahoma', :abbreviation => 'OK'},
    { :name => 'Oregon', :abbreviation => 'OR'},
    { :name => 'Pennsylvania', :abbreviation => 'PA'},
    { :name => 'Rhode Island', :abbreviation => 'RI'},
    { :name => 'South Carolina', :abbreviation => 'SC'},
    { :name => 'South Dakota', :abbreviation => 'SD'},
    { :name => 'Tennessee', :abbreviation => 'TN'},
    { :name => 'Texas', :abbreviation => 'TX'},
    { :name => 'Utah', :abbreviation => 'UT'},
    { :name => 'Vermont', :abbreviation => 'VT'},
    { :name => 'Virginia', :abbreviation => 'VA'},
    { :name => 'Washington', :abbreviation => 'WA'},
    { :name => 'West Virginia', :abbreviation => 'WV'},
    { :name => 'Wisconsin', :abbreviation => 'WI'},
    { :name => 'Wyoming', :abbreviation => 'WY'}
  ])
end
