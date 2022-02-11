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

        let maxOffset = geometry.size.height
        let minOffset = 0.0

        return min(max(ans,minOffset), maxOffset)
    }

    func handleOffset(with geometry: GeometryProxy) -> CGFloat {
        let ans = geometry.size.height - currentPosition + handleOffsetFromDrawer

        let maxOffset = geometry.size.height
        let minOffset = handleMaxPosition

        return min(max(ans,minOffset), maxOffset)
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
                    .withHandleOffset(13, and: 54)
                    .rest(in: [135, geometry.size.height])
            }
        }.edgesIgnoringSafeArea(.vertical)
    }
}
