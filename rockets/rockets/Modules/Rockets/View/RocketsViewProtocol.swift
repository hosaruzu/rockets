//
//  RocketsViewProtocol.swift
//  rockets
//
//  Created by Artem Tebenkov on 30.07.2024.
//

protocol RocketsViewInput: AnyObject {
    func setState(_ state: RocketsViewState)
}

protocol RocketsViewOutput: AnyObject {
    func viewDidLoad()
    func didTapLaunchesButton()
    func didTapPreferencesButton()
}

protocol RocketsViewPresentable: RocketsViewInput, TransitionHandler {
    var output: RocketsViewOutput? { get set }
}

enum RocketsViewState {
    case loading
    case success(data: [String])
    case error(description: String)
}
