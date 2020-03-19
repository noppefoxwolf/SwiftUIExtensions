//
//  File.swift
//  
//
//  Created by Tomoya Hirano on 2019/11/13.
//

import SwiftUI

#if canImport(UIKit)
import UIKit

public struct UIView<UIViewType: UIKit.UIView, Value: Hashable>: UIViewRepresentable {
    public typealias UpdateHandler = (_ uiView: UIViewType, _ value: Value, _ context: UIViewRepresentableContext<Self>) -> Void
    let value: Value
    let updateHandler: UpdateHandler
    
    public init(_ value: Value, _ updateHandler: @escaping UpdateHandler) {
        self.value = value
        self.updateHandler = updateHandler
    }
    
    public func makeUIView(context: UIViewRepresentableContext<Self>) -> UIViewType {
        return UIViewType(frame: .zero)
    }
    
    public func updateUIView(_ uiView: UIViewType, context: UIViewRepresentableContext<Self>) {
        guard uiView.tag != self.value.hashValue else { return }
        updateHandler(uiView, value, context)
        uiView.tag = self.value.hashValue
    }
}
#endif
