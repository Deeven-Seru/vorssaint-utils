// SPDX-License-Identifier: GPL-3.0-or-later
// Copyright (C) 2026 Vorssaint

import Foundation
import CoreGraphics
import AppKit

enum NotchHydrationTests {
    static func run(_ suite: TestSuite) {
        let service = NotchService()
        service.showHydrationNotice()
        suite.expect(service.notice?.symbol == "hydration.glass", "Hydration notice shows the correct symbol")
        suite.expect(service.notice?.mascot == .love, "Hydration notice plays the love reaction")
        suite.expect(service.notice?.event == .systemNotification, "Hydration notice uses systemNotification event")
    }
}
