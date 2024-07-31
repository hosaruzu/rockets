//
//  PagingView.swift
//  rockets
//
//  Created by Artem Tebenkov on 30.07.2024.
//
import SnapKit
import UIKit

final class PagingView: UIView {
    // MARK: - Subviews

    private let pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        return pageControl
    }()

    // MARK: - Init

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupAppearance()
        addSubviews()
        setupConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Setup appearance

private extension PagingView {
    func setupAppearance() {
        backgroundColor = .appTertiaryBackground
        pageControl.currentPageIndicatorTintColor = .white
        pageControl.tintColor = AppTheme.Color.secondary

        pageControl.numberOfPages = 4
        pageControl.currentPage = 0
    }
}

// MARK: - Setup layout

private extension PagingView {
    func addSubviews() {
        addSubviews(views: pageControl)
    }

    func setupConstraints() {
        pageControl.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().offset(-4)
        }
    }
}
