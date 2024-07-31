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

    private let watchLaunchesButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = AppTheme.Color.secondary
        button.layer.cornerRadius = 12

        if let font = AppTheme.Font.button {
            let attributes = [NSAttributedString.Key.font: font]
            let title = NSAttributedString(string: "Watch launches", attributes: attributes)
            button.setAttributedTitle(title, for: .normal)
        }
        return button
    }()

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
            make.horizontalEdges.equalToSuperview().inset(32)
            make.height.equalTo(56)
        }
    }
}
