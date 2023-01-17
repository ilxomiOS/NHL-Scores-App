//
//  StandingsViewController.swift
//  
//
//  Created by Ilxom on 05/01/23.
//

import UIKit

final class StandingsViewController: UIViewController {
    
    private let presenter: StandingsPresenterProtocol
    lazy var standingsView = StandingsView()
    
    init(presenter: StandingsPresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
        presenter.viewDidLoad(view: standingsView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = standingsView
    }

}
