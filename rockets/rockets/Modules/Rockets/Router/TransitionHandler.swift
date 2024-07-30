//
//  TransitionHandler.swift
//  rockets
//
//  Created by Artem Tebenkov on 30.07.2024.
//

import UIKit

protocol TransitionHandler: AnyObject {
    func pushTo(_ viewController: UIViewController)
    func pesent(_ viewController: UIViewController)
}

extension TransitionHandler where Self: UIViewController {
    func pushTo(_ viewController: UIViewController) {
        navigationController?.pushViewController(viewController, animated: true)
    }

    func present(_ viewController: UIViewController) {
        viewController.modalPresentationStyle = .pageSheet
        present(viewController, animated: true)
    }
}
