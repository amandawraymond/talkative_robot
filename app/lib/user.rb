require 'csv'
require 'pry'
require './person'

class User < Person
  def initialize(args)
    super(args)
    @author_capability = false
  end

  def farewell_to_user
    puts """\n\tAnd I know you are busy with your buisness, 
    lot of facets and interesting parties involved, 
    so I'll leave you to it #{@nickname}. Keep abiding!"""
  end
end