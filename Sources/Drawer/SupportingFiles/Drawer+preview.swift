//
//  File.swift
//  
//
//  Created by Bruno Wide on 16/02/22.
//

import Foundation
import SwiftUI

struct TestView: View {

    @State var radius: CGFloat = 16

    var body: some View {
        GeometryReader { geometry in
            Drawer({
                EmptyView()
            }, handle: {
                DrawerHandles.defaultHandle
            })
            .cornerRadius(radius)
            .onRest({ position in
                radius = position == geometry.size.height
                    ? 0
                    : 16
            })
            .onDrag({ _ in
                radius = 16
            })
            .background(color: .blue)
            .rest(in: [136, geometry.size.height])
            .handle(height: 6, padding: 10)
        }
    }
}

struct ContentPreviews: PreviewProvider {

    static var previews: some View {
        Group {
            ZStack {
                Color.black
                TestView()
            }.edgesIgnoringSafeArea(.vertical)
                .previewDevice("iPhone SE (2nd generation)")
        }
    }
}
