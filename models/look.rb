require 'active_record'

require 'pry'

class Look < ActiveRecord::Base
  belongs_to :user
  has_many :votes
  
  def vote_count
    
    
    
    
  end
  
  # def as_json(options={})
  #   {
  #     id: id,
  #     user: user,
  #     image_url: image_url,
  #     quote: quote,
  #     expiration: expiration,
  #     type_index: type_index
  #   }
  #
  # end
end