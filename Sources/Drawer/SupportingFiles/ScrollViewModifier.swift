//
//  File.swift
//  
//
//  Created by Bruno Wide on 16/02/22.
//

import Foundation
import SwiftUI
import Combine
import LegacyScrollView

public extension View {
    /**
     encapsulates your view in a `LegacyScrollView`

     you can now call `.onScroll(_:)` `.onReachBottom(_:)` and others
     */
    func drawerScrollView(showsIndicators: Bool = true) -> LegacyScrollView<Self> {
        LegacyScrollView(.vertical, showsIndicators: showsIndicators) { self }
        .onDragShouldBegin(shouldBeginDrag(with:scrollView:))
    }

    private func shouldBeginDrag(with panGestureRecognizer: UIPanGestureRecognizer, scrollView: UIScrollView) -> Bool {
        scrollView.contentOffset.y - panGestureRecognizer.translation(in: scrollView).y > 0 // disable scrollView when scrolling down drawer
    }
}
