//
//  SheetItem.swift
//  
//
//  Created by Tomoya Hirano on 2019/11/09.
//

import SwiftUI

public struct SheetItem: Identifiable, View {
    public let id: String
    let view: AnyView
    
    public init<T: View>(_ view: T, id: String) {
        self.view = AnyView(view)
        self.id = id
    }
    
    public init<T: View & Identifiable>(_ view: T) where T.ID == String {
        self.init(view, id: view.id)
    }
    
    public var body: some View {
        view
    }
}
