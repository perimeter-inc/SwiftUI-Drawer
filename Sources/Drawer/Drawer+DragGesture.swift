//
//  File.swift
//  
//
//  Created by Bruno Wide on 08/02/22.
//

import Foundation
import SwiftUI

extension Drawer {

    var dragGesture: some Gesture {
        DragGesture(minimumDistance: 30, coordinateSpace: .local)
            .onChanged { dragChanged($0) }
            .onEnded { dragEnded($0) }
    }

    func dragChanged(_ value: DragGesture.Value) {
        if lastDragPosition == nil { lastDragPosition = currentPosition }
        guard let lastPosition = lastDragPosition else { return }
        
        animation = .none
        currentPosition = lastPosition - value.translation.height
        onDrag?(currentPosition)
    }

    func dragEnded(_ value: DragGesture.Value) {
        guard let lastPosition = lastDragPosition else { return }
        
        let newRestingPosition = nearest(of: lastPosition - value.predictedEndTranslation.height)

        lastDragPosition = nil
        
        animation = .spring()
        currentPosition = newRestingPosition
        willRestAt?(newRestingPosition)
    }

    func nearest(of value: CGFloat) -> CGFloat {
        guard
            let ans = restingPositions
                .sorted(by: { abs($0 - value) < abs($1 - value) })
                .first
        else {
            fatalError("drawer needs at least one resting position")
        }

        return ans
    }

    func offset(with geometry: GeometryProxy) -> CGFloat {
        let ans = geometry.size.height - currentPosition

        let maxOffset = geometry.size.height
        let minOffset = 0.0

        return min(max(ans,minOffset), maxOffset)
    }
}
