//
//  Drawer+Helpers.swift
//  
//
//  Created by Bruno Wide on 09/02/22.
//

import Foundation
import SwiftUI

extension Drawer {
    func offset(with geometry: GeometryProxy) -> CGFloat {
        let ans = geometry.size.height - currentPosition

        guard ans < geometry.size.height else { return geometry.size.height }
        guard ans >= 0 else { return 0 }

        return ans
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
}
