class Meetup < MotionResource::Base
  attr_accessor :when, :address
  
  self.collection_url = "meetups"
  self.member_url = "meetups/:id"
end
