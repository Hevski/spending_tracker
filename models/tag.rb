require_relative('../db/sql_runner.rb')

class Tag

  attr_reader :id
  attr_accessor :category

  def initialize(options)
    @id = options['id']to_i if options['id']
    @category = options['category']
  end

  #create

  #edit

  #delete

end
