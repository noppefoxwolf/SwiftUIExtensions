//
//  File.swift
//  
//
//  Created by Tomoya Hirano on 2019/11/10.
//

import SwiftUI

#if canImport(UIKit)
import UIKit

public struct TabBarView: UIViewControllerRepresentable {
    public typealias UIViewControllerType = UITabBarController
    let contents: [TabBarItem]
    let store: TabBarViewStore
    
    public init(store: TabBarViewStore, @TabItemBuilder content: () -> TabBarItem) {
        self.store = store
        self.contents = [content()]
    }
    
    public init(store: TabBarViewStore, @TabItemBuilder content: () -> [TabBarItem]) {
        self.store = store
        self.contents = content()
    }
    
    public func makeUIViewController(context: Context) -> UIViewControllerType {
        return UITabBarController()
    }
    
    public func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        store.update(contents)
        uiViewController.setViewControllers(store.viewControllers.sorted(by: { $0.key < $1.key }).map({ $0.value }), animated: false)
    }
}

public class TabBarViewStore {
    var viewControllers: [Int : UIViewController] = [:]
    
    public init() {
        
    }
    
    func update(_ contents: [TabBarItem]) {
        var result: [Int : UIViewController] = [:]
        for content in contents {
            let vc: UIViewController = viewControllers.first(where: { $0.key == content.tag })?.value ?? UIHostingController(rootView: content.view)
            let tabBarItem = UITabBarItem()
            tabBarItem.title = content.title
            tabBarItem.image = content.image
            vc.tabBarItem = tabBarItem
            result[content.tag] = vc
        }
        self.viewControllers = result
    }
}

public struct TabBarItem {
    let tag: Int
    let view: AnyView
    let title: String?
    let image: UIImage?
}

@_functionBuilder public struct TabItemBuilder {
    public static func buildBlock() -> TabBarItem {
        return EmptyView().tabBarItem(tag: 0)
    }

    public static func buildBlock(_ content: TabBarItem) -> TabBarItem {
        return content
    }
    
    public static func buildBlock(_ c0: TabBarItem, _ c1: TabBarItem) -> [TabBarItem] {
        return [c0, c1]
    }
    
    public static func buildBlock(_ c0: TabBarItem, _ c1: TabBarItem, _ c2: TabBarItem) -> [TabBarItem] {
        return [c0, c1, c2]
    }
    
    public static func buildBlock(_ c0: TabBarItem, _ c1: TabBarItem, _ c2: TabBarItem, _ c3: TabBarItem) -> [TabBarItem] {
        return [c0, c1, c2, c3]
    }
}

public extension View {
    func tabBarItem(tag: Int, title: String? = nil, image: UIImage? = nil) -> TabBarItem {
        TabBarItem(tag: tag, view: AnyView(self), title: title, image: image)
    }
}
#endif
