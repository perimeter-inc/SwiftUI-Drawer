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
            .rest(in: [200, geometry.size.height])
        }
        .edgesIgnoringSafeArea(.vertical)
     ```
        - Important:
        - This `overrides` `interactive(in:)`. make sure to call `interactive(in:)` after this method
        - the drawer initial position will be set at the first resting position
        - to use the full height of the display you'll can add `.edgesIgnoringSafeArea(.vertical)`
     */
    public func rest(in positions: [CGFloat]) -> Drawer {
        Drawer(content: content, handle: handle,
               restingPositions: positions,
               interactivePositions: positions,
               lastDragPosition: positions.first ?? currentPosition,
               currentPosition: positions.first ?? currentPosition,
               animation: animation,
               cornerRadius: $cornerRadius,
               handlePadding: handlePadding,
               handleHeight: handleHeight,
               backgroundColor: backgroundColor,
               willRestAt: willRestAt,
               onDrag: onDrag)
    }

    /**
     A drawer that is interactible when resting in this array of positions
     - Parameter positions: resting positions where the drawer is interactible, where 0 is the bottom of the view
     */
    public func interactive(in positions: [CGFloat]) -> Drawer {
        Drawer(content: content, handle: handle,
               restingPositions: restingPositions,
               interactivePositions: positions,
               lastDragPosition: lastDragPosition,
               currentPosition: currentPosition,
               animation: animation,
               cornerRadius: $cornerRadius,
               handlePadding: handlePadding,
               handleHeight: handleHeight,
               backgroundColor: backgroundColor,
               willRestAt: willRestAt,
               onDrag: onDrag)
    }

    /**
     Adjusts the padding of the handle view
     - Parameter Height: height of your handle.
     - Parameter padding: padding of your handle.
     - Example:
        to get a drawer view height of 26, you can use:
     ```
        Drawer {
            Color.blue
        }
        .handle(height: 6, padding: 10)
     ```

     - Important: The total height of the handle view is defined by `height` + 2 * `padding`
     */
    public func handle(height: CGFloat? = nil, padding: CGFloat? = nil) -> Drawer {
        Drawer(content: content, handle: handle,
               restingPositions: restingPositions,
               interactivePositions: interactivePositions,
               lastDragPosition: lastDragPosition,
               currentPosition: currentPosition,
               animation: animation,
               cornerRadius: $cornerRadius,
               handlePadding: padding ?? handlePadding,
               handleHeight: height ?? handleHeight,
               backgroundColor: backgroundColor,
               willRestAt: willRestAt,
               onDrag: onDrag)
    }

    /**
     sets drawer content as scrollable.

     you can call `.drawerScrollView()` directly in your content to get access to more LegacyScrollView callbacks

     - Important: use this instead of adding a ScrollView to your content to ensure that you'll be able to scroll down the drawer
     */
    public func scrollableContent() -> Drawer<AnyView, Handle> {
        Drawer<AnyView, Handle>(content: AnyView(content.drawerScrollView()),
                                handle: handle,
                                restingPositions: restingPositions,
                                interactivePositions: interactivePositions,
                                lastDragPosition: lastDragPosition,
                                currentPosition: currentPosition,
                                animation: animation,
                                cornerRadius: $cornerRadius,
                                handlePadding: handlePadding,
                                handleHeight: handleHeight,
                                backgroundColor: backgroundColor,
                                willRestAt: willRestAt,
                                onDrag: onDrag)
    }

    /**
     adds a background color to the drawer and i'ts handle view
     */
    public func background(color: Color) -> Drawer {
        Drawer(content: content, handle: handle,
               restingPositions: restingPositions,
               interactivePositions: interactivePositions,
               lastDragPosition: lastDragPosition,
               currentPosition: currentPosition,
               animation: animation,
               cornerRadius: $cornerRadius,
               handlePadding: handlePadding,
               handleHeight: handleHeight,
               backgroundColor: color,
               willRestAt: willRestAt,
               onDrag: onDrag)
    }


    /**
     adds a binding for a corner radius applied to the top corners of the drawer
     */
    public func cornerRadius(_ radius: Binding<CGFloat>) -> Drawer {
        Drawer(content: content, handle: handle,
               restingPositions: restingPositions,
               interactivePositions: interactivePositions,
               lastDragPosition: lastDragPosition,
               currentPosition: currentPosition,
               animation: animation,
               cornerRadius: radius,
               handlePadding: handlePadding,
               handleHeight: handleHeight,
               backgroundColor: backgroundColor,
               willRestAt: willRestAt,
               onDrag: onDrag)
    }

    /**
     adds a fixed corner radius to the top edges of the drawer
     */
    public func cornerRadius(_ radius: CGFloat) -> Drawer {
        Drawer(content: content, handle: handle,
               restingPositions: restingPositions,
               interactivePositions: interactivePositions,
               lastDragPosition: lastDragPosition,
               currentPosition: currentPosition,
               animation: animation,
               cornerRadius: .constant(radius),
               handlePadding: handlePadding,
               handleHeight: handleHeight,
               backgroundColor: backgroundColor,
               willRestAt: willRestAt,
               onDrag: onDrag)
    }


}
