require_relative('../db/sql_runner.rb')

class Transactions

  attr_reader :id
  attr_accessor :merchant_id, :tag_id, :date, :amount_spent

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @merchant_id = options['merchant_id'].to_i
    @tag_id = options['tag_id'].to_i
    @date = options['date']
    @amount_spent = options['amount_spent']
end
