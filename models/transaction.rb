require_relative('../db/sql_runner.rb')
require_relative('./tag.rb')
require_relative('./merchant.rb')

class Transactions

  attr_reader :id
  attr_accessor :transaction_date, :merchant_id, :tag_id, :amount_spent

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @transaction_date = options['date'].to_char if options['date']
    @merchant_id = options['merchant_id'].to_i
    @tag_id = options['tag_id'].to_i
    @amount_spent = options['amount_spent']
end
end
