//
//  AppTheme.swift
//  rockets
//
//  Created by Artem Tebenkov on 29.07.2024.
//

import UIKit

enum AppTheme {
    enum Color {
        static let accent = R.color.accentColor()
        static let secondary = R.color.secondaryColor()
        static let tertiary = R.color.tertiaryColor()
    }

    enum Font {
        static let largeTitle = R.font.labGrotesqueMedium(size: 32)
        static let title = R.font.labGrotesqueRegular(size: 28)
        static let body = R.font.labGrotesqueRegular(size: 24)
        static let headline = R.font.labGrotesqueBold(size: 24)
        static let navigationTitle = R.font.labGrotesqueRegular(size: 22)
        static let nvigationButton = R.font.labGrotesqueBold(size: 22)
    }

    enum Image {
        static let launchSuccess = R.image.launchSuccess
        static let launchFailure = R.image.launchFail
        static let preferences = R.image.setting
    }
}
