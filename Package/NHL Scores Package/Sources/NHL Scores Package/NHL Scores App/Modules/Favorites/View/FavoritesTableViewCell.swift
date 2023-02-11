//
//  FavoritesTableViewCell.swift
//  
//
//  Created by Ilxom on 14/01/23.
//

import UIKit

final class FavoritesTableViewCell: UITableViewCell {
    
    static let reuseId = String(describing: FavoritesTableViewCell.self)
    
    private lazy var homeTeamImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        return imageView
    }()
    
    private lazy var awayTeamImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        return imageView
    }()
    
    private lazy var homeTeamLabel = BodyLabel()
    private lazy var awayTeamLabel = BodyLabel()
    private lazy var homeTeamScoreLabel = BodyLabel()
    private lazy var awayTeamScoreLabel = BodyLabel()
    
    private lazy var homeTeamStackView = StackView(
        arrangedSubviews: [homeTeamImageView, homeTeamLabel],
        axis: .vertical,
        alignment: .fill,
        spacing: 8
    )
    
    private lazy var awayTeamStackView = StackView(
        arrangedSubviews: [awayTeamImageView, awayTeamLabel],
        axis: .vertical,
        alignment: .fill,
        spacing: 8
    )
    
    private lazy var scoresStackView = StackView(
        arrangedSubviews: [homeTeamScoreLabel, awayTeamScoreLabel],
        axis: .horizontal,
        alignment: .fill,
        spacing: 8
    )
    
    private lazy var rootStackView = StackView( // тебе  не надо lazy ты все иницилизирешь в init
        arrangedSubviews: [homeTeamStackView, scoresStackView, awayTeamStackView],
        axis: .horizontal,
        alignment: .fill,
        spacing: 45
    )
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let bottomSpace = 10.0
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 0, left: 0, bottom: bottomSpace, right: 0))
    }
    
    private func setupCell() {
        backgroundColor = Constants.backdropColor
        contentView.backgroundColor = .white
        contentView.layer.cornerRadius = 7
        selectionStyle = .none
        
        configureRootStackView()
    }
    
    private func configureRootStackView() {
        contentView.addSubview(rootStackView)
        
        homeTeamImageView.snp.makeConstraints { make in
            make.width.height.equalTo(40)
        }
        
        awayTeamImageView.snp.makeConstraints { make in
            make.width.height.equalTo(40)
        }
        
        rootStackView.snp.makeConstraints { make in
            make.center.equalTo(snp.center)
        }
    }
    
}

extension FavoritesTableViewCell {
    func showFavoritesGames(_ model: FavoriteGame) {
        homeTeamImageView.image = UIImage(named: model.homeTeam ?? "nhl", in: Bundle.module, with: .none)
        awayTeamImageView.image = UIImage(named: model.awayTeam ?? "nhl", in: Bundle.module, with: .none)
        
        homeTeamLabel.text = model.homeTeam
        awayTeamLabel.text = model.awayTeam
        
        homeTeamScoreLabel.text = String(model.homeTeamScore)
        awayTeamScoreLabel.text = String(model.awayTeamScore)
    }
}
