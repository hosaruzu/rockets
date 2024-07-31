//
//  RocketContentWrapper.swift
//  rockets
//
//  Created by Artem Tebenkov on 30.07.2024.
//

import SnapKit
import UIKit

final class RocketScrollView: UIScrollView {
    // MARK: - Subviews

    private let contentView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        view.clipsToBounds = true
        view.layer.cornerRadius = UIConstants.ContentView.cornerRadius
        view.layer.cornerCurve = .continuous
        view.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        return view
    }()

    private let titleLabel: UILabel = {
        let title = UILabel()
        title.font = AppTheme.Font.largeTitle
        title.textColor = AppTheme.Color.accent
        title.text = "Aboba"
        return title
    }()

    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.bounces = false
        tableView.isScrollEnabled = false
        tableView.showsVerticalScrollIndicator = false

        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return tableView
    }()

    // MARK: - Init

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupScrollView()
        addSubviews()
        setupConstraints()
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

// MARK: - UITableViewDataSource

extension RocketScrollView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        30
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "row \(indexPath)"
        return cell
    }
}

// MARK: - UITableViewDelegate

extension RocketScrollView: UITableViewDelegate { }

// MARK: - UIScrollViewDelegate

extension RocketScrollView: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView == self {
            tableView.isScrollEnabled = (self.contentOffset.y >= UIConstants.ScrollView.contentOffsetTrigger)
        }

        if scrollView == self.tableView {
            self.tableView.isScrollEnabled = (tableView.contentOffset.y > 0)
        }
    }
}

// MARK: - UI Constants

private enum UIConstants {
    enum ScrollView {
        static let contentSizeHeightMultiplier: CGFloat = 1.49
        static let contentOffsetTrigger: CGFloat = 200
    }

    enum ContentView {
        static let cornerRadius: CGFloat = 32
        static let topOffset: CGFloat = UIScreen.main.bounds.height * 0.45
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
