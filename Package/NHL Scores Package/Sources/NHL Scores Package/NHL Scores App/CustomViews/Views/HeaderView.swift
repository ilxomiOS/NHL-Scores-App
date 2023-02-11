//
//  HeaderView.swift
//  
//
//  Created by Ilxom on 10/01/23.
//

import UIKit
import SnapKit

final class HeaderView: UIView { // Здесь правильно что создал отдельное вью
    private lazy var titleLabel = TitleLabel(textAlignment: .left, fontSize: 34)
    private lazy var imageView = UIImageView()
    
    private lazy var headerStackView = StackView( // Зачем lazy из инита все равно дергаешь?
        arrangedSubviews: [titleLabel, imageView],
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
        imageView.image = Constants.nhl
        
        addSubview(headerStackView)
        
        imageView.snp.makeConstraints { make in
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
