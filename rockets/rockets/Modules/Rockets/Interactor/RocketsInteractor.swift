//
//  RocketsInteractor.swift
//  rockets
//
//  Created by Artem Tebenkov on 30.07.2024.
//

import Foundation

final class RocketsInteractor {
    weak var output: RocketsIntercatorOutput?
}

extension RocketsInteractor: RocketsIntercatorInput {
    func obtainRocketsInfo() async throws {
        output?.setSuccessObtainData([""])
    }
}
