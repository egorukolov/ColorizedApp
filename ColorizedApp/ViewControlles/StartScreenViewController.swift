//
//  ViewController.swift
//  ColorizedApp
//
//  Created by Egor Ukolov on 05.06.2020.
//  Copyright © 2020 Egor Ukolov. All rights reserved.
//

import UIKit

class StartScreenViewController: UIViewController {

    // MARK: - IB Outlets
    
    @IBOutlet var firstScreenView: UIView!
    
    
    // MARK: - Override Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let newColorVC = segue.destination as! ColorizedViewController
        newColorVC.delegate = self
        
        newColorVC.secondTimeColorView = firstScreenView
    }
}

 


extension StartScreenViewController: ColorizedViewControllerDelegate {
    func saveColor(_ color: UIView) {
        firstScreenView.backgroundColor = color.backgroundColor
    }
}
