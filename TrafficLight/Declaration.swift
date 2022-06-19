//
//  Declaration.swift
//  TrafficLight
//
//  Created by alexkarav on 17.06.2022.
//

import UIKit

extension UIView {
    func makeCircular () {
        let center:CGPoint = self.center
        self.layer.cornerRadius = min(self.frame.size.height,
                                      self.frame.size.width) / 2.0
        self.center = center
    }
}
