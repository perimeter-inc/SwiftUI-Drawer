//
//  Drawer+Handle.swift
//  
//
//  Created by Bruno Wide on 09/02/22.
//

import Foundation
import SwiftUI

extension Drawer {
    func offset(with geometry: GeometryProxy) -> CGFloat {
        let ans = geometry.size.height - currentPosition

        let maxPosition = geometry.size.height // bottom
        let minPosition = 0.0 // top

        guard ans < maxPosition else { return maxPosition } // handle must stay within safe area insets
        guard ans >= minPosition else { return minPosition }

        return ans
    }

    func handleOffset(with geometry: GeometryProxy) -> CGFloat {
        let ans = geometry.size.height - currentPosition + handleOffsetFromDrawer

        let maxPosition = geometry.size.height // bottom
        let minPosition = handleMaxPosition

        debugText = "handle max = \(maxPosition)"

        guard ans < maxPosition else { return maxPosition } // handle must stay within safe area insets
        guard ans >= minPosition else { return minPosition }

        return ans
    }
    
}

public struct DrawerHandles {
    static var defaultHandle: some View {
        RoundedRectangle(cornerRadius: 3)
            .foregroundColor(.gray.opacity(0.88))
            .frame(width: 40, height: 6)
    }
}

struct DrawerHandlesPreview: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black
            GeometryReader { geometry in
                Drawer({
                    Color.blue
                }, handle: {
                    DrawerHandles.defaultHandle
                })
                    .withHandleOffset(0, and: 54)
                    .rest(in: [135, geometry.size.height])
            }
        }.edgesIgnoringSafeArea(.vertical)
    }
}
