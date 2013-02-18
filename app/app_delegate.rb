class AppDelegate
  attr_reader :window
  
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    return true if RUBYMOTION_ENV == 'test'
    
    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    
    tab_controller = UITabBarController.alloc.init
    tab_controller.setViewControllers([
      MeetupsViewController.alloc.init,
      MyProfileViewController.alloc.init
    ], animated:true)
    
    @window.rootViewController = tab_controller
    
    @window.makeKeyAndVisible
    true
  end
end
