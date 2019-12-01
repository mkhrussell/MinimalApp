# MinimalApp
A minimal app demonstrating life cycle events of a iOS 13.x app.

For any iOS 13 app, you need an **AppDelegate** and a **SceneDelegate** and then you have to call **UIApplicationMain** function. You need an initial **UIViewController** object which you have to set as **rootViewController** property of the window object of the AppDelegate. In a typical iOS app, most of this work done through configurations burried inside Info.plist file leaving beginners in deep trouble in understanding the insights of the app ie. how it launches, what are the lifecycle events, etc.

In this app, I removed all the configurations and manually created everything needed to make beginners understand the whole app launching process.

1. App's entry point is UIApplicationMain. In 3rd parameter you can pass 'nil' instead of **NSStringFromClass(UIApplication.self)**, passing 'nil' will do the same thing. You can also pass a subclass of UIApplication, it is rarely done.

```swift
UIApplicationMain(
    CommandLine.argc,
    CommandLine.unsafeArgv,
    NSStringFromClass(UIApplication.self),
    NSStringFromClass(AppDelegate.self))
```

2. Your app must has an Application Delegate class (our case AppDelegate) conforming **UIApplicationDelegate** protocol. A valid UISceneConfiguration object must be retured from the lifecycle function: **application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration**. You have to set delegateClass property with your Scene Delegate class (SceneDelegate) conforming **UIWindowSceneDelegate** protocol.

```swift
func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {

    // MARK: Create UISceneConfiguration manually
    let sceneConfiguration = UISceneConfiguration(name: "Default", sessionRole: .windowApplication)
    sceneConfiguration.delegateClass = SceneDelegate.self

    return sceneConfiguration
}
```

3. Create a UIWindow object and set it to SceneDelegate's window property in **scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions)** function. Set the rootViewController property of the window object with an object a **UIViewController** object.

```swift
func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

    guard let windowScene = (scene as? UIWindowScene) else { return }

    // MARK: Create UIWindow and rootViewController manually
    let window = UIWindow(windowScene: windowScene)
    window.frame = windowScene.coordinateSpace.bounds

    let viewController = ViewController()
    window.rootViewController = viewController

    self.window = window
    self.window?.makeKeyAndVisible()
}
```
