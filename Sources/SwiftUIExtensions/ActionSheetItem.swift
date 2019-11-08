//
//  ActionSheetItem.swift
//
//
//  Created by Tomoya Hirano on 2019/11/09.
//

import SwiftUI

public struct ActionSheetItem: Identifiable {
    public let id: String
    public let actionSheet: ActionSheet
    
    public init(_ actionSheet: ActionSheet, id: String = UUID().uuidString) {
        self.actionSheet = actionSheet
        self.id = id
    }
}
