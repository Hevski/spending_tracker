require_relative('../db/sql_runner.rb')
require_relative('./transaction.rb')
require_relative('./budget.rb')
require ('pry')

class Budget

  attr_reader :id
  attr_accessor :budget, :name, :tag_id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @budget = options['budget'].to_i
    @tag_id = options['tag_id'].to_i
    #@budget = 0???
  end

  def save()
    sql = "INSERT INTO budgets
           (name, budget, tag_id)
           VALUES ($1, $2, $3)
           RETURNING id"
    values = [@name, @budget, @tag_id]
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
             SET (name, budget, tag_id)
             = ($1, $2, $3) WHERE
             id = $4"
      values = [@name, @budget, @tag_id, @id]
      SqlRunner.run(sql, values)
  end

  def self.find(id)
    sql = "SELECT * FROM budgets WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql, values).first
    budget = Budget.new(result)
    return budget
  end

  def tag()
    return Tag.find(@tag_id)
  end

  def self.total_budget()
    total = 0
    total_budget = Budget.all()
    total_budget.each { |budget| total += budget.budget }
    return total
  end

  def individual_budget
  end

end
