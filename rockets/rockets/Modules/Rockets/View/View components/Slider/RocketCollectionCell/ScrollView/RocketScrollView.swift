//
//  RocketScrollView.swift
//  rockets
//
//  Created by Artem Tebenkov on 30.07.2024.
//

import SnapKit
import UIKit

final class RocketScrollView: UIScrollView {
    // MARK: - Subviews

    private let contentView = ContentView()
    private let tableView = TableView()
    private let titleLabel = TitleLabel()

    // MARK: - Init

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupScrollView()
        addSubviews()
        setupConstraints()

        titleLabel.text = "Rocket name"
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Lifecycle

    override func layoutSubviews() {
        super.layoutSubviews()
        contentSize = .init(
            width: bounds.width,
            height: bounds.height * UIConstants.ScrollView.contentSizeHeightMultiplier)
    }
}

// MARK: - Setup appearance

private extension RocketScrollView {
    func setupScrollView() {
        delegate = self
        showsVerticalScrollIndicator = false
        bounces = false
    }
}

// MARK: - Setup layout

private extension RocketScrollView {
    func addSubviews() {
        addSubviews(views: contentView)
        contentView.addSubviews(views: titleLabel, tableView)
    }

    func setupConstraints() {
        contentView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(UIConstants.ContentView.topOffset)
            make.height.equalTo(UIConstants.ContentView.height)
            make.width.equalToSuperview()
        }
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(UIConstants.Title.topOffset)
            make.leading.equalToSuperview().offset(UIConstants.Title.leadingOffset)
        }
        tableView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(UIConstants.TableView.topOffset)
            make.width.equalToSuperview()
            make.bottom.equalToSuperview().offset(UIConstants.TableView.bottomOffset)
        }
    }
}

// MARK: - UIScrollViewDelegate

extension RocketScrollView: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        handleCurrentScroll(scrollView)
    }

    func handleCurrentScroll(_ scrollView: UIScrollView) {
        if scrollView == self {
            tableView.isScrollEnabled(self.contentOffset.y >= UIConstants.ScrollView.contentOffsetTrigger)
        }
    }
}

// MARK: - UI Constants

private enum UIConstants {
    enum ScrollView {
        static let contentSizeHeightMultiplier: CGFloat = 1.66
        static let contentOffsetTrigger: CGFloat = UIScreen.main.bounds.height * 0.56
    }

    enum ContentView {
        static let topOffset: CGFloat = UIScreen.main.bounds.height * 0.6
        static let height: CGFloat = UIScreen.main.bounds.height
    }

    enum Title {
        static let topOffset: CGFloat = 32
        static let leadingOffset: CGFloat = 32
    }

    enum TableView {
        static let topOffset: CGFloat = 32
        static let bottomOffset: CGFloat = -UIScreen.main.bounds.height * 0.16
    }
}
