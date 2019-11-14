//
//  Image+Extensions.swift
//  
//
//  Created by Tomoya Hirano on 2019/11/15.
//

import SwiftUI

public extension Image {
    func fitting(width: CGFloat, height: CGFloat, contentMode: ContentMode) -> some View {
        resizable().aspectRatio(contentMode: contentMode).frame(width: width, height: height).clipped()
    }
}
