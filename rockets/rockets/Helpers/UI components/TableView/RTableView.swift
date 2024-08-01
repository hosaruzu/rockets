//
//  RTableView.swift
//  rockets
//
//  Created by Artem Tebenkov on 01.08.2024.
//

import UIKit

final class RTableView: UITableView {
    // MARK: - Init

    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        setupAppearance()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Setup appearance

private extension RTableView {
    func setupAppearance() {
        bounces = false
        isScrollEnabled = false
        showsVerticalScrollIndicator = false
        separatorStyle = .none
    }
}
