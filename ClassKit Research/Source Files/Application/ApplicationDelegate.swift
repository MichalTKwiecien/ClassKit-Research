//
//  AppDelegate.swift
//  ClassKit Research
//


import UIKit

@UIApplicationMain
private final class ApplicationDelegate: UIResponder, UIApplicationDelegate {

    fileprivate lazy var window: UIWindow? = UIWindow(frame: UIScreen.main.bounds)
    
    private let gameService = GameService()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

        let availableModules = [gameService.easyMathModule]
        
        let introductionViewController = SelectModuleViewController(modules: availableModules, viewMaker: SelectModuleView())
        
        window?.rootViewController = introductionViewController
        window?.makeKeyAndVisible()
        return true
    }
}
