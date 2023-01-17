//
//  StandingsTableViewCell.swift
//  
//
//  Created by Ilxom on 10/01/23.
//

import UIKit
import SnapKit

final class StandingsTableViewCell: UITableViewCell {
    
    static let reuseId = String(describing: StandingsTableViewCell.self)
    
    private lazy var teamLogoImageVIew: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        return imageView
    }()
    
    private lazy var teamLabel = BodyLabel()
    private lazy var winsLabel = BodyLabel()
    private lazy var lossesLabel = BodyLabel()
    
    private lazy var teamStackView = StackView(
        arrangedSubviews: [teamLogoImageVIew, teamLabel],
        axis: .horizontal,
        alignment: .fill,
        spacing: 16
    )
    
    private lazy var scoreStackView = StackView(
        arrangedSubviews: [winsLabel, lossesLabel],
        axis: .horizontal,
        alignment: .fill,
        spacing: 0
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
        selectionStyle = .none
        contentView.layer.cornerRadius = 7
        
        configureTeamStackView()
        configureScoreStackView()
    }
    
    private func configureTeamStackView() {
        contentView.addSubview(teamStackView)
        
        teamLogoImageVIew.snp.makeConstraints { make in
            make.width.height.equalTo(30)
        }
        
        teamStackView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(16)
            make.leading.equalToSuperview().offset(16)
        }
    }
    
    private func configureScoreStackView() {
        contentView.addSubview(scoreStackView)
        scoreStackView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().inset(8)
        }
    }
}

extension StandingsTableViewCell {
    func showStandings(_ teams: StandingsViewModel) {
        teamLogoImageVIew.image = UIImage(named: teams.key, in: Bundle.module, with: .none)
        teamLabel.text = teams.name
        winsLabel.text = "\(String(teams.wins)) - "
        lossesLabel.text = String(teams.losses)
    }
}
