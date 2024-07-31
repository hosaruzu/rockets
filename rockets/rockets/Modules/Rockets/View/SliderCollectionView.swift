//
//  SliderCollectionView.swift
//  rockets
//
//  Created by Artem Tebenkov on 30.07.2024.
//

import Foundation

import UIKit

final class SliderCollectionView: UICollectionView {

    // MARK: - Flow layout

    private let flowLayout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        return layout
    }()

    // MARK: - Init

    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: flowLayout)
        setupAppearance()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Setup appearance

private extension SliderCollectionView {
    func setupAppearance() {
        bounces = false
        isPagingEnabled = true
        backgroundColor = .clear
    }
}
