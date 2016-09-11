require 'active_record'


class Look < ActiveRecord::Base

  belongs_to :user
  has_many :votes
  
  def vote_results
    {
      yes: rand(100),
      no: rand(50)
    }
  end
end