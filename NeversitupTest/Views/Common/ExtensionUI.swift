//
//  ExtensionUI.swift
//  NeversitupTest
//
//  Created by Piyathida Buathad on 15/5/2567 BE.
//

import Foundation
import UIKit

extension UIView {
    func setBorderAndRadius() {
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.black.cgColor
        self.layer.cornerRadius = 10.0
    }
}
