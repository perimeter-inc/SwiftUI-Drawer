//
//  File.swift
//  
//
//  Created by Bruno Wide on 08/02/22.
//

import Foundation
import SwiftUI

/// A bottom-up drawer view
public struct Drawer<Content: View, Handle: View>: View {

    /// content displayed by the drawer
    var content: Content
    var handle: Handle

    ///partial height that the drawer can snap to
    @State internal var restingPositions: [CGFloat]
    /// helper variable for dragging logic
    @State internal var lastDragPosition: CGFloat
    /// The current height of the displayed drawer
    @State internal var currentPosition: CGFloat
    /// current animation applied to drawer
    @State internal var animation: Animation?
    /// corner radius aplied to drawer's corners
    @Binding internal var cornerRadius: CGFloat
    /// maximum height for the handle to move to
    var handleMaxPosition: CGFloat
    /// offset of handle from the top of the drawer
    var handleOffsetFromDrawer: CGFloat
    
    var willRestAt: ((CGFloat) -> Void)?
    var onDrag: ((CGFloat) -> Void)?

    public var body: some View {
        ZStack {
            Spacer()
            drawer
        }
        .edgesIgnoringSafeArea(.vertical)
    }

    var drawer: some View {
        GeometryReader { geometry in
            ZStack {
                content
                    .cornerRadius(cornerRadius, corners: [.topLeft, .topRight])
                    .frame(width: geometry.size.width,
                           height: geometry.size.height)
                    .offset(y: offset(with: geometry))
                    .gesture(dragGesture)
                    .animation(animation)
                handle
                    .position(x: geometry.size.width/2,
                              y: handleOffset(with: geometry))
                    .animation(animation)
            }
        }
    }
}

struct DrawerPreviews: PreviewProvider {
    static var previews: some View {
        Group {
            ZStack {
                Color.black
                GeometryReader { geometry in
                    Drawer({
                        Color.blue
                    }, handle: {
                        DrawerHandles.defaultHandle
                    })
                        .withHandleOffset(13, and: 54)
                        .rest(in: [135, geometry.size.height])
                }
            }.edgesIgnoringSafeArea(.vertical)
        }
    }
}

extension Drawer {
    /**
     A bottom-up drawer view with a custom handle
     - Parameters:
        - restingPositions: positions where the drawer rests
        - handle: representing the handle of a drawer, this sits on top of the drawer view and moves with it

      - Example:
     ```
     Drawer({
         Color.blue
     }, handle: {
         DrawerHandles.defaultHandle
     })
     ```
     */
    public init(restingPositions: [CGFloat] = [0],
    @ViewBuilder _ content: () -> Content,
    @ViewBuilder handle: () -> Handle) {
        self.content = content()
        self.handle = handle()
        self._restingPositions = .init(initialValue: restingPositions)
        self._currentPosition = .init(initialValue: restingPositions.first!)
        self._lastDragPosition = .init(initialValue: restingPositions.first!)
        self._cornerRadius = .constant(16)
        self.handleMaxPosition = 54
        self.handleOffsetFromDrawer = 10
    }

    /// A bottom-up drawer view with no handle
    /// - Parameters:
    ///    - restingPositions: positions where the drawer rests
    public init(restingPositions: [CGFloat] = [0],
    @ViewBuilder _ content: () -> Content) where Handle == EmptyView {
        self.init(restingPositions: restingPositions,
                  content, handle: { EmptyView() })
    }
}
