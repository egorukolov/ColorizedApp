//
//  ColorizedViewController.swift
//  ColorizedApp
//
//  Created by Egor Ukolov on 05.06.2020.
//  Copyright © 2020 Egor Ukolov. All rights reserved.
//

import UIKit

protocol CurrentColorProtocol {
    var currentColor: UIView! { get }
}

protocol ColorizedViewControllerDelegate {
    func saveColor(_ color: UIView)
}

class ColorizedViewController: UIViewController, CurrentColorProtocol, UITextFieldDelegate {

    // MARK: - IB Outlets
    
    @IBOutlet weak var colorView: UIView!
    
    @IBOutlet weak var redLabel: UILabel!
    @IBOutlet weak var greenLabel: UILabel!
    @IBOutlet weak var blueLabel: UILabel!
    
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    
    @IBOutlet var redTextField: UITextField!
    @IBOutlet var greenTextField: UITextField!
    @IBOutlet var blueTextField: UITextField!
    
    var secondTimeColorView: UIView!
    
    var currentColor: UIView! {
        colorView
    }
    
    var delegate: ColorizedViewControllerDelegate!
    
    // MARK: - Override Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        colorView.layer.cornerRadius = 15
        
        redSlider.tintColor = .red
        greenSlider.tintColor = .green
        
        setColor()
        
        
        setValue(for: redLabel, greenLabel, blueLabel)
        
        setValueForTextField(for: redTextField, greenTextField, blueTextField)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
        
    }
    
    // MARK: - IB Actions
    
    // Изменение цветов слайдерами
    @IBAction func rgbSlider(_ sender: UISlider) {
        switch sender.tag {
            
        case 0: redLabel.text = string(from: sender);
                redTextField.text = string(from: sender)
            
        case 1: greenLabel.text = string(from: sender);
                greenTextField.text = string(from: sender)
            
        case 2: blueLabel.text = string(from: sender);
                blueTextField.text = string(from: sender)
        
        default: break
        }
        
        setColor()
    }
    

    // метод для передачи вносимых значений в слайдеры и лейблы
    
     func textFieldDidEndEditing(_ textField: UITextField) {
      
    }
    
    
    @IBAction func valuesTextField(_ sender: UITextField) {
        switch sender.tag {
            
        case 0: redLabel.text = sender.text;
        redSlider.value = Float(sender.text!)!
            
        case 1: greenLabel.text = sender.text;
        greenSlider.value = Float(sender.text!)!
            
        case 2: blueLabel.text = sender.text;
        blueSlider.value = Float(sender.text!)!
            
        default: break
        }
        
        setColor()
    }
    
    @IBAction func doneButton(_ sender: UIButton) {
        delegate.saveColor(currentColor)
        dismiss(animated: true)
    }
    
    
    // MARK: - Private Methods
    
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
    
    private func setValueForTextField(for texts: UITextField...) {
            texts.forEach { text in
                switch text.tag {
                case 0: redTextField.text = string(from: redSlider)
                case 1: greenTextField.text = string(from: greenSlider)
                case 2: blueTextField.text = string(from: blueSlider)

                default: break
                }
            }
        }
        

    private func string(from slider: UISlider) -> String {
        String(format: "%.2f", slider.value)
    }
   
}

