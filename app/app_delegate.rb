class AppDelegate
  attr_reader :window
  
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    NUISettings.initWithStylesheet("Theme")
    NUIAppearance.init
    
    Parse.setApplicationId("pznw7QpAXyEfocAf7Gw5xK9sGt9vfLevNO25Ocvs", clientKey:"FX069U8ZDAJdSpEKub1PDMdGJL5TRrcSgqEMDU2e")
    
    return true if RUBYMOTION_ENV == 'test'
    
    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    
    tab_controller = UITabBarController.alloc.init
    tab_controller.setViewControllers([
      UINavigationController.alloc.initWithRootViewController(MeetupsViewController.alloc.init),
      MyProfileViewController.alloc.init
    ], animated:true)
    
    @window.rootViewController = tab_controller
    
    @window.makeKeyAndVisible
    true
  end
end
