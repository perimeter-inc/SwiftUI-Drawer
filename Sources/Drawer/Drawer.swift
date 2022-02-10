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
    @State internal var cornerRadius: CGFloat = 16

    public var body: some View {
        ZStack {
            Spacer()
            drawer
            #if DEBUG
            debugLayer
            #endif
        }
        .edgesIgnoringSafeArea(.vertical)
    }

    var drawer: some View {
        GeometryReader { geometry in
            ZStack {
                content
                    .cornerRadius(cornerRadius)
                    .frame(width: geometry.size.width,
                           height: geometry.size.height)
                    .offset(y: offset(with: geometry))
                    .animation(animation)
                    .gesture(dragGesture)
                handle
                    .animation(animation)
                    .position(x: geometry.size.width/2,
                              y: offset(with: geometry))
            }
        }
    }

    @State var debugText: String = ""

    var debugLayer: some View {
        VStack {
            Text("rest: \(restingPositions.description)")
            Text("position: \(currentPosition)")
            Text("next snap: \(nearest(of: currentPosition))")
            Text(debugText)
        }
        .foregroundColor(.white)
    }
}

struct DrawerPreviews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black
            GeometryReader { geometry in
                Drawer ({
                    Color.blue
                }, handle: {
                    DrawerHandles.defaultHandle
                })
                .rest(in: [135, geometry.size.height])
            }
        }.edgesIgnoringSafeArea(.vertical)
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
