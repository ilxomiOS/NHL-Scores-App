//
//  StandingsView.swift
//  
//
//  Created by Ilxom on 05/01/23.
//

import UIKit
import SnapKit

protocol StandingsViewProtocol: AnyObject {
    func getStandings(_ teams: [StandingsViewModel])
}

final class StandingsView: UIView {
    
    private lazy var headerElements = HeaderView()
    private lazy var teamLabel = BodyLabel()
    private lazy var winLossesLabel = BodyLabel()
    private lazy var tableView = TableView()
    private lazy var infoStackView = StackView(arrangedSubviews: [teamLabel, winLossesLabel], axis: .horizontal, alignment: .fill, spacing: 90)
    
    private let datasource = StandingsDataSource()
    
    init() {
        super.init(frame: .zero)
        setupView()
        configureTableView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        backgroundColor = Constants.backdropColor
        
        configureHeaderElements()
        configureinfoStackView()
        setupTableViewConstraints()
    }
    
    private func configureHeaderElements() {
        addSubview(headerElements)
        headerElements.set(title: "Standings")
        headerElements.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide).offset(8)
            make.leading.trailing.equalTo(layoutMarginsGuide)
        }
    }
    
    private func configureinfoStackView() {
        teamLabel.set(text: "Team", textColor: .lightGray)
        winLossesLabel.set(text: "W - L", textColor: .lightGray)
        addSubview(infoStackView)
        infoStackView.snp.makeConstraints { make in
            make.top.equalTo(headerElements.snp.bottom).offset(8)
            make.leading.trailing.equalToSuperview().inset(24)
        }
    }
    
    private func setupTableViewConstraints() {
        addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.top.equalTo(infoStackView.snp.bottom).offset(8)
            make.leading.trailing.equalTo(layoutMarginsGuide)
            make.bottom.equalTo(snp.bottomMargin)
        }
    }
    
    private func configureTableView() {
        tableView.dataSource = datasource
        tableView.delegate = self
        tableView.register(StandingsTableViewCell.self, forCellReuseIdentifier: StandingsTableViewCell.reuseId)
    }
}

extension StandingsView: StandingsViewProtocol {
    func getStandings(_ teams: [StandingsViewModel]) {
        datasource.teams = teams
        tableView.reloadData()
    }
}

extension StandingsView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        70
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.transform = CGAffineTransform(translationX: tableView.bounds.width, y: 0)
        UIView.animate(
            withDuration: 0.5,
            delay: 0.05,
            options: [.curveEaseInOut],
            animations: {
                cell.transform = CGAffineTransform(translationX: 0, y: 0)
            })
    }
}
