//
//  RocketsModuleAssembly.swift
//  rockets
//
//  Created by Artem Tebenkov on 30.07.2024.
//

import Foundation

enum RocketsModuleAssembly {
    static func build(with view: some RocketsViewPresentable) {
        let interactor = RocketsInteractor()
        let router = RocketsRouter()
        let presenter = RocketsPresenter(view: view, interactor: interactor, router: router)
        interactor.output = presenter
        view.output = presenter
        router.transitionHandler = view
    }
}
