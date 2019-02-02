require_relative('../db/sql_runner.rb')
require_relative('./transaction.rb')
require_relative('./merchant.rb')
require_relative('./budget.rb')

class Tag

  attr_reader :id
  attr_accessor :category

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @category = options['category']
  end
#check that tag exists? if exists don’t add - sql save statement?
  def save()
    sql = "INSERT INTO tags
           (category)
           VALUES ($1)
           RETURNING id"
    values = [@category]
    tag = SqlRunner.run(sql, values).first
    @id = tag['id'].to_i
  end

  def self.delete_all()
    sql = "DELETE FROM tags"
    SqlRunner.run(sql)
  end

def delete()
  sql = "DELETE FROM tags WHERE id = $1"
  values = [@id]
  SqlRunner.run(sql, values)
end

def self.all()
  sql = "SELECT * FROM tags"
  tags = SqlRunner.run(sql)
  result = tags.map { |tag| Tag.new(tag) }
  return result
end

def self.find(id)
  sql = "SELECT * FROM tags WHERE id = $1"
  values = [id]
  result = SqlRunner.run(sql, values).first
  tag = Tag.new(result)
  return tag
end

def update()
    sql = "UPDATE tags
           SET category
           = $1 WHERE
           id = $2"
    values = [@category, @id]
    SqlRunner.run(sql, values)
  end

  def transactions_for_tag()
    sql = "SELECT * from transactions WHERE tag_id = $1"
    values = [@id]
    transactions = SqlRunner.run(sql, values)
    return transactions.map { |transaction| Transaction.new(transaction) }
  end
end
