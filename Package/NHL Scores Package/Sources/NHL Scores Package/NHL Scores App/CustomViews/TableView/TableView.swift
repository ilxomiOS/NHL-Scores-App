//
//  TableView.swift
//  
//
//  Created by Ilxom on 14/01/23.
//

import UIKit

final class TableView: UITableView {
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        backgroundColor = Constants.backdropColor
        separatorStyle = .none
    }
    
}
