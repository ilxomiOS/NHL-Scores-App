//
//  FavouriteViewController.swift
//  
//
//  Created by Ilxom on 05/01/23.
//

import UIKit

final class FavoritesViewController: UIViewController {
    
    private let presenter: FavoritesPresenterInput
    let favoritesView = FavoritesView()
    
    init(presenter: FavoritesPresenterInput) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
        presenter.viewDidLoad(view: favoritesView) // viewdidload не корректно тк у тебя здесь init
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = favoritesView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    private func configure() {
        favoritesView.index = { [weak self] index in
            self?.presenter.deleteFavoriteGame(at: index)
        }
    }

}
