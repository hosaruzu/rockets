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
        layer.cornerRadius = 32
        backgroundColor = AppTheme.Color.secondary
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
