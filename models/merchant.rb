require_relative('../db/sql_runner.rb')
require_relative('./tag.rb')
require_relative('./transaction.rb')

class Merchant

  attr_reader :id
  attr_accessor :name

  def initialize(options)
    @id = options['id'].to_i() if options['id']
    @name = options['name']
  end


end
