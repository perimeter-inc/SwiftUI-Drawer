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
    @State var snapPositions: [CGFloat]

    @State public var lastDragPosition: CGFloat = 0
    /// The current height of the displayed drawer
    @State public var currentPosition: CGFloat
    @State var animation: Animation?
    @State var cornerRadius: CGFloat = 16

    public var body: some View {
        ZStack {
            GeometryReader { geometry in
                content
                    .cornerRadius(cornerRadius)
                    .frame(width: geometry.size.width,
                           height: geometry.size.height)
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
            Drawer(currentPosition: UIScreen.main.bounds.height - 135) {
                Color.blue
            }.rest(in: [0, UIScreen.main.bounds.height - 135])
        }
        .edgesIgnoringSafeArea(.vertical)
    }
}

extension Drawer {

    /// A bottom-up drawer view
    /// - Parameters:
    public init(restingPositions: [CGFloat] = [0],
                  currentPosition: CGFloat? = nil,
                  @ViewBuilder _ content: () -> Content) {
                      self.content = content()
                      self._snapPositions = .init(initialValue: restingPositions)
                      self._currentPosition = .init(initialValue: currentPosition ?? restingPositions.first!)
    }
}
