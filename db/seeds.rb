require_relative('../models/merchant.rb')
require_relative('../models/tag.rb')
require_relative('../models/transaction.rb')
require('pry')


tag1 = Tag.new({'category' => 'groceries'})
tag1.save

binding.pry
nil
