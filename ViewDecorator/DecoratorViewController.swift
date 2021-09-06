//
//  ViewController.swift
//  ViewDecorator
//
//  Created by Константин Кириллов on 22.08.2021.
//

import UIKit

class DecoratorViewController: UIViewController {
    
    @IBOutlet weak var mainView: UIView!
    
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    
    @IBOutlet weak var redValueLabel: UILabel!
    @IBOutlet weak var greenValueLabel: UILabel!
    @IBOutlet weak var blueValueLabel: UILabel!

    @IBOutlet weak var redColorValueTF: UITextField!
    @IBOutlet weak var greenColorValueTF: UITextField!
    @IBOutlet weak var blueColorValueTF: UITextField!
    
    var mainCVColor: UIColor!
    var delegate: DecorateViewControllerDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainView.layer.cornerRadius = 10
        
        redColorValueTF.delegate = self
        greenColorValueTF.delegate = self
        blueColorValueTF.delegate = self
        
        guard let mainCVColor = mainCVColor else { return }
        redSlider.setValue(Float(CIColor(color: mainCVColor).red), animated: false)
        greenSlider.setValue(Float(CIColor(color: mainCVColor).green), animated: false)
        blueSlider.setValue(Float(CIColor(color: mainCVColor).blue), animated: false)

        setParemeters(for: redValueLabel, greenValueLabel, blueValueLabel)
        collectColor()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }

    @IBAction func sliderValueChanged(_ sender: UISlider) {
        switch sender {
        case redSlider:
            setParemeters(for: redValueLabel)
        case greenSlider:
            setParemeters(for: greenValueLabel)
        default:
            setParemeters(for: blueValueLabel)
        }
        collectColor()
    }
    
    @IBAction func doneDuttonPressed() {
        delegate.setNewColor(color: mainView.backgroundColor ?? mainCVColor)
        dismiss(animated: true)
    }
    
}

// MARK: - Privet functions
extension DecoratorViewController {
    private func collectColor() {
        mainView.backgroundColor = UIColor(red: CGFloat(redSlider.value),
                                 green: CGFloat(greenSlider.value),
                                 blue: CGFloat(blueSlider.value),
                                 alpha: CGFloat(1))
    }
    
    private func string(from slider: UISlider) -> String {
        String(format: "%.2f", slider.value)
    }
    
    private func setParemeters(for labels: UILabel...) {
        labels.forEach { label in
            switch label {
            case redValueLabel:
                redValueLabel.text = string(from: redSlider)
                redColorValueTF.text = string(from: redSlider)
            case greenValueLabel:
                greenValueLabel.text = string(from: greenSlider)
                greenColorValueTF.text = string(from: greenSlider)
            default:
                blueValueLabel.text = string(from: blueSlider)
                blueColorValueTF.text = string(from: blueSlider)
            }
        }
    }
}


// MARK: - UITextFieldDelegate
extension DecoratorViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        guard let newValue = textField.text else { return }
        guard let numberValue = Float(newValue) else { return }
        
        if textField == redColorValueTF {
            redSlider.setValue(numberValue, animated: false)
            setParemeters(for: redValueLabel)
        } else if textField == greenColorValueTF {
            greenSlider.setValue(numberValue, animated: false)
            setParemeters(for: greenValueLabel)
        } else {
            blueSlider.setValue(numberValue, animated: false)
            setParemeters(for: blueValueLabel)
        }
        
        collectColor()
    }
}
