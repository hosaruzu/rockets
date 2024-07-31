//
//  RocketsPresenter.swift
//  rockets
//
//  Created by Artem Tebenkov on 30.07.2024.
//

import Foundation

final class RocketsPresenter {
    // MARK: - Modules
    unowned var view: RocketsViewInput
    private let interactor: RocketsIntercatorInput
    private let router: RocketsRouterInput

//    private weak var launchesModule: LaunchesModuleInput?

    // MARK: - Init
    init(
        view: some RocketsViewInput,
        interactor: some RocketsIntercatorInput,
        router: some RocketsRouterInput
    ) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
}

// MARK: - RocketsViewOutput
extension RocketsPresenter: RocketsViewOutput {
    func viewDidLoad() { }

    func didTapLaunchesButton() { }

    func didTapPreferencesButton() { }
}

// MARK: - RocketsIntercatorOutput
extension RocketsPresenter: RocketsIntercatorOutput {
    func setSuccessObtainData(_ data: [String]) { }

    func setFailedObtainData(_ error: String) { }
}
