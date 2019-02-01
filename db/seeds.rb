require_relative('../models/merchant.rb')
require_relative('../models/tag.rb')
require_relative('../models/transaction.rb')
require('pry')

Tag.delete_all()

tag1 = Tag.new({'category' => 'Groceries'})
tag1.save
tag2 = Tag.new({'category' => 'Entertainment'})
tag2.save()
tag3 = Tag.new({'category' => 'Eating Out'})
tag3.save()


binding.pry
nil
