//
//  RocketInfoCollectionView.swift
//  rockets
//
//  Created by Artem Tebenkov on 31.07.2024.
//
import SnapKit
import UIKit

final class RocketStatsCollectionView: UIView {

    // MARK: - UICollectionViewFlowLayout

    private let flowLayout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 12
        layout.scrollDirection = .horizontal
        return layout
    }()

    // MARK: - Subviews

    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        return collectionView
    }()

    // MARK: - Init

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCollectionViewAppearance()
        setupDelegates()
        registerCells()
        addSubviews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Setup collection view

private extension RocketStatsCollectionView {
    func setupCollectionViewAppearance() {
        collectionView.contentInset = .init(top: 0, left: 32, bottom: 32, right: 32)
        collectionView.showsHorizontalScrollIndicator = false
    }

    func setupDelegates() {
        collectionView.dataSource = self
        collectionView.delegate = self
    }

    func registerCells() {
        collectionView.register(RocketDataCell.self)
    }
}

// MARK: - Setup layout
private extension RocketStatsCollectionView {
    func addSubviews() {
        addSubviews(views: collectionView)
    }

    func setupConstraints() {
        collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}

// MARK: - UICollectionViewDataSource

extension RocketStatsCollectionView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        4
    }

    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        let cell = collectionView.dequeue(RocketDataCell.self, for: indexPath)
        return cell
    }
}

// MARK: - UICollectionViewDelegate

extension RocketStatsCollectionView: UICollectionViewDelegate { }

// MARK: - UICollectionViewDelegateFlowLayout

extension RocketStatsCollectionView: UICollectionViewDelegateFlowLayout {
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        return .init(width: 96, height: 96)
    }
}
