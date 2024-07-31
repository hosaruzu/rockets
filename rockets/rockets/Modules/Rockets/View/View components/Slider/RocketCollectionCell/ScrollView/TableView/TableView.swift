//
//  TableView.swift
//  rockets
//
//  Created by Artem Tebenkov on 31.07.2024.
//
import SnapKit
import UIKit

final class TableView: UIView {
    private(set) lazy var rocketTableView: UITableView = {
        let tableView = UITableView()
        tableView.bounces = false
        tableView.isScrollEnabled = false
        tableView.showsVerticalScrollIndicator = false

        tableView.delegate = self
        tableView.separatorStyle = .none
        tableView.dataSource = self

        tableView.tableFooterView = footerView
        tableView.register(UITableViewCell.self)
        tableView.register(RocketDescriptionTableViewCell.self)
        tableView.register(RocketStatsTableViewCell.self)
        return tableView
    }()

    private let footerView = TableFooterView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
        setupConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        footerView.frame = .init(x: 0, y: 0, width: bounds.width, height: 120)
    }
}

// MARK: - Setup layout

private extension TableView {
    func addSubviews() {
        addSubviews(views: rocketTableView)
        rocketTableView.addSubview(footerView)
    }

    func setupConstraints() {
        rocketTableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}

// MARK: - UITableViewDataSource

extension TableView: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        4
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0: 1
        default: 3
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeue(RocketStatsTableViewCell.self, for: indexPath)
            return cell
        case 1, 2, 3, 4:
            let cell = tableView.dequeue(RocketDescriptionTableViewCell.self, for: indexPath)
            cell.setup(type: .main)
            return cell
        default:
            let cell = tableView.dequeue(UITableViewCell.self, for: indexPath)
            return cell
        }
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0, 1: ""
        default: "Section \(section)".uppercased()
        }
    }
}

// MARK: - UITableViewDelegate

extension TableView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return 128
        case 1, 2, 3, 4:
            return 50
        case 5:
            return 88
        default:
            return 50
        }
    }
}

// MARK: - UI Constants

private enum UIConstants {}
