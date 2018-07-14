//
//  AppDelegate.swift
//  ClassKit Research
//


import UIKit

@UIApplicationMain
private final class ApplicationDelegate: UIResponder, UIApplicationDelegate {

    fileprivate lazy var window: UIWindow? = UIWindow(frame: UIScreen.main.bounds)
    
    private var selectModuleViewController: SelectModuleViewController?
    
    private let gameService = GameService()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        selectModuleViewController = SelectModuleViewController(modules: gameService.modules, viewMaker: SelectModuleView())
        window?.rootViewController = selectModuleViewController!
        window?.makeKeyAndVisible()
        return true
    }
    
    func application(_ application: UIApplication, continue userActivity: NSUserActivity, restorationHandler: @escaping ([Any]?) -> Void) -> Bool {
        // TODO 3: Handle deep linking from ClassKit. Use `userActivity.contextIdentifierPath` for getting context path.
        return false
    }
}
