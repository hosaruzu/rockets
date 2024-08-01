//
//  TitleLabel.swift
//  rockets
//
//  Created by Artem Tebenkov on 01.08.2024.
//

import UIKit

final class TitleLabel: UILabel {
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

private extension TitleLabel {
    func setupAppearance() {
        font = AppTheme.Font.largeTitle
        textColor = AppTheme.Color.accent
    }
}

