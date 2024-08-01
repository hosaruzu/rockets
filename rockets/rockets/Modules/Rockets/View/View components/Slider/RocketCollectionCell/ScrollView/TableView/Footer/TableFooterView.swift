//
//  TableFooterView.swift
//  rockets
//
//  Created by Artem Tebenkov on 31.07.2024.
//
import SnapKit
import UIKit

final class TableFooterView: UIView {
    // MARK: - Subviews

    private let watchLaunchesButton = RButton(title: "Watch launches")

    // MARK: - Init

    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
        setupConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Setup layout

private extension TableFooterView {
    func addSubviews() {
        addSubviews(views: watchLaunchesButton)
    }

    func setupConstraints() {
        watchLaunchesButton.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.horizontalEdges.equalToSuperview().inset(UIConstants.Button.horizontalInsets)
            make.height.equalTo(UIConstants.Button.height)
        }
    }
}

// MARK: - UI constants

private enum UIConstants {
    enum Button {
        static let horizontalInsets: CGFloat = 32
        static let height: CGFloat = 56
    }
}
