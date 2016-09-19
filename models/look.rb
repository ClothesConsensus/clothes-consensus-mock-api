require 'active_record'


class Look < ActiveRecord::Base
  default_scope { order('-id') }

  belongs_to :user
  has_many :votes
  
  def vote_results
    {
      yes: votes.where(value: true).count,
      no: votes.where(value: false).count
    }
  end
end