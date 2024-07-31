//
//  RocketInfoCell.swift
//  rockets
//
//  Created by Artem Tebenkov on 31.07.2024.
//

import UIKit

final class RocketStatsTableViewCell: UITableViewCell {
    // MARK: - Subview
    private let collectionView = RocketStatsCollectionView()

    // MARK: - Init

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubviews()
        setupConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Setup layout

private extension RocketStatsTableViewCell {
    func addSubviews() {
        contentView.addSubviews(views: collectionView)
    }

    func setupConstraints() {
        collectionView.snp.makeConstraints { make in
            make.top.horizontalEdges.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
}
