class Meetup < MotionResource::Base
  attr_accessor :when, :address
  
  self.collection_url = "meetups"
  self.member_url = "meetups/:id"
  
  has_many :talks, lambda { |r| { :meetup_id => r.id } }
end
