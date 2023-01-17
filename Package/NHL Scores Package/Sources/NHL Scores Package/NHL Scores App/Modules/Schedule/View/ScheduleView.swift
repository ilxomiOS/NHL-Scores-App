//
//  ScheduleView.swift
//  
//
//  Created by Ilxom on 05/01/23.
//

import UIKit
import SnapKit

protocol ScheduleViewProtocol: AnyObject {
    func getSchedule(games: [ScheduleViewModel])
    var didSelectedSegment: ((DateCategory) -> Void)? { get set }
    var index: ((Int) -> Void)? { get set }
    var didTapFavoriteButton: (() -> Void)? { get set }
}

final class ScheduleView: UIView {
    private lazy var headerElements = HeaderView()
    
    private lazy var favoriteButton: Button = {
        let button = Button(title: "Favorites Games", backgroundColor: .systemPurple)
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var segmentedControl: UISegmentedControl = {
        let segmentedControl = UISegmentedControl(items: ["Yesterday", "Today", "Tomorrow"])
        segmentedControl.selectedSegmentIndex = 1
        segmentedControl.selectedSegmentTintColor = .systemPurple
        segmentedControl.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white], for: .selected)
        segmentedControl.addTarget(self, action: #selector(selectedSegment), for: .valueChanged)
        return segmentedControl
    }()
    
    private lazy var tableView = TableView()
    private let dataSource = ScheduleDataSource()
    var didSelectedSegment: ((DateCategory) -> ())?
    var index: ((Int) -> Void)?
    var didTapFavoriteButton: (() -> Void)?
    
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
        configureFavoriteButton()
        configureSegmentedControl()
        setupTableViewConstraints()
    }
    
    private func configureHeaderElements() {
        addSubview(headerElements)
        headerElements.set(title: "Shedule")
        headerElements.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide).offset(8)
            make.leading.trailing.equalTo(layoutMarginsGuide)
        }
    }
    
    private func configureFavoriteButton() {
        addSubview(favoriteButton)
        favoriteButton.snp.makeConstraints { make in
            make.top.equalTo(headerElements.snp.bottom).offset(8)
            make.leading.trailing.equalTo(layoutMarginsGuide)
            make.height.equalTo(40)
        }
    }
    
    private func configureSegmentedControl() {
        addSubview(segmentedControl)
        segmentedControl.snp.makeConstraints { make in
            make.top.equalTo(favoriteButton.snp.bottom).offset(8)
            make.leading.trailing.equalTo(layoutMarginsGuide)
        }
    }
    
    private func setupTableViewConstraints() {
        addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.top.equalTo(segmentedControl.snp.bottom).offset(8)
            make.leading.trailing.equalTo(layoutMarginsGuide)
            make.bottom.equalTo(snp.bottomMargin)
        }
    }
    
    private func configureTableView() {
        tableView.dataSource = dataSource
        tableView.delegate = self
        tableView.register(ScheduleTableViewCell.self, forCellReuseIdentifier: ScheduleTableViewCell.reuseId)
    }
    
    private func saveAction(at indexPath: IndexPath) -> UIContextualAction {
        let action = UIContextualAction(style: .normal, title: "") { action, view, completion in
            self.index?(indexPath.row)
            completion(true)
        }
        action.image = UIImage(systemName: "star")
        action.backgroundColor = .systemGreen
        return action
    }
    
    @objc private func selectedSegment() {
        switch segmentedControl.selectedSegmentIndex {
        case 0: didSelectedSegment?(.yesterday)
        case 1: didSelectedSegment?(.today)
        case 2: didSelectedSegment?(.tomorrow)
        default: break
        }
    }
    
    @objc func buttonTapped() {
        didTapFavoriteButton?()
    }
}

extension ScheduleView: ScheduleViewProtocol {
    func getSchedule(games: [ScheduleViewModel]) {
        dataSource.games = games
        tableView.reloadData()
    }
}

extension ScheduleView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        250
    }
    
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        UISwipeActionsConfiguration(actions: [saveAction(at: indexPath)])
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
