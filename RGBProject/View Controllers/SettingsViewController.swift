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
    
    var backgroundColor: UIColor!
    var delegate: SettingsViewControllerDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        rgbView.layer.cornerRadius = 10
        rgbView.backgroundColor = UIColor(red: 0.5, green: 0.5, blue: 0.5, alpha: 1)
        
        backgroundViewColor()
        toolbarItems()
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    @IBAction func chooseRGB() {
        backgroundViewColor()
    }
    
    @IBAction func pressedDoneButton(_ sender: Any) {
        delegate.setBackgroundColor(for: backgroundColor)
        dismiss(animated: true)
    }
    
}

extension SettingsViewController: UITextFieldDelegate {
    
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
        
        backgroundColor = UIColor(red: CGFloat(redSlider.value),
                                  green: CGFloat(greenSlider.value),
                                  blue: CGFloat(blueSlider.value),
                                  alpha: 1)
        
        rgbView.backgroundColor = backgroundColor
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        if checkValidation(textField: textField) == true {
            
            doneClicked()
            
            redLabel.text = redTF.text
            greenLabel.text = greenTF.text
            blueLabel.text = blueTF.text
            
            redSlider.value = Float(redTF.text!)!
            greenSlider.value = Float(greenTF.text!)!
            blueSlider.value = Float(blueTF.text!)!
            
            backgroundColor = UIColor(red: CGFloat(redSlider.value),
                                      green: CGFloat(greenSlider.value),
                                      blue: CGFloat(blueSlider.value),
                                      alpha: 1)
            rgbView.backgroundColor = backgroundColor
        }
    }
    
    func toolbarItems() {
        let keyboardToolBar = UIToolbar()
        keyboardToolBar.sizeToFit()
        
        let doneButton = UIBarButtonItem(barButtonSystemItem:
                                            UIBarButtonItem.SystemItem.done,
                                         target: self,
                                         action: #selector(self.doneClicked) )
        
        keyboardToolBar.setItems([doneButton], animated: true)
        
        redTF.inputAccessoryView = keyboardToolBar
        greenTF.inputAccessoryView = keyboardToolBar
        blueTF.inputAccessoryView = keyboardToolBar
    }
    
    @objc func doneClicked() {
        view.endEditing(true)
    }
    
    private func showAlert(title: String,
                           message: String,
                           textField: UITextField? = nil) {
        let alert = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default) { _ in
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
    
    func checkValidation(textField: UITextField) -> Bool {
        
        let validFloat = Float(textField.text!)
        
        if (validFloat != nil) &&
            validFloat! >= 0.0 &&
            validFloat! <= 1.0 {
            return true
        } else {
            showAlert(title: "Error!", message: "Не верный формат", textField: textField)
            return false
        }
    }
}


