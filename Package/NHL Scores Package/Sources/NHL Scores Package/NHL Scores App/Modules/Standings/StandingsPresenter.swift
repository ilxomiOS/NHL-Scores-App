//
//  File.swift
//  
//
//  Created by Ilxom on 05/01/23.
//

import Foundation

protocol StandingsPresenterProtocol: AnyObject {
    func viewDidLoad(view: StandingsView)
}

final class StandingsPresenter: StandingsPresenterProtocol {
    weak var view: StandingsViewProtocol?
    private let interactor: StandingsInteractorProtocol
    private var teams = [StandingsViewModel]()
    
    init(interactor: StandingsInteractorProtocol) {
        self.interactor = interactor
    }
    
    func viewDidLoad(view: StandingsView) {
        self.view = view
        interactor.fetchStandings { [weak self] teams in
            guard let self = self,
                  let teams = teams
            else { return }
            self.teams = self.convertTeamToModel(teams: teams)
            view.getStandings(self.teams)
        }
    }
    
    private func convertTeamToModel(teams: [Team]) -> [StandingsViewModel] {
        var entity = [StandingsViewModel]()
        let int = teams.count - 1
        for i in 0...int {
            let model = StandingsViewModel(from: teams[i])
            entity.append(model)
        }
        return entity
    }
    
}
