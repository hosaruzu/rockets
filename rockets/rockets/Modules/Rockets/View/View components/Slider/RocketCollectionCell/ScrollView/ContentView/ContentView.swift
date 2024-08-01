//
//  ContentView.swift
//  rockets
//
//  Created by Artem Tebenkov on 01.08.2024.
//

import UIKit

final class ContentView: UIView {
    // MARK: - Init

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupAppearance()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Setup appearance

private extension ContentView {
    func setupAppearance() {
        backgroundColor = .black
        clipsToBounds = true
        layer.cornerRadius = UIConstants.ContentView.cornerRadius
        layer.cornerCurve = .continuous
        layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
    }
}

// MARK: - UI Constants

private enum UIConstants {
    enum ContentView {
        static let cornerRadius: CGFloat = 32
    }
}
