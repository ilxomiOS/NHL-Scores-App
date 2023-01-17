//
//  File.swift
//  
//
//  Created by Ilxom on 05/01/23.
//

import Foundation

final class StandingsBuilder {
    
    static func build() -> StandingsViewController {
        let networking = NetworkManager.shared
        let interactor = StandingsInteractor(networking: networking)
        let presenter = StandingsPresenter(interactor: interactor)
        let viewController = StandingsViewController(presenter: presenter)
        
        presenter.view = viewController.standingsView
        
        return viewController
    }
    
}
