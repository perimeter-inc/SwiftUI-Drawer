//
//  Drawer+modifiers.swift
//  
//
//  Created by Bruno Wide on 09/02/22.
//

import Foundation
import SwiftUI

extension Drawer {
    public func rest(in positions: [CGFloat]) -> Drawer {
        Drawer(content: content,
               snapPositions: positions,
               lastDragPosition: lastDragPosition,
               currentPosition: currentPosition,
               animation: animation,
               cornerRadius: cornerRadius)
    }
}
