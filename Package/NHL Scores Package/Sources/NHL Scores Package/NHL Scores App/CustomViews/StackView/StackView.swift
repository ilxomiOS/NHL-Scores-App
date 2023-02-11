//
//  StackView.swift
//  
//
//  Created by Ilxom on 05/01/23.
//

import UIKit

final class StackView: UIStackView { // не перегружаем
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(arrangedSubviews: [UIView],
                     axis: NSLayoutConstraint.Axis,
                     alignment: UIStackView.Alignment,
                     spacing: CGFloat)
    {
        self.init(frame: .zero) // два инита ???
        self.init(arrangedSubviews: arrangedSubviews)
        self.axis = axis
        self.alignment = alignment
        self.spacing = spacing
    }
    
    private func configure() {
        distribution = .fill
//        contentMode = .scaleToFill
    }
}
