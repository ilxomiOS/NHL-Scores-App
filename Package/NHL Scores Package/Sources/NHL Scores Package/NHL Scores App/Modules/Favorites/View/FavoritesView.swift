//
//  FavouritesView.swift
//  
//
//  Created by Ilxom on 05/01/23.
//

import UIKit

protocol FavoritesViewProtocol: AnyObject {
    func getFavoritesGames(favoritesGames: [FavoriteGame])
    var index: ((Int) -> Void)? { get set }
}

final class FavoritesView: UIView {
    
    private lazy var headerElements = HeaderView()
    private lazy var tableView = TableView()
    
    private let dataSource = FavoritesDataSource()
    var index: ((Int) -> Void)?
    
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
        setupTableViewConstraints()
    }
    
    private func configureHeaderElements() {
        addSubview(headerElements)
        headerElements.set(title: "Favorites")
        headerElements.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide).offset(8)
            make.leading.trailing.equalTo(layoutMarginsGuide)
        }
    }
    
    private func setupTableViewConstraints() {
        addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.top.equalTo(headerElements.snp.bottom).offset(8)
            make.leading.trailing.equalTo(layoutMarginsGuide)
            make.bottom.equalTo(snp.bottomMargin)
        }
    }
    
    private func configureTableView() {
        tableView.dataSource = dataSource
        tableView.delegate = self
        tableView.register(FavoritesTableViewCell.self, forCellReuseIdentifier: FavoritesTableViewCell.reuseId)
    }
    
    private func deleteAction(at indexPath: IndexPath) -> UIContextualAction {
        let action = UIContextualAction(style: .normal, title: "Delete") { action, view, completion in
            self.dataSource.favoritesGames.remove(at: indexPath.row)
            self.index?(indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .right)
            completion(true)
        }
        action.backgroundColor = .systemRed
        return action
    }
}

extension FavoritesView: FavoritesViewProtocol {
    func getFavoritesGames(favoritesGames: [FavoriteGame]) {
        dataSource.favoritesGames = favoritesGames
        tableView.reloadData()
    }
}

extension FavoritesView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100
    }
    
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        UISwipeActionsConfiguration(actions: [deleteAction(at: indexPath)])
    }
}
