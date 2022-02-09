//
//  File.swift
//  
//
//  Created by Bruno Wide on 08/02/22.
//

import Foundation
import SwiftUI

/// A bottom-up drawer view
public struct Drawer<Content>: View where Content: View {


    var content: Content
    ///partial height that the drawer can snap to
    var snapPositions: [CGFloat] = [
        0,
        UIScreen.main.bounds.height - 135
    ]

    var totalHeight: CGFloat = UIScreen.main.bounds.height + 30 // bottom padding

    @State public var lastDragPosition: CGFloat = 0
    /// The current height of the displayed drawer
    @State public var currentPosition: CGFloat = 0
    @State var animation: Animation? = .spring()
    @State var cornerRadius: CGFloat = 16

    public var body: some View {
        ZStack {
            GeometryReader { geometry in
                content
                    .cornerRadius(cornerRadius)
                    .frame(width: geometry.size.width, height: totalHeight)
                    .frame(height: totalHeight)
                    .offset(y: currentPosition)
                    .animation(animation)
                    .gesture(dragGesture)
            }
        }
        .edgesIgnoringSafeArea(.vertical)
    }
}

struct DrawerPreviews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.gray
            Drawer {
                Color.blue
            }
        }
        .edgesIgnoringSafeArea(.vertical)
    }
}

extension Drawer {
    /// A bottom-up drawer view
    /// - Parameters:
    public init(@ViewBuilder _ content: () -> Content) {
        self.content = content()
    }
}
