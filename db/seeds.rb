single, multiple, container = Kind.create!([
  { :name => "single" },
  { :name => "multiple" },
  { :name => "container" },
])

State.destroy_all
State.create!([
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

if Rails.env.development?
  region_michigan = Region.create!({:name => "Michigan", :code => "nocode"})

  chapter_gr = Chapter.create!({
    :name => "Greater Grand Rapids Chapter",
    :region => region_michigan,
    :code => "3894023"
  })

  chapter_kzoo = Chapter.create!({
    :name => "Greater Kalamazoo Area Chapter",
    :region => region_michigan,
    :code => "3894023"
  })

  location_gr_church = Location.create!({
    :name => "Fountain Street Church",
    :chapter => chapter_gr,
    :address => "24 Fountain Street NE",
    :city => "Grand Rapids",
    :state => State.find_by_name("Michigan"),
    :zip => "49503",
    :national_shelter_system_identifier => "GR-FSC",
    :picture => File.open(Rails.root.join("db","seed_images","fountain_street.jpg"))
  })

  location_gr_school = Location.create!({
    :name => "Union High School",
    :chapter => chapter_gr,
    :address => "1800 Tremont Boulevard NW",
    :city => "Grand Rapids",
    :state => State.find_by_name("Michigan"),
    :zip => "49504",
    :national_shelter_system_identifier => "GR-UHS",
    :picture => File.open(Rails.root.join("db","seed_images","union_high.jpg"))
  })

  location_kzoo_mission = Location.create!({
    :name => "Kalamazoo Gospel Mission",
    :chapter => chapter_kzoo,
    :address => "448 North Burdick ST",
    :city => "Kalamazoo",
    :state => State.find_by_name("Michigan"),
    :zip => "49007",
    :national_shelter_system_identifier => "KZ-GSM",
    :picture => File.open(Rails.root.join("db","seed_images","kzoo_mission.jpg"))
  })

  # *Defining* a item type of"" "Fire extinguisher"
  # which can have fields of "brand name", and "purchase date"

  fire_extinguisher = ItemTypeDefinition.create!({
    :name => "Fire extinguisher",
    :kind => single
  })

  cardboard_box = ItemTypeDefinition.create!({
    :name => "Cardboard Box",
    :kind => container
  })

  color_field = ItemFieldDefinition.create!({
    :name => "Brand Name",
    :kind => :string,
    :item_type_definition => fire_extinguisher
  })


  purchase_date = ItemFieldDefinition.create!({
    :name => "Purchase Date",
    :kind => :date,
    :item_type_definition => fire_extinguisher
  })

  # *Creating* an item of type "Fire extinguisher"
  # and filling in fields for its "brand name" and "purchase date"
  item = Item.create!({
    :name => "Red Fire Extinguisher",
    :item_type_definition => fire_extinguisher,
    :quantity => 7,
    :current_location => location_gr_church,
    :home_location => location_gr_church
  })


  fridge_box = Item.create!({
    :name => "Refridgerator Box",
    :item_type_definition => cardboard_box,
    :quantity => 1,
    :current_location => location_gr_church,
    :home_location => location_gr_church
  })

  flapjack_box = Item.create!({
    :name => "Flapjack Box",
    :item_type_definition => cardboard_box,
    :quantity => 1,
    :current_location => location_kzoo_mission,
    :home_location => location_kzoo_mission
  })

  # Make a default ADMIN user
  user = User.new(:email => "admin@example.com")
  user.password = "adminpassword"
  user.password_confirmation = "adminpassword"
  user.admin = true
  user.save!

  user = User.new(:email => "member@example.com")
  user.password = "memberpassword"
  user.password_confirmation = "memberpassword"
  user.admin = true
  user.save!
end

