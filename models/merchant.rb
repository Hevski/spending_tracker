require_relative('../db/sql_runner.rb')
require_relative('./tag.rb')
require_relative('./transaction.rb')

class Merchant

  attr_reader :id
  attr_accessor :name

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
  end

  def save()
    sql = "INSERT INTO merchants
           (name)
           VALUES ($1)
           RETURNING id"
    values = [@name]
    tag = SqlRunner.run(sql, values).first
    @id = tag['id'].to_i
  end

  def self.delete_all()
    sql = "DELETE FROM merchants"
    SqlRunner.run(sql)
  end

  def delete()
    sql = "DELETE FROM merchants WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.all()
    sql = "SELECT * FROM merchants"
    merchants = SqlRunner.run(sql)
    result = merchants.map { |merchant| Merchant.new(merchant) }
    return result
  end

  def self.find(id)
    sql = "SELECT * FROM merchants WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql, values).first
    merchant = Merchant.new(result)
    return merchant
  end

  def update()
      sql = "UPDATE merchants
             SET name
             = $1 WHERE
             id = $2"
      values = [@name, @id]
      SqlRunner.run(sql, values)
  end

  def transactions_for_merchant()
    sql = "SELECT * from transactions WHERE merchant_id = $1"
    values = [@id]
    transactions = SqlRunner.run(sql, values)
    return transactions.map { |transaction| Transaction.new(transaction) }
  end
end
