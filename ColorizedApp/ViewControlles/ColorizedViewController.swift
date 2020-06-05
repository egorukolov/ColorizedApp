//
//  ColorizedViewController.swift
//  ColorizedApp
//
//  Created by Egor Ukolov on 05.06.2020.
//  Copyright © 2020 Egor Ukolov. All rights reserved.
//

import UIKit

class ColorizedViewController: UIViewController {

     @IBOutlet weak var colorView: UIView!
        
        @IBOutlet weak var redLabel: UILabel!
        @IBOutlet weak var greenLabel: UILabel!
        @IBOutlet weak var blueLabel: UILabel!
        
        @IBOutlet weak var redSlider: UISlider!
        @IBOutlet weak var greenSlider: UISlider!
        @IBOutlet weak var blueSlider: UISlider!
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            colorView.layer.cornerRadius = 15
            
            redSlider.tintColor = .red
            greenSlider.tintColor = .green
            
            setColor()
            setValue(for: redLabel, greenLabel, blueLabel)
        }
        
        // Изменение цветов слайдерами
        @IBAction func rgbSlider(_ sender: UISlider) {
            switch sender.tag {
            case 0: redLabel.text = string(from: sender)
            case 1: greenLabel.text = string(from: sender)
            case 2: blueLabel.text = string(from: sender)
            default: break
            }
            
            setColor()
        }
        
        private func setColor() {
            colorView.backgroundColor = UIColor(red: CGFloat(redSlider.value),
                                                green: CGFloat(greenSlider.value),
                                                blue: CGFloat(blueSlider.value),
                                                alpha: 1)
        }
        
        private func setValue(for labels: UILabel...) {
            labels.forEach { label in
                switch label.tag {
                case 0: redLabel.text = string(from: redSlider)
                case 1: greenLabel.text = string(from: greenSlider)
                case 2: blueLabel.text = string(from: blueSlider)
                default: break
                }
            }
        }
        
        private func string(from slider: UISlider) -> String {
            String(format: "%.2f", slider.value)
        }
    }

