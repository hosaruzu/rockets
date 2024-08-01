//
//  RButton.swift
//  rockets
//
//  Created by Artem Tebenkov on 01.08.2024.
//

import UIKit

final class RButton: UIButton {
    // MARK: - Init

    init(title: String, font: UIFont? = AppTheme.Font.button) {
        super.init(frame: .zero)
        setAttributedTitle(createAttributedTitle(with: title, font: font), for: .normal)
        setupAppearance()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Create title with custom font

private extension RButton {
    func createAttributedTitle(with string: String, font: UIFont?) -> NSAttributedString? {
        guard let font else { return nil }
        let fontAttributes = [NSAttributedString.Key.font: font]
        return NSAttributedString(string: string, attributes: fontAttributes)
    }
}

// MARK: - Setup appearance

private extension RButton {
    func setupAppearance() {
        backgroundColor = AppTheme.Color.secondary
        layer.cornerRadius = UIConstants.cornerRadius
    }
}

// MARK: - UI constants

private enum UIConstants {
    static let cornerRadius: CGFloat = 12
}
