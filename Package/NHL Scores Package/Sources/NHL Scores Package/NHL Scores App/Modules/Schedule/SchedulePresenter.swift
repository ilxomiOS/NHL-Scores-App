//
//  File.swift
//  
//
//  Created by Ilxom on 05/01/23.
//

import Foundation

protocol SchedulePresenterProtocol: AnyObject {
    var day: DateCategory { get set }
    func updateViewWithShedule(view: ScheduleView)
    func selectGame(at index: Int)
    func didTapFavoritesButton()
}

final class SchedulePresenter {
    weak var view: ScheduleViewProtocol?
    private let interactor: ScheduleInteractorProtocol
    private let router: ScheduleRouterProtocol
    
    var day: DateCategory
    private var games = [ScheduleViewModel]()
    
    init(interactor: ScheduleInteractorProtocol, router: ScheduleRouterProtocol, day: DateCategory) {
        self.interactor = interactor
        self.router = router
        self.day = day
    }
    
    private func convertGameToModel(games: [Game]) -> [ScheduleViewModel] {
        var entity = [ScheduleViewModel]()
        let int = games.count - 1
        for i in 0...int {
            let model = ScheduleViewModel(from: games[i])
            entity.append(model)
        }
        return entity
    }
        
}

extension SchedulePresenter: SchedulePresenterProtocol {
    func updateViewWithShedule(view: ScheduleView) {
        self.view = view
        interactor.fetchShedule(day: day) { [weak self] games in
            guard let self = self,
                  let games = games
            else { return }
            self.games = self.convertGameToModel(games: games)
            view.getSchedule(games: self.games)
        }
    }
    
    func selectGame(at index: Int) {
        interactor.save(game: games[index])
    }
    
    func didTapFavoritesButton() {
        router.goToFavoritesView()
    }
}
