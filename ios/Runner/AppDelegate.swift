import UIKit
import Flutter
import Firebase
import GoogleMaps

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    //    FirebaseApp.configure()
    if FirebaseApp.app() == nil {
        FirebaseApp.configure()
    }
    GMSServices.provideAPIKey("AIzaSyBwwj11idF4yUphzqDx87Z-NjmA-huZ1Zk")
    GeneratedPluginRegistrant.register(with: self)

    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
