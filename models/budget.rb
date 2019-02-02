require_relative('../db/sql_runner.rb')
require_relative('./transaction.rb')
require_relative('./budget.rb')
require ('pry')

class Budget

  attr_reader :id
  attr_accessor :budget

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @budget = options['budget'].to_i
  end

  def save()
    sql = "INSERT INTO budgets
           (budget)
           VALUES ($1)
           RETURNING id"
    values = [@budget]
    budget = SqlRunner.run(sql, values).first
    @id = budget['id'].to_i
  end

  def self.delete_all()
    sql = "DELETE FROM budgets"
    SqlRunner.run(sql)
  end

  def self.all()
    sql = "SELECT * FROM budgets"
    budgets = SqlRunner.run(sql)
    result = budgets.map { |budget| Budget.new(budget) }
    return result
  end

  def update()
      sql = "UPDATE budgets
             SET budget
             = $1 WHERE
             id = $2"
      values = [@budget, @id]
      SqlRunner.run(sql, values)
  end

  def reduce_budget(transaction)
    if @budget >= Transaction.total_transactions
      @budget -= transaction.amount_spent
    end
  end
end
