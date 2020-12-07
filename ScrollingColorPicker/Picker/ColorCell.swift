//
//  ColorCell.swift
//  ScrollingColorPicker
//
//  Created by Richard Stockdale on 06/12/2020.
//

import UIKit

class ColorCell: UICollectionViewCell {
    
    private var centreColor = UIView()
    private var seperatorView = UIView()
    private var ringView = UIView()
    
    private let centreColorViewHeightWidth: CGFloat = 34
    private let separatorHeightWidth: CGFloat = 38
    private let ringViewHeightWidth: CGFloat = 42
    
    func configure(selectableColor: UIColor,
                   backingViewColor: UIColor,
                   selected: Bool) {
        centreColor.backgroundColor = selectableColor
        seperatorView.backgroundColor = backingViewColor
        ringView.backgroundColor = selected ? selectableColor : .clear
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        commonInit()
    }
    
    private func commonInit() {
        backgroundColor = .clear
        
        ringView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(ringView)
        ringView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        ringView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        ringView.heightAnchor.constraint(equalToConstant: ringViewHeightWidth).isActive = true
        ringView.widthAnchor.constraint(equalToConstant: ringViewHeightWidth).isActive = true
        ringView.backgroundColor = .yellow
        
        seperatorView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(seperatorView)
        seperatorView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        seperatorView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        seperatorView.heightAnchor.constraint(equalToConstant: separatorHeightWidth).isActive = true
        seperatorView.widthAnchor.constraint(equalToConstant: separatorHeightWidth).isActive = true
        seperatorView.backgroundColor = .darkGray
        
        centreColor.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(centreColor)
        centreColor.centerXAnchor.constraint(equalTo: seperatorView.centerXAnchor).isActive = true
        centreColor.centerYAnchor.constraint(equalTo: seperatorView.centerYAnchor).isActive = true
        centreColor.heightAnchor.constraint(equalToConstant: centreColorViewHeightWidth).isActive = true
        centreColor.widthAnchor.constraint(equalToConstant: centreColorViewHeightWidth).isActive = true

        centreColor.backgroundColor = .yellow
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        //layer.cornerRadius = bounds.size.width/2
        
        centreColor.layer.cornerRadius = centreColor.frame.size.width/2
        centreColor.clipsToBounds = true
        
        seperatorView.layer.cornerRadius = seperatorView.frame.size.width/2
        seperatorView.clipsToBounds = true
        
        ringView.layer.cornerRadius = ringView.frame.size.width/2
        ringView.clipsToBounds = true
    }

}
