//
//  RocketDataCell.swift
//  rockets
//
//  Created by Artem Tebenkov on 31.07.2024.
//

import UIKit

final class RocketDataCell: UICollectionViewCell {
    // MARK: - Init

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupAppearance()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Setup appearance

private extension RocketDataCell {
    func setupAppearance() {
        layer.cornerRadius = UIConstants.cornerRadius
        backgroundColor = AppTheme.Color.secondary
    }
}

// MARK: - UI constants

private enum UIConstants {
    static let cornerRadius: CGFloat = 32
}
