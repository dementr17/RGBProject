//
//  ViewController.swift
//  RGBProject
//
//  Created by Дмитрий Чепанов on 10.12.2021.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    @IBOutlet var rgbView: UIView!
    @IBOutlet weak var redLabel: UILabel!
    @IBOutlet weak var greenLabel: UILabel!
    @IBOutlet weak var blueLabel: UILabel!
    
    private var redColor: CGFloat = 0.5
    private var greenColor: CGFloat = 0.5
    private var blueColor: CGFloat = 0.5
    
    override func viewDidLoad() {
        super.viewDidLoad()

        redSlider.value = 0.5
        redSlider.minimumValue = 0
        redSlider.maximumValue = 1
        redSlider.minimumTrackTintColor = .red
        
        greenSlider.value = 0.5
        greenSlider.minimumValue = 0
        greenSlider.maximumValue = 1
        greenSlider.minimumTrackTintColor = .green
        
        blueSlider.value = 0.5
        blueSlider.minimumValue = 0
        blueSlider.maximumValue = 1
        blueSlider.minimumTrackTintColor = .blue
        //redSlider.value
        //rgbView.backgroundColor = UIColor(red: redColor, green: greenColor, blue: blueColor, alpha: 1)
        //rgbView.backgroundColor = UIColor(red: 0.5, green: 0.5, blue: 1, alpha: 1)
        
        

    }
    @IBAction func choseRed(_ sender: Any) {
        redColor = CGFloat(redSlider.value)
        redLabel.text = String(format:"%.2f", redSlider.value)
        rgbView.backgroundColor = UIColor(red: redColor, green: greenColor, blue: blueColor, alpha: 1)
    }
    @IBAction func choseGreen(_ sender: Any) {
        greenColor = CGFloat(greenSlider.value)
        greenLabel.text = String(format:"%.2f", greenSlider.value)
        rgbView.backgroundColor = UIColor(red: redColor, green: greenColor, blue: blueColor, alpha: 1)
    }
    @IBAction func choseBlue(_ sender: Any) {
        blueColor = CGFloat(blueSlider.value)
        blueLabel.text = String(format:"%.2f", blueSlider.value)
        rgbView.backgroundColor = UIColor(red: redColor, green: greenColor, blue: blueColor, alpha: 1)
    }
    

}
