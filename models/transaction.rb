require_relative('../db/sql_runner.rb')
require_relative('./tag.rb')
require_relative('./merchant.rb')

class Transaction

  attr_reader :id, :transaction_date
  attr_accessor :merchant_id, :tag_id, :amount_spent

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @transaction_date = options['date'] if options['date']
    @merchant_id = options['merchant_id'].to_i
    @tag_id = options['tag_id'].to_i
    @amount_spent = options['amount_spent']
  end

  def save()
    sql = "INSERT INTO transactions
    (merchant_id, tag_id, amount_spent)
    VALUES ($1, $2, $3)
    RETURNING id, transaction_date"
    values = [@merchant_id, @tag_id, @amount_spent]
    transaction = SqlRunner.run(sql, values).first
    @id = transaction['id'].to_i
    @transaction_date = transaction['transaction_date']
  end

  def self.delete_all()
    sql = "DELETE FROM transactions"
    SqlRunner.run(sql)
  end

  def self.all()
    sql = "SELECT * FROM transactions"
    transactions = SqlRunner.run(sql)
    result = transactions.map { |transaction| Transaction.new(transaction) }
    return result
  end

  # def self.find(transaction_date)
  #   sql = "SELECT * FROM transactions WHERE transaction_date = $1"
  #   values = [transaction_date]
  #   result = SqlRunner.run(sql, values).first
  #   transaction_date = Transaction.new(result)
  # end

  def self.find(id)
    sql = "SELECT * FROM transactions WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql, values).first
    transaction = Transaction.new(result)
  end

end
