//
//  File.swift
//  
//
//  Created by Bruno Wide on 09/02/22.
//

import Foundation
import SwiftUI

struct DrawerExamplePreviews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.gray
            Drawer {
                Color.blue
            }
        }
    }
}
