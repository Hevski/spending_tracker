require_relative('../db/sql_runner.rb')
require_relative('./transaction.rb')
require_relative('./budget.rb')
require ('pry')

class Budget

  attr_reader :id
  attr_accessor :budget, :name

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @budget = options['budget'].to_i
    #@budget = 0???
  end

  def save()
    sql = "INSERT INTO budgets
           (name, budget)
           VALUES ($1, $2)
           RETURNING id"
    values = [@name, @budget]
    budget = SqlRunner.run(sql, values).first
    @id = budget['id'].to_i
  end

  def self.delete_all()
    sql = "DELETE FROM budgets"
    SqlRunner.run(sql)
  end

  def delete()
    sql = "DELETE FROM budgets WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.all()
    sql = "SELECT * FROM budgets"
    budgets = SqlRunner.run(sql)
    result = budgets.map { |budget| Budget.new(budget) }
    return result
  end

  def update()
      sql = "UPDATE budgets
             SET (name, budget)
             = ($1, $2) WHERE
             id = $3"
      values = [@name, @budget, @id]
      SqlRunner.run(sql, values)
  end

  def self.find(id)
    sql = "SELECT * FROM budgets WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql, values).first
    budget = Budget.new(result)
    return budget
  end

  # def reduce_budget(transaction)
  #   if @budget >= Transaction.total_transactions
  #     @budget -= transaction.amount_spent
  #   end
  # end
  #
  # def self.total_budget()
  #   new_budget = 0
  #   total_budget = Budget.all()
  #   total_budget.each { |budget| new_budget += budget.budget }
  #   #binding.pry
  #   return new_budget
  # end
end
