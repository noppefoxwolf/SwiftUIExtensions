//
//  ActivityIndicator.swift
//  Buildrise
//
//  Created by Tomoya Hirano on 2019/11/02.
//  Copyright © 2019 Tomoya Hirano. All rights reserved.
//

import SwiftUI
import UIKit

public struct ActivityIndicator: UIViewRepresentable {
    public typealias UIViewType = UIActivityIndicatorView
    let style: UIActivityIndicatorView.Style
    @Binding var isAnimating: Bool
    
    public init(style: UIActivityIndicatorView.Style, isAnimating: Binding<Bool>) {
        self.style = style
        self._isAnimating = isAnimating
    }

    public func makeUIView(context: UIViewRepresentableContext<ActivityIndicator>) -> UIViewType {
        return UIActivityIndicatorView(style: style)
    }

    public func updateUIView(_ uiView: UIViewType, context: UIViewRepresentableContext<ActivityIndicator>) {
        isAnimating ? uiView.startAnimating() : uiView.stopAnimating()
    }
}

struct ActivityIndicator_Previews: PreviewProvider {
    static var previews: some View {
        ActivityIndicator(style: .medium, isAnimating: .constant(false))
    }
}
