//
//  UIViewOptimizedRepresentable.swift
//  
//
//  Created by Tomoya Hirano on 2019/11/13.
//

import SwiftUI

public protocol UIViewOptimizedRepresentable: UIViewRepresentable {
    associatedtype Value: Hashable
    var value: Value { get }
    init(_ value: Value)
    func shouldUpdateUIView(_ uiView: Self.UIViewType, context: Self.Context)
}

public extension UIViewOptimizedRepresentable {
    func updateUIView(_ uiView: Self.UIViewType, context: Self.Context) {
        guard uiView.tag != self.value.hashValue else { return }
        shouldUpdateUIView(uiView, context: context)
        uiView.tag = self.value.hashValue
    }
}
