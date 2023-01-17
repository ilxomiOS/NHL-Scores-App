//
//  ScheduleTableViewCell.swift
//  
//
//  Created by Ilxom on 13/01/23.
//

import UIKit

final class ScheduleTableViewCell: UITableViewCell {
    static let reuseId = String(describing: ScheduleTableViewCell.self)
    
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
    private lazy var statusLabel = BodyLabel()
    
    private lazy var versusLabel: BodyLabel = {
        let bodyLabel = BodyLabel()
        bodyLabel.text = "VS"
        return bodyLabel
    }()
    
    private lazy var homeTeamStackView = StackView(
        arrangedSubviews: [homeTeamImageView, homeTeamLabel, homeTeamScoreLabel],
        axis: .vertical,
        alignment: .center,
        spacing: 8
    )
    
    private lazy var awayTeamStackView = StackView(
        arrangedSubviews: [awayTeamImageView, awayTeamLabel, awayTeamScoreLabel],
        axis: .vertical,
        alignment: .center,
        spacing: 8
    )
    
    private lazy var rootStackView = StackView(
        arrangedSubviews: [homeTeamStackView, versusLabel, awayTeamStackView],
        axis: .horizontal,
        alignment: .center,
        spacing: 35
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
        let bottomSpace = 15.0
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 0, left: 0, bottom: bottomSpace, right: 0))
    }
    
    private func setupCell() {
        backgroundColor = Constants.backdropColor
        contentView.backgroundColor = .white
        contentView.layer.cornerRadius = 20
        selectionStyle = .none
        
        configureRootStackView()
        configureStatusLabel()
    }
    
    private func configureRootStackView() {
        contentView.addSubview(rootStackView)
        
        homeTeamImageView.snp.makeConstraints { make in
            make.width.height.equalTo(75)
        }
        awayTeamImageView.snp.makeConstraints { make in
            make.width.height.equalTo(75)
        }
        
        rootStackView.snp.makeConstraints { make in
            make.center.equalTo(snp.center)
        }
    }
    
    private func configureStatusLabel() {
        contentView.addSubview(statusLabel)
        statusLabel.snp.makeConstraints { make in
            make.centerX.equalTo(snp.centerX)
            make.top.equalTo(rootStackView.snp.bottom).offset(8)
        }
    }
}

extension ScheduleTableViewCell {
    
    func showSchedule(_ model: ScheduleViewModel) {
        homeTeamImageView.image = UIImage(named: model.homeTeam, in: Bundle.module, with: .none)
        awayTeamImageView.image = UIImage(named: model.awayTeam, in: Bundle.module, with: .none)
        
        homeTeamLabel.text = model.homeTeam
        awayTeamLabel.text = model.awayTeam
        
        statusLabel.text = model.status
        if statusLabel.text == "Scheduled" {
            if let dateTime = model.dateTime {
                statusLabel.text? += " @ " + DateHelper.getTimeString(time: dateTime)
            } else {
                statusLabel.text = "Cancelled"
            }
        }
        
        if let homeTeamScore = model.homeTeamScore,
           let awayTeamScore = model.awayTeamScore
        {
            homeTeamScoreLabel.text = String(homeTeamScore)
            awayTeamScoreLabel.text = String(awayTeamScore)
        } else {
            homeTeamScoreLabel.text = "-"
            awayTeamScoreLabel.text = "-"
        }
        
    }
}
