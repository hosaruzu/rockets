//
//  TableView.swift
//  rockets
//
//  Created by Artem Tebenkov on 31.07.2024.
//
import SnapKit
import UIKit

final class TableView: UIView {
    // MARK: - Subviews

    private let rocketTableView = RTableView()
    private let footerView = TableFooterView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupDelegates()
        setupCells()
        addSubviews()
        setupConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        setupTableViewFooter()
    }

    // MARK: - Public

    func isScrollEnabled(_ condition: Bool) {
        rocketTableView.isScrollEnabled = condition
    }

    func contentOffset() -> CGFloat {
        rocketTableView.contentOffset.y
    }
}

// MARK: - Setup table view

private extension TableView {
    func setupDelegates() {
        rocketTableView.delegate = self
        rocketTableView.dataSource = self
    }

    func setupCells() {
        rocketTableView.register(UITableViewCell.self)
        rocketTableView.register(RocketDescriptionTableViewCell.self)
        rocketTableView.register(RocketStatsTableViewCell.self)
    }

    func setupTableViewFooter() {
        footerView.frame = .init(x: 0, y: 0, width: bounds.width, height: UIConstants.TableViewFooter.height)
        rocketTableView.tableFooterView = footerView
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
        getNumberOfRows(for: section)
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        getCell(tableView, for: indexPath)
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
        getCellHeight(for: indexPath)
    }
}

// MARK: - Table view helpers

private extension TableView {
    func getNumberOfRows(for section: Int) -> Int {
        switch section {
        case 0: UIConstants.StatsCell.numberOfRows
        case 1: UIConstants.DescriptionCell.numberOfRows
        case 2, 3: UIConstants.DetailsCell.numberOfRows
        default: 0
        }
    }

    func getCell(_ tableView: UITableView, for indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeue(RocketStatsTableViewCell.self, for: indexPath)
            return cell

        case 1:
            let cell = tableView.dequeue(RocketDescriptionTableViewCell.self, for: indexPath)
            cell.setup(type: .main)
            return cell

        case 2, 3:
            let cell = tableView.dequeue(RocketDescriptionTableViewCell.self, for: indexPath)
            cell.setup(type: .main)
            return cell

        default:
            let cell = tableView.dequeue(UITableViewCell.self, for: indexPath)
            return cell
        }
    }

    func getCellHeight(for indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0: return UIConstants.StatsCell.height
        case 1, 2, 3, 4: return UIConstants.DescriptionCell.height
        default: return 0
        }
    }
}

// MARK: - UI Constants

private enum UIConstants {
    enum StatsCell {
        static let height: CGFloat = 128
        static let numberOfRows = 1
    }

    enum DescriptionCell {
        static let height: CGFloat = 50
        static let numberOfRows = 3
    }

    enum DetailsCell {
        static let height: CGFloat = 50
        static let numberOfRows = 3
    }

    enum TableViewFooter {
        static let height: CGFloat = 120
    }
}
