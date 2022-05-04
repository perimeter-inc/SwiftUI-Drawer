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
    /// positions where the user is enabled to interact with drawer's content
    @State internal var interactivePositions: [CGFloat]
    /// helper variable for dragging logic
    @State internal var lastDragPosition: CGFloat
    /// The current height of the displayed drawer
    @State internal var currentPosition: CGFloat
    /// current animation applied to drawer
    @State internal var animation: Animation?
    /// corner radius aplied to drawer's corners
    @Binding internal var cornerRadius: CGFloat

    /// offset set between the handle and the drawer
    var handlePadding: CGFloat
    /// height of your handle's content
    var handleHeight: CGFloat
    /// background color applied to drawer handle
    var backgroundColor: Color
    
    var willRestAt: ((CGFloat) -> Void)?
    var onDrag: ((CGFloat) -> Void)?
    var onDragEnded: ((CGFloat) -> Void)?

    @Environment(\.safeAreaInsets) var safeAreaInsets

    public var body: some View {
        GeometryReader { geometry in
            VStack(spacing: .zero) {
                drawerHandle(geometry)
                ZStack {
                    backgroundColor
                    content
                        .disabled(!interactivePositions.contains(currentPosition))
                }
            }
            .cornerRadius(cornerRadius, corners: [.topLeft, .topRight])
            .offset(y: offset(with: geometry))
            .simultaneousGesture(dragGesture)
            .animation(animation)
        }
            .edgesIgnoringSafeArea(.vertical)
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
    public init(restingPositions: [CGFloat] = [100],
    @ViewBuilder _ content: () -> Content,
    @ViewBuilder handle: () -> Handle) {
        self.content = content()
        self.handle = handle()
        self._restingPositions = .init(initialValue: restingPositions)
        self._interactivePositions = .init(initialValue: restingPositions)
        self._currentPosition = .init(initialValue: restingPositions.first!)
        self._lastDragPosition = .init(initialValue: restingPositions.first!)
        self._cornerRadius = .constant(16)
        self.handlePadding = 10
        self.handleHeight = 6
        self.backgroundColor = .clear
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
