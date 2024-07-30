//
//  RocketsViewController.swift
//  rockets
//
//  Created by Artem Tebenkov on 30.07.2024.
//

import UIKit

final class RocketsViewController: UIViewController {
    // MARK: - View output
    var output: RocketsViewOutput?

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        output?.viewDidLoad()
    }
}

// MARK: - RocketsViewPresentable
extension RocketsViewController: RocketsViewPresentable {
    func pesent(_ viewController: UIViewController) { }

    func setState(_ state: RocketsViewState) { }
}
