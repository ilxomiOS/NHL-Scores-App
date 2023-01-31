//
//  File.swift
//  
//
//  Created by Ilxom on 05/01/23.
//

import UIKit

final class StandingsBuilder {
    
    static func build() -> UIViewController {
        let networking = NetworkManager.shared
        let interactor = StandingsInteractor(networking: networking)
        let presenter = StandingsPresenter(interactor: interactor)
        let viewController = StandingsViewController(presenter: presenter)
        viewController.tabBarItem.title = "Standings"
        viewController.tabBarItem.image = UIImage(systemName: "list.number")
        presenter.view = viewController.standingsView
        
        return viewController
    }
    
}
