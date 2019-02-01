require_relative('../db/sql_runner.rb')
require_relative('./transaction.rb')
require_relative('./merchant.rb')

class Tag

  attr_reader :id
  attr_accessor :category

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @category = options['category']
  end

  #create
  def save()
    sql = "INSERT INTO tags
           (category)
           VALUES ($1)
           RETURNING id"
    values = [@category]
    tag = SqlRunner.run(sql, values).first
    @id = tag['id'].to_i
  end

  #edit

  #delete

end
