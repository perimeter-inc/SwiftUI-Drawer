//
//  File.swift
//  
//
//  Created by Bruno Wide on 11/02/22.
//

import Foundation
import SwiftUI

extension Drawer {
    public func onRest(_ willRestAt: @escaping (CGFloat) -> Void) -> Drawer {
        Drawer(content: content, handle: handle,
               restingPositions: restingPositions,
               lastDragPosition: lastDragPosition,
               currentPosition: currentPosition,
               animation: animation,
               cornerRadius: $cornerRadius,
               handleMaxPosition: handleMaxPosition,
               handleOffsetFromDrawer: handleOffsetFromDrawer,
               willRestAt: willRestAt,
               onDrag: onDrag)
    }

    public func onDrag(_ onDrag: @escaping (CGFloat) -> Void) -> Drawer {
        Drawer(content: content, handle: handle,
               restingPositions: restingPositions,
               lastDragPosition: lastDragPosition,
               currentPosition: currentPosition,
               animation: animation,
               cornerRadius: $cornerRadius,
               handleMaxPosition: handleMaxPosition,
               handleOffsetFromDrawer: handleOffsetFromDrawer,
               willRestAt: willRestAt,
               onDrag: onDrag)
    }
}
