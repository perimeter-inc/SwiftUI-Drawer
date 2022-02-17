//
//  Drawer+Handle.swift
//  
//
//  Created by Bruno Wide on 09/02/22.
//

import Foundation
import SwiftUI

extension Drawer {
    @ViewBuilder
    func drawerHandle(_ geometry: GeometryProxy) -> some View {
        ZStack {
            backgroundColor
            VStack {
                Spacer()
                handle
                    .frame(height: handleHeight)
                Spacer()
                    .frame(height: handlePadding)
            }
        }
        .frame(height: handleViewHeight(with: geometry))
        .animation(animation)
    }

    func handleViewHeight(with geometry: GeometryProxy) -> CGFloat {
        let minHeight: CGFloat = handlePadding * 2
                                 + handleHeight

        let maxHeight: CGFloat = safeAreaInsets.top +
                                 handleHeight +
                                 handlePadding


        let ans = maxHeight - offset(with: geometry)

        return min(max(ans,minHeight), maxHeight)
    }
}

public struct DrawerHandles {
    static var defaultHandle: some View {
        RoundedRectangle(cornerRadius: 3)
            .foregroundColor(.gray.opacity(0.88))
            .frame(width: 40, height: 6)
    }
}
