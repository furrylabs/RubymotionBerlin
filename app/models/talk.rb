class Talk < MotionResource::Base
  attr_accessor :meetup_id, :author_id, :title, :description
  
  self.collection_url = "meetups/:meetup_id/talks"
  self.member_url = "meetups/:meetup_id/talks/:id"
  
  belongs_to :meetup
end
