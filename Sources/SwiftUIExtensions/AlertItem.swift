//
//  ActionSheetItem.swift
//
//
//  Created by Tomoya Hirano on 2019/11/09.
//

import SwiftUI

public struct AlertItem: Identifiable {
    public let id: String
    public let alert: Alert
    
    public init(_ alert: Alert, id: String = UUID().uuidString) {
        self.alert = alert
        self.id = id
    }
}
