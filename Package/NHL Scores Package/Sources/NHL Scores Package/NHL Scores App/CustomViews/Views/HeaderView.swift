//
//  HeaderView.swift
//  
//
//  Created by Ilxom on 10/01/23.
//

import UIKit
import SnapKit

final class HeaderView: UIView {
    private lazy var titleLabel = TitleLabel(textAlignment: .left, fontSize: 34)
    private lazy var nhlImageView = UIImageView()
    
    private lazy var headerStackView = StackView(
        arrangedSubviews: [titleLabel, nhlImageView],
        axis: .horizontal,
        alignment: .fill,
        spacing: 8
    )
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        nhlImageView.image = Constants.nhl
        
        addSubview(headerStackView)
        
        nhlImageView.snp.makeConstraints { make in
            make.height.width.equalTo(60)
        }
        
        headerStackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.leading.trailing.equalToSuperview()
        }
        
    }
    
    func set(title: String) {
        titleLabel.text = title
    }
}
