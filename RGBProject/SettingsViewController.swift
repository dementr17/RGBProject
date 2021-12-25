//
//  ViewController.swift
//  RGBProject
//
//  Created by Дмитрий Чепанов on 10.12.2021.
//

import UIKit

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    
    @IBOutlet var rgbView: UIView!
    
    @IBOutlet weak var redLabel: UILabel!
    @IBOutlet weak var greenLabel: UILabel!
    @IBOutlet weak var blueLabel: UILabel!
    
    @IBOutlet weak var redTF: UITextField!
    @IBOutlet weak var greenTF: UITextField!
    @IBOutlet weak var blueTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        rgbView.layer.cornerRadius = 10
        rgbView.backgroundColor = UIColor(red: 0.5, green: 0.5, blue: 0.5, alpha: 1)
        
        backgroundViewColor()
        
        
        

    }
    
    @IBAction func chooseRGB() {
        backgroundViewColor()
    }
}

extension SettingsViewController {
    
    private func backgroundViewColor() {
        redLabel.text = String(format:"%.2f", redSlider.value)
        greenLabel.text = String(format:"%.2f", greenSlider.value)
        blueLabel.text = String(format:"%.2f", blueSlider.value)
        
        redSlider.minimumTrackTintColor = .red
        greenSlider.minimumTrackTintColor = .green
        blueSlider.minimumTrackTintColor = .blue
        
        redTF.text = String(format:"%.2f", redSlider.value)
        greenTF.text = String(format:"%.2f", greenSlider.value)
        blueTF.text = String(format:"%.2f", blueSlider.value)
        
        rgbView.backgroundColor = UIColor(red: CGFloat(redSlider.value),
                                          green: CGFloat(greenSlider.value),
                                          blue: CGFloat(blueSlider.value),
                                          alpha: 1)
    }
}
