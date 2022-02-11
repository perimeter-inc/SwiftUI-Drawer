//
//  Drawer+modifiers.swift
//  
//
//  Created by Bruno Wide on 09/02/22.
//

import Foundation
import SwiftUI

extension Drawer {
    /**
     A drawer that rests in this array of positions
     - Parameter positions: resting positions, where 0 is the bottom of the view
     - Example:
        this drawer rests nearly closet at 200 and fully opened at geometry.size.height
     ```
        GeometryReader { geometry in
            Drawer {
                Color.blue
            }
        }
        .rest(in: [200, geometry.size.height])
        .edgesIgnoringSafeArea(.vertical)
     ```
        - Important:
        - the drawer initial position will be set at the first resting position
        - to use the full height of the display you'll can add `.edgesIgnoringSafeArea(.vertical)`
     */
    public func rest(in positions: [CGFloat]) -> Drawer {
        Drawer(content: content, handle: handle,
               restingPositions: positions,
               lastDragPosition: positions.first ?? currentPosition,
               currentPosition: positions.first ?? currentPosition,
               animation: animation,
               cornerRadius: $cornerRadius,
               handleMaxPosition: handleMaxPosition,
               handleOffsetFromDrawer: handleOffsetFromDrawer,
               willRestAt: willRestAt,
               onDrag: onDrag)
    }

    /**
     Adjusts the offset of the handle
     - Parameter offset: offset between the center of the handle and the top of the drawer
     - Parameter maxPosition: maximum distance between the centert of the handle and the top of the view (when working without safe area insets)

     - Important:
        - to use the full height of the display you'll can add `.edgesIgnoringSafeArea(.vertical)`
     */
    public func withHandleOffset(_ offset: CGFloat, and maxPosition: CGFloat? = nil) -> Drawer {
        Drawer(content: content, handle: handle,
               restingPositions: restingPositions,
               lastDragPosition: lastDragPosition,
               currentPosition: currentPosition,
               animation: animation,
               cornerRadius: $cornerRadius,
               handleMaxPosition: maxPosition ?? handleMaxPosition,
               handleOffsetFromDrawer: offset,
               willRestAt: willRestAt,
               onDrag: onDrag)
    }


    public func cornerRadius(_ radius: Binding<CGFloat>) -> Drawer {
        Drawer(content: content, handle: handle,
               restingPositions: restingPositions,
               lastDragPosition: lastDragPosition,
               currentPosition: currentPosition,
               animation: animation,
               cornerRadius: radius,
               handleMaxPosition: handleMaxPosition,
               handleOffsetFromDrawer: handleOffsetFromDrawer,
               willRestAt: willRestAt,
               onDrag: onDrag)
    }

    public func cornerRadius(_ radius: CGFloat) -> Drawer {
        Drawer(content: content, handle: handle,
               restingPositions: restingPositions,
               lastDragPosition: lastDragPosition,
               currentPosition: currentPosition,
               animation: animation,
               cornerRadius: .constant(radius),
               handleMaxPosition: handleMaxPosition,
               handleOffsetFromDrawer: handleOffsetFromDrawer,
               willRestAt: willRestAt,
               onDrag: onDrag)
    }
}

struct DrawerModifiersPreview: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black
            GeometryReader { geometry in
                Drawer({
                    Color.blue
                }, handle: {
                    DrawerHandles.defaultHandle
                })
                .rest(in: [135, geometry.size.height])
            }
        }.edgesIgnoringSafeArea(.vertical)
    }
}
