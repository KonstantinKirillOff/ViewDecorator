//
//  MainViewController.swift
//  ViewDecorator
//
//  Created by Константин Кириллов on 04.09.2021.
//

import UIKit

protocol DecorateViewControllerDelegate {
    func setNewColor(color: UIColor)
}

class MainViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let decorateVC = segue.destination as? DecoratorViewController else { return }
        decorateVC.mainCVColor = view.backgroundColor
        decorateVC.delegate = self
    
    }
    
}

extension MainViewController: DecorateViewControllerDelegate {
    func setNewColor(color: UIColor) {
        view.backgroundColor = color
    }
}
