//
//  ScreenManager.swift
//  Created by Srikanth on 01/01/23

import UIKit

enum Storyboard : String {
    case homeSB = "HomeSB"
    case tableviewSB = "TableviewSB"
    case collectionViewSB = "CollectionViewSB"
    case textfieldSB = "TextfieldSB"
}

extension UIViewController {
    class func push(storyboard:Storyboard, properties:[String:Any]? = nil) {
        let controller = ScreenManager.getController(storyboard: storyboard, identifier: Self.className)
        if let properties = properties {
            controller.setValuesForKeys(properties)
        }
        ScreenManager.pushViewController(controller)
    }
    
    class func present(storyboard:Storyboard, properties:[String:Any]? = nil) {
        let controller = ScreenManager.getController(storyboard: storyboard, identifier: Self.className)
        if let properties = properties {
            controller.setValuesForKeys(properties)
        }
        ScreenManager.presentViewController(controller)
    }
    
    class func push<T>(storyboard:Storyboard, getController: @escaping (T) -> T) where T : UIViewController {
        let controller: T = ScreenManager.getController(storyboard: storyboard, identifier: Self.className) as! T
        ScreenManager.pushViewController(getController(controller))
    }
    
    class func present<T>(storyboard:Storyboard, getController: @escaping (T) -> T) where T : UIViewController {
        let controller: T = ScreenManager.getController(storyboard: storyboard, identifier: Self.className) as! T
        ScreenManager.presentViewController(getController(controller))
    }
    
    class func setAsRootController(storyboard:Storyboard, properties: [String:Any]? = nil) {
        let controller = ScreenManager.getController(storyboard: storyboard, identifier: Self.className)
        if let properties = properties {
            controller.setValuesForKeys(properties)
        }
        ScreenManager.resetViewControllers(controller);
    }
}

class ScreenManager {
    static let shared = ScreenManager()
    var navigationController: UINavigationController?
    
    private init() {
     //Singleton class
    }
    
    class func pushViewController(_ controller : UIViewController) {
        shared.navigationController?.pushViewController(controller, animated: true)
    }
    
    class func presentViewController(_ controller : UIViewController) {
        shared.navigationController?.present(controller, animated: true, completion: nil)
    }
    
    class func setAsMainViewController(_ controller: UINavigationController) {
        UIApplication.shared.keyWindow?.rootViewController = controller
        ScreenManager.shared.navigationController = controller
    }
    
    class func resetViewControllers(_ controller: UIViewController) {
        ScreenManager.shared.navigationController?.setViewControllers([controller], animated: false)
    }
}

extension ScreenManager {
    class func getRootViewController() -> UIViewController {
        let navigationController = ScreenManager.getNavigationController(ScreenManager.getController(storyboard: .homeSB))
        shared.navigationController = navigationController;
        return navigationController;
    }
    
    class func getNavigationController(_ viewController: UIViewController? = nil) -> UINavigationController {
        let navController = NavController()
        if let controller = viewController {
            navController.viewControllers = [controller]
        }
        return navController
    }

    class func getController(storyboard:Storyboard, controller:UIViewController) -> UIViewController {
        return self.getController(storyboard: storyboard, identifier: controller.className)
    }
    
    class func getController(storyboard:Storyboard, controllerType:UIViewController.Type) -> UIViewController {
        return self.getController(storyboard: storyboard, identifier: controllerType.className)
    }
    
    class func getController(storyboard:Storyboard, identifier:String) -> UIViewController {
        let storyBoard = UIStoryboard(name: storyboard.rawValue, bundle: Bundle.main)
        return storyBoard.instantiateViewController(withIdentifier: identifier)
    }
    
    class func getController(storyboard:Storyboard) -> UIViewController {
        let storyBoard = UIStoryboard(name: storyboard.rawValue, bundle: Bundle.main)
        return storyBoard.instantiateInitialViewController()!
    }
}
