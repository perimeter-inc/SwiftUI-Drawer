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
        DragGesture()
            .onChanged { dragChanged($0) }
            .onEnded { dragEnded($0) }
    }

    func dragChanged(_ value: DragGesture.Value) {
        let newPosition = lastDragPosition + value.translation.height

        guard newPosition > 0 else { return }
        
        animation = .none
        currentPosition = newPosition
    }

    func dragEnded(_ value: DragGesture.Value) {
        let newPosition =
            lastDragPosition + value.predictedEndTranslation.height

        animation = .spring()
        snap(with: newPosition)
        lastDragPosition = currentPosition
    }

    func snap(with position: CGFloat) {
        currentPosition = nearest(of: position)
    }

    func nearest(of value: CGFloat) -> CGFloat {
        snapPositions
            .sorted { abs($0 - value) < abs($1 - value) }
            .first!
    }
}

struct DrawerGesturePreviews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.gray
            Drawer {
                Color.blue
            }
        }
    }
}
