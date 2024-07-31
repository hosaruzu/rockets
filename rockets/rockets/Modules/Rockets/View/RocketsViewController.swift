//
//  RocketsViewController.swift
//  rockets
//
//  Created by Artem Tebenkov on 30.07.2024.
//

import SnapKit
import UIKit

final class RocketsViewController: UIViewController {
    // MARK: - Subviews

    private let rocketView = RocketView()

    // MARK: - View output

    var output: RocketsViewOutput?

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        output?.viewDidLoad()
        addSubviews()
        setupConstraints()
    }
}

// MARK: - Setup layout

private extension RocketsViewController {
    func addSubviews() {
        view.addSubviews(views: rocketView)
    }

    func setupConstraints() {
        rocketView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}

// MARK: - RocketsViewPresentable

extension RocketsViewController: RocketsViewPresentable {
    func pesent(_ viewController: UIViewController) { }

    func setState(_ state: RocketsViewState) { }
}
