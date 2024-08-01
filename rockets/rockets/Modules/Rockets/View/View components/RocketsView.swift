//
//  RocketView.swift
//  rockets
//
//  Created by Artem Tebenkov on 30.07.2024.
//

import SnapKit
import UIKit

final class RocketsView: UIView {
    // MARK: - Subviews

    private let collectionView = SliderCollectionView()
    private let pageControl = PageControl()

    // MARK: - Init

    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
        setupLayout()
        setupCollectionViewDataSourceAndRegistration()
        collectionView.contentInsetAdjustmentBehavior = .never
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Setup layout

private extension RocketsView {
    func addSubviews() {
        backgroundColor = .white
        addSubviews(views: pageControl, collectionView)
    }

    func setupLayout() {
        pageControl.snp.makeConstraints { make in
            make.horizontalEdges.bottom.equalToSuperview()
            make.height.equalTo(UIConstants.PageControl.height)
        }

        collectionView.snp.makeConstraints { make in
            make.horizontalEdges.top.equalToSuperview()
            make.bottom.equalTo(pageControl.snp.top)
        }
    }
}

// MARK: - Setup collection view

private extension RocketsView {
    func setupCollectionViewDataSourceAndRegistration() {
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(RocketCell.self)
    }
}

// MARK: - UICollectionViewDataSource

extension RocketsView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        4
    }

    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        let cell = collectionView.dequeue(RocketCell.self, for: indexPath)
        cell.set(item: indexPath.item)
        return cell
    }
}

// MARK: - UICollectionViewDelegate

extension RocketsView: UICollectionViewDelegate { }

// MARK: - UICollectionViewDelegateFlowLayout

extension RocketsView: UICollectionViewDelegateFlowLayout {
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        return CGSize(width: bounds.width, height: bounds.height)
    }
}

// MARK: - UI constansts

private enum  UIConstants {
    enum PageControl {
        static let height: CGFloat = 72
    }
}
