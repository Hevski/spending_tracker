require_relative('../models/merchant.rb')
require_relative('../models/tag.rb')
require_relative('../models/transaction.rb')
require_relative('../models/budget.rb')
require('pry')

Tag.delete_all()
Merchant.delete_all()
Transaction.delete_all()
Budget.delete_all()

tag1 = Tag.new({'category' => 'Groceries'})
tag1.save
tag2 = Tag.new({'category' => 'Entertainment'})
tag2.save()
tag3 = Tag.new({'category' => 'Eating Out'})
tag3.save()

merchant1 = Merchant.new({'name' => 'ASDA'})
merchant1.save()
merchant2 = Merchant.new({'name' => 'Cineworld'})
merchant2.save()
merchant3 = Merchant.new({'name' => 'Halloumi'})
merchant3.save()

transaction1 = Transaction.new(
  {'merchant_id' => merchant1.id,
   'tag_id' => tag1.id, 'amount_spent' => '20'})
transaction1.save()

transaction2 = Transaction.new(
  {'merchant_id' => merchant2.id,
   'tag_id' => tag2.id,
   'amount_spent' => '8'})
transaction2.save()

transaction3 = Transaction.new(
  {'merchant_id' => merchant3.id,
   'tag_id' => tag3.id,
   'amount_spent' => '45' })
transaction3.save()

budget = Budget.new(
  {'name' => 'Groceries Budget',
   'budget' => '200',
   'tag_id' => tag1.id})
budget.save()

binding.pry
nil
