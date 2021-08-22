//
//  ViewController.swift
//  ViewDecorator
//
//  Created by Константин Кириллов on 22.08.2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    
    @IBOutlet weak var redValueLabel: UILabel!
    @IBOutlet weak var greenValueLabel: UILabel!
    @IBOutlet weak var blueValueLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainView.layer.cornerRadius = 10
        collectColor(for: mainView)
    }

    @IBAction func redSliderChanged() {
        redValueLabel.text = String(round(redSlider.value * 100) / 100)
        collectColor(for: mainView)
    }
    
    @IBAction func greenSliderChanged() {
        greenValueLabel.text = String(round(greenSlider.value * 100) / 100)
        collectColor(for: mainView)
    }
    
    @IBAction func blueSliderChanged() {
        blueValueLabel.text = String(round(blueSlider.value * 100) / 100)
        collectColor(for: mainView)
    }
    
}

// MARK: - Privet functions
extension ViewController {
    private func collectColor(for view: UIView) {
        let totalColor = UIColor(red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: CGFloat(1))
        
        view.backgroundColor = totalColor
    }
    
}
