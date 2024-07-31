//
//  RocketDescriptionTableViewCell.swift
//  rockets
//
//  Created by Artem Tebenkov on 31.07.2024.
//

import SnapKit
import UIKit

enum InfoCellType {
    case main
    case stages
}

final class RocketDescriptionTableViewCell: UITableViewCell {

    private var type: InfoCellType?

    // MARK: - Subviews

    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "Description"
        label.font = AppTheme.Font.body
        label.textColor = AppTheme.Color.tertiary
        return label
    }()

    private let dataLabel: UILabel = {
        let label = UILabel()
        label.text = "Data"
        label.font = AppTheme.Font.body
        label.textColor = AppTheme.Color.accent
        return label
    }()

    // MARK: - Init

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubviews()
        setupConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Public

    func setup(type: InfoCellType) {
        self.type = type

        switch type {
        case .main:
            dataLabel.font = AppTheme.Font.body
        case .stages:
            dataLabel.font = AppTheme.Font.headline
        }
    }
}

// MARK: - Setup layout

private extension RocketDescriptionTableViewCell {
    func addSubviews() {
        contentView.addSubviews(views: descriptionLabel, dataLabel)
    }

    func setupConstraints() {
        descriptionLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(32)
            make.centerY.equalToSuperview()
        }
        dataLabel.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(32)
            make.centerY.equalToSuperview()
        }
    }
}
