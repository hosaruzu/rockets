//
//  RocketContentWrapper.swift
//  rockets
//
//  Created by Artem Tebenkov on 30.07.2024.
//

import SnapKit
import UIKit

final class RocketContentWrapper: UIScrollView {
    // MARK: - Subviews

    private let titleLabel: UILabel = {
        let title = UILabel()
        title.font = AppTheme.Font.largeTitle
        title.textColor = AppTheme.Color.accent
        title.text = "Aboba"
        return title
    }()

    private let backgroundScrollView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        view.clipsToBounds = true
        view.layer.cornerRadius = 32
        view.layer.cornerCurve = .continuous
        view.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        return view
    }()

    private let emptyView: UIView = {
        let view = UIView()
        view.tag = 99
        return view
    }()

    let tableView = UITableView()

    // MARK: - Init

    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
        setupConstraints()

        backgroundColor = .green
        tableView.bounces = false
//        tableView.isScrollEnabled = false
        delegate = self
//        tableView.showsVerticalScrollIndicator = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Setup layout

private extension RocketContentWrapper {
    func addSubviews() {
        addSubviews(views: backgroundScrollView)
        backgroundScrollView.addSubviews(views: titleLabel, tableView)
    }

    func setupConstraints() {
        backgroundScrollView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(UIScreen.main.bounds.height * 0.45)
            make.height.equalTo(UIScreen.main.bounds.height)
            make.width.equalToSuperview()
        }

        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(32)
            make.leading.equalToSuperview().offset(32)
        }

        tableView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(32)
            make.width.equalToSuperview()
            make.bottom.equalToSuperview().offset(-UIScreen.main.bounds.height * 0.16)
        }
    }
}

extension RocketContentWrapper: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        30
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "row \(indexPath)"
        return cell
    }
}

extension RocketContentWrapper: UITableViewDelegate { }

extension RocketContentWrapper: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView == self {
            tableView.isScrollEnabled = (self.contentOffset.y >= 200)
        }

        if scrollView == self.tableView {
            self.tableView.isScrollEnabled = (tableView.contentOffset.y > 0)
        }
    }
}
