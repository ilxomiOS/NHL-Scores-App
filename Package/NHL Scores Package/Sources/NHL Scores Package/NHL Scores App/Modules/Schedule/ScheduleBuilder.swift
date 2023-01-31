//
//  File.swift
//  
//
//  Created by Ilxom on 05/01/23.
//

import UIKit

final class ScheduleBuilder {
    static func build() -> UIViewController {
        let networking = NetworkManager.shared
        let storage = CoreDataManager.shared
        let interactor = ScheduleInteractor(networking: networking, storage: storage)
        let router = ScheduleRouter()
        let presenter = SchedulePresenter(interactor: interactor, router: router, day: .today)
        
        let viewController = ScheduleViewController(presenter: presenter)
        viewController.tabBarItem.title = "Scores"
        viewController.tabBarItem.image = UIImage(systemName: "sportscourt")
        
        presenter.view = viewController.scheduleView
        router.vc = viewController
        
        return viewController
    }
}
