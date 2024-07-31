//
//  RocketView.swift
//  rockets
//
//  Created by Artem Tebenkov on 30.07.2024.
//

import SnapKit
import UIKit

final class RocketView: UIView {
    // MARK: - Subviews

    private let collectionView = SliderCollectionView()
    private let pagingView = PagingView()

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

private extension RocketView {
    func addSubviews() {
        backgroundColor = .white
        addSubviews(views: pagingView, collectionView)
    }

    func setupLayout() {
        pagingView.snp.makeConstraints { make in
            make.horizontalEdges.bottom.equalToSuperview()
            make.height.equalTo(72)
        }

        collectionView.snp.makeConstraints { make in
            make.horizontalEdges.top.equalToSuperview()
            make.bottom.equalTo(pagingView.snp.top)
        }
    }
}

// MARK: - Setup collection view

private extension RocketView {
    func setupCollectionViewDataSourceAndRegistration() {
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.backgroundColor = .gray
        collectionView.register(RocketCell.self, forCellWithReuseIdentifier: "cell")
    }
}

extension RocketView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        4
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? RocketCell else {
            return UICollectionViewCell()
        }
        cell.set(item: indexPath.item)
        return cell
    }
}

extension RocketView: UICollectionViewDelegate { }

extension RocketView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: bounds.width, height: bounds.height)
    }
}
