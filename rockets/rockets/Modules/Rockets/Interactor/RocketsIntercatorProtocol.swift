//
//  RocketsIntercatorProtocol.swift
//  rockets
//
//  Created by Artem Tebenkov on 30.07.2024.
//

protocol RocketsIntercatorInput: AnyObject {
    func obtainRocketsInfo() async throws
}

protocol RocketsIntercatorOutput: AnyObject {
    func setSuccessObtainData(_ data: [String])
    func setFailedObtainData(_ error: String)
}
