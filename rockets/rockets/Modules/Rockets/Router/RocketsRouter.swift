//
//  RocketsRouter.swift
//  rockets
//
//  Created by Artem Tebenkov on 30.07.2024.
//

import Foundation

final class RocketsRouter {
    weak var transitionHandler: TransitionHandler?
}

extension RocketsRouter: RocketsRouterInput { }
