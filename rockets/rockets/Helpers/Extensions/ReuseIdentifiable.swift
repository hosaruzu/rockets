//
//  ReuseIdentifier.swift
//  rockets
//
//  Created by Artem Tebenkov on 31.07.2024.
//

import UIKit

protocol ReuseIdentifiable {
    static var reuseIdentifier: String { get }
}

extension ReuseIdentifiable {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}

extension UITableViewCell: ReuseIdentifiable {}
extension UICollectionViewCell: ReuseIdentifiable {}

// MARK: - UITableView + ReuseIdentifiable

extension UITableView {
    func dequeue<T: UITableViewCell>(
        _ cellType: T.Type,
        for indexPath: IndexPath
    ) -> T {
        guard let cell = dequeueReusableCell(
            withIdentifier: cellType.reuseIdentifier,
            for: indexPath) as? T else {
            fatalError("Can't dequeue \(cellType.self) as \(self) cell")
        }
        return cell
    }

    func register<T: UITableViewCell>(_ cellType: T.Type) {
        register(cellType, forCellReuseIdentifier: cellType.reuseIdentifier)
    }
}

// MARK: - UICollectionView + ReuseIdentifiable

extension UICollectionView {
    func dequeue<T: UICollectionViewCell>(
        _ cellType: T.Type,
        for indexPath: IndexPath
    ) -> T {
        guard let cell = dequeueReusableCell(
            withReuseIdentifier: cellType.reuseIdentifier,
            for: indexPath) as? T else {
            fatalError("Can't dequeue \(cellType.self) as \(self) cell")
        }
        return cell
    }

    func register<T: UICollectionViewCell>(_ cellType: T.Type) {
        register(cellType, forCellWithReuseIdentifier: cellType.reuseIdentifier)
    }
}
