//
//  PermissionAlert.swift
//  Project
//
//  Created by Abu Nabe on 17/8/2022.
//

import UIKit

class PermissionAlert{
    public static func MapPermission(navigationController: UINavigationController)
    {
        let alert = UIAlertController(title: "Allow Location Access", message: "SociRank needs access to your location. Turn on Location Services in your device settings.", preferredStyle: UIAlertController.Style.alert)
        
        // Button to Open Settings
        alert.addAction(UIAlertAction(title: "Settings", style: UIAlertAction.Style.default, handler: { action in
            guard let settingsUrl = URL(string: UIApplication.openSettingsURLString) else {
                return
            }
            if UIApplication.shared.canOpenURL(settingsUrl) {
                UIApplication.shared.open(settingsUrl, completionHandler: { (success) in
                    print("Settings opened: \(success)")
                })
            }
        }))
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
        navigationController.present(alert, animated: true, completion: nil)
    }
    
    public static func SoundPermission(navigationController: UINavigationController)
    {
        let alert = UIAlertController(title: "Allow Library Access", message: "SociRank needs access to your library. Turn on Library Services in your device settings.", preferredStyle: UIAlertController.Style.alert)
        
        // Button to Open Settings
        alert.addAction(UIAlertAction(title: "Settings", style: UIAlertAction.Style.default, handler: { action in
            guard let settingsUrl = URL(string: UIApplication.openSettingsURLString) else {
                return
            }
            if UIApplication.shared.canOpenURL(settingsUrl) {
                UIApplication.shared.open(settingsUrl, completionHandler: { (success) in
                    print("Settings opened: \(success)")
                })
            }
        }))
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
        navigationController.present(alert, animated: true, completion: nil)
    }
    
    public static func MicrophonePermission(navigationController: UINavigationController)
    {
        let alert = UIAlertController(title: "Allow Microphone Access", message: "SociRank needs access to your microphone. Turn on Microphone Services in your device settings.", preferredStyle: UIAlertController.Style.alert)
        
        // Button to Open Settings
        alert.addAction(UIAlertAction(title: "Settings", style: UIAlertAction.Style.default, handler: { action in
            guard let settingsUrl = URL(string: UIApplication.openSettingsURLString) else {
                return
            }
            if UIApplication.shared.canOpenURL(settingsUrl) {
                UIApplication.shared.open(settingsUrl, completionHandler: { (success) in
                    print("Settings opened: \(success)")
                })
            }
        }))
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
        navigationController.present(alert, animated: true, completion: nil)
    }
    
    public static func MediaPermission(navigationController: UINavigationController)
    {
        let alert = UIAlertController(title: "Allow Media Access", message: "SociRank needs access to your media. Turn on Media Services in your device settings.", preferredStyle: UIAlertController.Style.alert)
        
        // Button to Open Settings
        alert.addAction(UIAlertAction(title: "Settings", style: UIAlertAction.Style.default, handler: { action in
            guard let settingsUrl = URL(string: UIApplication.openSettingsURLString) else {
                return
            }
            if UIApplication.shared.canOpenURL(settingsUrl) {
                UIApplication.shared.open(settingsUrl, completionHandler: { (success) in
                    print("Settings opened: \(success)")
                })
            }
        }))
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
        navigationController.present(alert, animated: true, completion: nil)
    }
    public static func CameraPermission(navigationController: UINavigationController)
    {
        let alert = UIAlertController(title: "Allow Camera Access", message: "SociRank needs access to your camera. Turn on Camera Services in your device settings.", preferredStyle: UIAlertController.Style.alert)
        
        // Button to Open Settings
        alert.addAction(UIAlertAction(title: "Settings", style: UIAlertAction.Style.default, handler: { action in
            guard let settingsUrl = URL(string: UIApplication.openSettingsURLString) else {
                return
            }
            if UIApplication.shared.canOpenURL(settingsUrl) {
                UIApplication.shared.open(settingsUrl, completionHandler: { (success) in
                    print("Settings opened: \(success)")
                })
            }
        }))
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
        navigationController.present(alert, animated: true, completion: nil)
    }
}
