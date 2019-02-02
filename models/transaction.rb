require_relative('../db/sql_runner.rb')
require_relative('./tag.rb')
require_relative('./merchant.rb')
require ('pry')

class Transaction

  attr_reader :id, :transaction_date
  attr_accessor :merchant_id, :tag_id, :amount_spent

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @transaction_date = options['transaction_date'] if options['transaction_date']
    @merchant_id = options['merchant_id'].to_i
    @tag_id = options['tag_id'].to_i
    @amount_spent = options['amount_spent'].to_i
  end

  def save()
    sql = "INSERT INTO transactions
    (merchant_id, tag_id, amount_spent)
    VALUES ($1, $2, $3)
    RETURNING transaction_date, id"
    values = [@merchant_id, @tag_id, @amount_spent]
    transaction = SqlRunner.run(sql, values).first
    @transaction_date = transaction['transaction_date']
    @id = transaction['id'].to_i
  end

  def self.delete_all()
    sql = "DELETE FROM transactions"
    SqlRunner.run(sql)
  end

  def delete()
    sql = "DELETE FROM transactions WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.all()
    sql = "SELECT * FROM transactions"
    transactions = SqlRunner.run(sql)
    result = transactions.map { |transaction| Transaction.new(transaction) }
    # binding.pry
    return result
  end

  def self.find(id)
    sql = "SELECT * FROM transactions WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql, values).first
    transaction = Transaction.new(result)
  end

  def update()
      sql = "UPDATE transactions
      SET (merchant_id, tag_id, amount_spent)
       = ($1, $2, $3)
       WHERE id = $4"
      values = [@merchant_id, @tag_id, @amount_spent, @id]
      SqlRunner.run(sql, values)
    end

  def merchant()
    return Merchant.find(@merchant_id)
  end

  def tag()
    return Tag.find(@tag_id)
  end

  def self.total_transactions()
    total = 0
    total_transactions = Transaction.all()
    total_transactions.each { |transaction| total += transaction.amount_spent }
    return total
  end

#budget

end
