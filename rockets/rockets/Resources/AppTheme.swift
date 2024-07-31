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
        static let secondary = R.color.appSecondaryColor()
        static let tertiary = R.color.appTertiaryColor()
    }

    enum Font {
        static let largeTitle = R.font.labGrotesqueMedium(size: 24)
        static let title = R.font.labGrotesqueRegular(size: 20)
        static let body = R.font.labGrotesqueRegular(size: 16)
        static let caption = R.font.labGrotesqueRegular(size: 14)
        static let headline = R.font.labGrotesqueBold(size: 16)
        static let button = R.font.labGrotesqueBold(size: 18)
        static let navigationTitle = R.font.labGrotesqueRegular(size: 22)
        static let nvigationButton = R.font.labGrotesqueBold(size: 22)
    }

    enum Image {
        static let launchSuccess = R.image.launchSuccess
        static let launchFailure = R.image.launchFail
        static let preferences = R.image.setting
    }
}
