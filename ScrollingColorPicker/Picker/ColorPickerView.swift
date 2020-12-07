//
//  ColorPickerView.swift
//  ScrollingColorPicker
//
//  Created by Richard Stockdale on 06/12/2020.
//

import UIKit

protocol ColorPickerViewDelegate {
    func selectedColor(color: UIColor)
}

class ColorPickerView: UIView {
    
    public var backingColor: UIColor = .systemBackground
    public var delegate: ColorPickerViewDelegate?
    
    private var selectedColorIndex = 0
    
    private let colorPickerCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .clear
        return cv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        colorPickerCollectionView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(colorPickerCollectionView)
        colorPickerCollectionView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        colorPickerCollectionView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        colorPickerCollectionView.heightAnchor.constraint(equalTo: self.heightAnchor).isActive = true
        colorPickerCollectionView.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        
        colorPickerCollectionView.dataSource = self
        colorPickerCollectionView.delegate = self
        colorPickerCollectionView.backgroundColor = .clear
        
        colorPickerCollectionView.register(ColorCell.self, forCellWithReuseIdentifier: "colorCell")
        
        colorPickerCollectionView.showsHorizontalScrollIndicator = false
        colorPickerCollectionView.showsVerticalScrollIndicator = false
    }
}

extension ColorPickerView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedColorIndex = indexPath.row
        let c = SelectableColors.colors [selectedColorIndex]
        delegate?.selectedColor(color: c)
        collectionView.reloadData()
    }
}

extension ColorPickerView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return SelectableColors.colors.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell  = collectionView.dequeueReusableCell(withReuseIdentifier: "colorCell", for: indexPath) as! ColorCell
        let c = SelectableColors.colors[indexPath.row]
        cell.configure(selectableColor: c,
                       backingViewColor: backingColor,
                       selected: indexPath.row == selectedColorIndex)
        
        return cell
    }
}
