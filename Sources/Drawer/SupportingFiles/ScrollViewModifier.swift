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
        .onGestureShouldBegin(shouldBegingGesture(with:scrollView:))
    }

    private func shouldBegingGesture(with panGestureRecognizer: UIPanGestureRecognizer, scrollView: UIScrollView) -> Bool {
        scrollView.contentOffset.y - panGestureRecognizer.translation(in: scrollView).y > 0 // disable scrollView when scrolling down drawer
    }
}

public extension LegacyScrollView {

    /**
     sets up `LegacyScrollView` for usage inside a drawer
     */
    func drawerSetup() -> LegacyScrollView {
        self
            .onGestureShouldBegin(shouldBegingGesture(with:scrollView:))
    }

    private func shouldBegingGesture(with panGestureRecognizer: UIPanGestureRecognizer, scrollView: UIScrollView) -> Bool {
        scrollView.contentOffset.y - panGestureRecognizer.translation(in: scrollView).y > 0 // disable scrollView when scrolling down drawer
    }
}
