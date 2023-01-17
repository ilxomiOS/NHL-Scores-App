//
//  File.swift
//  
//
//  Created by Ilxom on 05/01/23.
//

import UIKit

protocol ScheduleRouterProtocol: AnyObject {
    func goToFavoritesView()
}

final class ScheduleRouter {
    weak var vc: UIViewController?
}

extension ScheduleRouter: ScheduleRouterProtocol {
    func goToFavoritesView() {
        vc?.present(FavoritesBuilder.build(), animated: true)
    }
}
