import UIKit
import Flutter
import GoogleMaps

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)
    GMSServices.provideAPIKEY("AIzaSyAP1uEEA8U0pAIT77iv0QXM2HhBE3iuu70")
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
