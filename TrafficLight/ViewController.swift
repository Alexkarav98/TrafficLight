//
//  ViewController.swift
//  TrafficLight
//
//  Created by alexkarav on 17.06.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var redView: UIView!
    @IBOutlet weak var yellowView: UIView!
    @IBOutlet weak var greenView: UIView!
    
    @IBOutlet weak var button: UIButton!
    
    private var currentLightColor = CurrentLightColor.red
    private let offLight: CGFloat = 0.3
    private let turnOn: CGFloat = 1
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //MARK: buttonSetUp
        button.setTitle(buttonName.START.rawValue, for: .normal)
        button.layer.cornerRadius = 3
        //MARK: redViewSetUp
        redView.makeCircular()
        redView.alpha = offLight
        //MARK: yellowViewSetUp
        yellowView.makeCircular()
        yellowView.alpha = offLight
        //MARK: greenViewSetUp
        greenView.makeCircular()
        greenView.alpha = offLight
    }

    @IBAction func buttonTapped(_ sender: Any) {
            switch currentLightColor {
            case .red:
                greenView.alpha = offLight
                redView.alpha = turnOn
                currentLightColor = .yellow
            case .yellow:
                redView.alpha = offLight
                yellowView.alpha = turnOn
                currentLightColor = .green
            case .green:
                yellowView.alpha = offLight
                greenView.alpha = turnOn
                currentLightColor = .red
            }
        
        if button.currentTitle == buttonName.START.rawValue  {
            button.setTitle(buttonName.NEXT.rawValue, for: .normal)
        }
    }
}

private enum buttonName: String {
    case START = "START"
    case NEXT = "NEXT"
}

enum CurrentLightColor {
    case red, yellow, green
}


extension UIView {
    func makeCircular () {
        let center:CGPoint = self.center
        self.layer.cornerRadius = min(self.frame.size.height,
                                      self.frame.size.width) / 2.0
        self.center = center
    }
}

