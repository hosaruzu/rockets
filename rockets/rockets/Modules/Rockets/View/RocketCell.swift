//
//  RocketCell.swift
//  rockets
//
//  Created by Artem Tebenkov on 30.07.2024.
//

import SnapKit
import UIKit

final class RocketCell: UICollectionViewCell {
    private let scrollView = RocketScrollView()

    let screenHeight = UIScreen.main.bounds.height

    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubviews(views: scrollView)

        scrollView.snp.makeConstraints { make in
            make.horizontalEdges.bottom.equalToSuperview()
            make.top.equalTo(safeAreaLayoutGuide.snp.top)
        }

//        scrollView.bounces = false
//        scrollView.contentSize = .init(width: bounds.width, height: bounds.height * 1.33)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func set(item: Int) {
        let colors: [UIColor] = [.systemRed, .systemBlue, .systemGreen, .systemYellow]
        backgroundColor = colors[item]
    }
}
