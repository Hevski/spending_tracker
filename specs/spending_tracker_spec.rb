require("minitest/autorun")
require_relative("../transaction.rb")

class TestTransaction < MiniTest::Test

  def setup
    transaction1 = {'merchant_id' => merchant.id, 'tag_id' => tag.id, 'amount_spent' => '25'}
    @transaction1 = Transaction.new(transaction1)
    transaction2 = {'merchant_id' => merchant.id, 'tag_id' => tag.id, 'amount_spent' => '40'}
    @transaction2 = Transaction.new(transaction2)
  end
end
