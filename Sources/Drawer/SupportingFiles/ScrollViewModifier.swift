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

struct DrawerScrollViewModifier: ViewModifier {

    let showsIndicators: Bool

    func body(content: Content) -> some View {
        GeometryReader { geometry in
            LegacyScrollView(.vertical, showsIndicators: showsIndicators) {
                content
            }
            .onDragShouldBegin { pan, scrollView in
                scrollView.contentOffset.y - pan.translation(in: scrollView).y > 0 // disable scrollView when scrolling down drawer
            }
        }
    }
}

extension View {
    func drawerScrollView() -> some View {
        modifier(DrawerScrollViewModifier(showsIndicators: true))
    }
}
