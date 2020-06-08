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
        if let newColorVC = segue.destination as? ColorizedViewController {
            newColorVC.secondTimeColorView = self.view.backgroundColor
            newColorVC.delegate = self
            
            
        }
    }
}

extension StartScreenViewController: ColorizedViewControllerDelegate {
    func saveColor(_ color: UIColor) {
        self.firstScreenView.backgroundColor = color
    }
}
