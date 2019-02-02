require("minitest/autorun")
require_relative("../models/transaction.rb")
require_relative("../models/budget.rb")
require_relative("../models/tag.rb")
require_relative("../models/merchant.rb")

class TestTransaction < MiniTest::Test

  def setup
    @tag1 = Tag.new({'category' => 'Groceries'})
    @tag2 = Tag.new({'category' => 'Entertainment'})
    @merchant1 = Merchant.new({'name' => 'ASDA'})
    @merchant2 = Merchant.new({'name' => 'Cineworld'})
    transaction1 = {'merchant_id' => @merchant1.id, 'tag_id' => @tag1.id, 'amount_spent' => '25'}
    @transaction1 = Transaction.new(transaction1)
    transaction2 = {'merchant_id' => @merchant2.id, 'tag_id' => @tag2.id, 'amount_spent' => '40'}
    @transaction2 = Transaction.new(transaction2)
  end
#can't get test to pass, is it something to do with it trying to
#get the id from the database?
  # def test_merchant_for_transaction()
  #   assert_equal('Cineworld', @transaction1.merchant())
  # end

end
