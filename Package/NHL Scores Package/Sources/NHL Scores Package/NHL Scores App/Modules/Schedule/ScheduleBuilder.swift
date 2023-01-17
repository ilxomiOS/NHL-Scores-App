//
//  File.swift
//  
//
//  Created by Ilxom on 05/01/23.
//

import Foundation

final class ScheduleBuilder {
    static func build() -> ScheduleViewController {
        let networking = NetworkManager.shared
        let storage = CoreDataManager.shared
        let interactor = ScheduleInteractor(networking: networking, storage: storage)
        let router = ScheduleRouter()
        let presenter = SchedulePresenter(interactor: interactor, router: router, day: .today)
        let viewController = ScheduleViewController(presenter: presenter)
        
        presenter.view = viewController.scheduleView
        router.vc = viewController
        
        return viewController
    }
}
