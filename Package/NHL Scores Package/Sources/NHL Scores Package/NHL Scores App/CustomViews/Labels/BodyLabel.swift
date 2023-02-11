//
//  BodyLabel.swift
//  
//
//  Created by Ilxom on 05/01/23.
//

import UIKit

extension UILabel {
    enum Nhl {
        func makeLabel() -> UILabel {
            let label = UILabel()
            label.textColor = .label
            label.font = UIFont.preferredFont(forTextStyle: .body)
            label.adjustsFontForContentSizeCategory = true
            label.adjustsFontSizeToFitWidth = true
            label.minimumScaleFactor = 0.75
            label.lineBreakMode = .byWordWrapping
            label.textColor = .lightGray
            return label
        }
    }
}

final class BodyLabel: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    convenience init(textAlignment: NSTextAlignment) {
//        self.init(frame: .zero)
//        self.textAlignment = textAlignment
//    }
    
    private func configure() {
        textColor = .label
        font = UIFont.preferredFont(forTextStyle: .body)
        adjustsFontForContentSizeCategory = true
        adjustsFontSizeToFitWidth = true
        minimumScaleFactor = 0.75
        lineBreakMode = .byWordWrapping
    }
    
    func set(text: String, textColor: UIColor) {
        self.text = text
        self.textColor = textColor
    }
}
