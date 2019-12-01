//
//  main.swift
//  MinimalApp
//
//  Created by Kamrul Hasan on 1/12/19.
//  Copyright © 2019 Kamrul Hasan. All rights reserved.
//

import UIKit

// MARK: ViewController
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        print(String(describing: type(of: self)) + "::" + #function)
        
        // MARK: Set background color of the root view of the ViewController
        self.view.backgroundColor = .white
    }

}

// MARK: SceneDelegate
class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

        print(String(describing: type(of: self)) + "::" + #function)

        guard let windowScene = (scene as? UIWindowScene) else { return }

        // MARK: Create UIWindow and rootViewController manually
        let window = UIWindow(windowScene: windowScene)
        window.frame = windowScene.coordinateSpace.bounds

        let viewController = ViewController()
        window.rootViewController = viewController

        self.window = window
        self.window?.makeKeyAndVisible()
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        print(String(describing: type(of: self)) + "::" + #function)
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        print(String(describing: type(of: self)) + "::" + #function)
    }

    func sceneWillResignActive(_ scene: UIScene) {
        print(String(describing: type(of: self)) + "::" + #function)
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        print(String(describing: type(of: self)) + "::" + #function)
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        print(String(describing: type(of: self)) + "::" + #function)
    }

}

// MARK: AppDelegate
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        print(String(describing: type(of: self)) + "::" + #function)

        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {

        print(String(describing: type(of: self)) + "::" + #function)

        // MARK: Create UISceneConfiguration manually
        let sceneConfiguration = UISceneConfiguration(name: "Default", sessionRole: .windowApplication)
        sceneConfiguration.delegateClass = SceneDelegate.self

        return sceneConfiguration
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {

        print(String(describing: type(of: self)) + "::" + #function)

    }

}

// MARK: UIApplicationMain
UIApplicationMain(
    CommandLine.argc,
    CommandLine.unsafeArgv,
    NSStringFromClass(UIApplication.self),
    NSStringFromClass(AppDelegate.self))
