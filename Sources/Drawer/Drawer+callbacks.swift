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
               interactivePositions: interactivePositions,
               lastDragPosition: lastDragPosition,
               currentPosition: currentPosition,
               animation: animation,
               cornerRadius: $cornerRadius,
               handlePadding: handlePadding,
               handleHeight: handleHeight,
               backgroundColor: backgroundColor,
               willRestAt: willRestAt,
               onDrag: onDrag,
               onDragEnded: onDragEnded)
    }

    public func onDrag(_ onDrag: @escaping (CGFloat) -> Void) -> Drawer {
        Drawer(content: content, handle: handle,
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
               onDrag: onDrag,
               onDragEnded: onDragEnded)
    }

    public func onDragEnded(_ onDragEnded: @escaping (CGFloat) -> Void) -> Drawer {
        Drawer(content: content, handle: handle,
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
               onDrag: onDrag,
               onDragEnded: onDragEnded)
    }
}
