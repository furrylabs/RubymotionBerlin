def Reachability.reachable?
  true
end

MotionResource::Base.logger = MotionSupport::NetworkLogger.new
