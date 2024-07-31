//
//  RocketCell.swift
//  rockets
//
//  Created by Artem Tebenkov on 30.07.2024.
//

import SnapKit
import UIKit

final class RocketCell: UICollectionViewCell {
    // MARK: - Subviews

    private let scrollView = RocketScrollView()

    // MARK: - Init

    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
        setupConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Public

    func set(item: Int) {
        let colors: [UIColor] = [.systemRed, .systemBlue, .systemGreen, .systemYellow]
        backgroundColor = colors[item]
    }
}

// MARK: - Setup layout

private extension RocketCell {
    func addSubviews() {
        contentView.addSubviews(views: scrollView)
    }

    func setupConstraints() {
        scrollView.snp.makeConstraints { make in
            make.horizontalEdges.bottom.equalToSuperview()
            make.top.equalTo(safeAreaLayoutGuide.snp.top)
        }
    }
}
