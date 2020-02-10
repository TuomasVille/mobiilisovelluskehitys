//
//  Alert.swift
//  SwiftUI Turtle Rock
//
//  Created by Tuomas Käyhty on 20/01/2020.
//  Copyright © 2020 Tuomas Käyhty. All rights reserved.
//

import UIKit

struct Alert {
    static func showAlert(on vc: UIViewController, with title: String, message: String) {
        let alert = UIAlertController(title: "Delete landmark?", message: "Are you sure?", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        vc.present(alert, animated: true)
    }
}
