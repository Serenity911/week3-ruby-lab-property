require('pry')
require_relative('model/property')

property1 = Property.new({
  'address' => "7 Castle Terrace",
  'value' => 1000000,
  'number_of_bedrooms' => 15 ,
  'buy_let_status' => "let"
  })

  property2 = Property.new({
    'address' => "17 E Market Street",
    'value' => 800000,
    'number_of_bedrooms' => 2 ,
    'buy_let_status' => "on sale"
    })

Property.delete_all()

property1.save()
property2.save()

binding.pry
nil
