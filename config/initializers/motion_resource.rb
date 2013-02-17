module MotionResource
  class Base
    self.root_url = "http://localhost:3000/"
    self.logger = MotionSupport::NetworkLogger.new
  end
end
