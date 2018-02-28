//
//  loadingHUD.swift
//  O3
//
//  Created by Andrei Terentiev on 10/8/17.
//  Copyright © 2017 drei. All rights reserved.
//

import Foundation
import UIKit
import Lottie
import SwiftTheme

class O3HUD: UIViewController {
    public static let sharedInstance = UIStoryboard(name: "O3HUD", bundle: nil).instantiateViewController(withIdentifier: "O3HUD")

    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    @IBOutlet weak var visualEffectView: UIVisualEffectView!
    override func viewDidLoad() {
        if ThemeManager.currentThemeIndex == 0 {
            let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.dark)
            let visualEffectView = UIVisualEffectView(effect: blurEffect)
            visualEffectView.frame = view.bounds
            view.addSubview(visualEffectView)
            view.bringSubview(toFront: indicator)
        } else {
            let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.dark)
            let visualEffectView = UIVisualEffectView(effect: blurEffect)
            visualEffectView.frame = view.bounds
            view.addSubview(visualEffectView)
            view.bringSubview(toFront: indicator)
        }
        indicator.theme_activityIndicatorViewStyle = O3Theme.activityIndicatorColorPicker
        super.viewDidLoad()
    }

    static func start() {
        sharedInstance.modalTransitionStyle = .crossDissolve
        DispatchQueue.main.async {
            UIApplication.shared.keyWindow?.rootViewController?.presentFromEmbedded(sharedInstance, animated: true) {}
        }
    }

    static func stop(completed: @escaping() -> Void) {
        DispatchQueue.main.async {
            sharedInstance.dismiss(animated: true) {
                completed()
            }
        }
    }
}
