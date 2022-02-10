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
        let newPosition = lastDragPosition - value.translation.height
        
        animation = .none
        currentPosition = newPosition
    }

    func dragEnded(_ value: DragGesture.Value) {
        let newPosition =
            lastDragPosition - value.predictedEndTranslation.height

        animation = .spring()
        currentPosition = nearest(of: newPosition)
        lastDragPosition = currentPosition
    }
}

struct DrawerGesturePreviews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.gray
            GeometryReader { g in
                Drawer {
                    Color.blue
                }.rest(in: [123, g.size.height])
            }
        }
        .edgesIgnoringSafeArea(.vertical)
    }
}
