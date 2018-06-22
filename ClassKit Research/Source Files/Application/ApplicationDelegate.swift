//
//  AppDelegate.swift
//  ClassKit Research
//


import UIKit

@UIApplicationMain
private final class ApplicationDelegate: UIResponder, UIApplicationDelegate {

    fileprivate lazy var window: UIWindow? = UIWindow(frame: UIScreen.main.bounds)

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

        let introductionViewController = IntroductionViewController(viewMaker: IntroductionView())
        window?.rootViewController = introductionViewController
        window?.makeKeyAndVisible()
        
        return true
    }
}
