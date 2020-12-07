//
//  ViewController.swift
//  ScrollingColorPicker
//
//  Created by Richard Stockdale on 06/12/2020.
//

import UIKit

class ViewController: UIViewController, ColorPickerViewDelegate {
    
    @IBOutlet weak var colorPickerView: ColorPickerView!
    @IBOutlet weak var pickedColor: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        colorPickerView.delegate = self
        colorPickerView.backingColor = view.backgroundColor!
    }
    
    func selectedColor(color: UIColor) {
        pickedColor.backgroundColor = color
    }
    


}

