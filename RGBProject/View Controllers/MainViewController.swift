//
//  MainViewController.swift
//  RGBProject
//
//  Created by Дмитрий Чепанов on 25.12.2021.
//

import UIKit
protocol SettingsViewControllerDelegate {
    func setBackgroundColor(for viewColor: UIColor)
}

class MainViewController: UIViewController {
    
    @IBOutlet var viewMVC: UIView!
    var viewColor: UIColor!
    
    override func viewDidLoad() {
       super.viewDidLoad()
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let settingsVC = segue.destination as? SettingsViewController else { return }
        settingsVC.delegate = self
    }

}

extension MainViewController: SettingsViewControllerDelegate {
    func setBackgroundColor(for viewColor: UIColor) {
        viewMVC.backgroundColor = viewColor
    }
    
}
