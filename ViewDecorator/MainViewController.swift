//
//  MainViewController.swift
//  ViewDecorator
//
//  Created by Константин Кириллов on 04.09.2021.
//

import UIKit

protocol DecorateViewControllerDelegate {
    func setNewColor(_ color: UIColor)
}

class MainViewController: UIViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let decorateVC = segue.destination as? DecoratorViewController else { return }
        decorateVC.mainCVColor = view.backgroundColor
        decorateVC.delegate = self
    }
}

extension MainViewController: DecorateViewControllerDelegate {
    func setNewColor(_ color: UIColor) {
        view.backgroundColor = color
    }
}
