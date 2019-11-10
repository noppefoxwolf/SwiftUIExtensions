//
//  File.swift
//  
//
//  Created by Tomoya Hirano on 2019/11/10.
//

import SwiftUI
import UIKit

public struct TabBarView: UIViewControllerRepresentable {
    public typealias UIViewControllerType = UITabBarController
    let viewControllers: [UIHostingController<AnyView>]
    
    public init(@TabItemBuilder content: () -> TabBarItem) {
        viewControllers = [content()].map({ (item) in
            let vc = UIHostingController(rootView: item.view)
            let tabBarItem = UITabBarItem()
            tabBarItem.title = item.title
            tabBarItem.image = item.image
            vc.tabBarItem = tabBarItem
            return vc
        })
    }
    
    public init(@TabItemBuilder content: () -> [TabBarItem]) {
        viewControllers = content().map({ (item) in
            let vc = UIHostingController(rootView: item.view)
            let tabBarItem = UITabBarItem()
            tabBarItem.title = item.title
            tabBarItem.image = item.image
            vc.tabBarItem = tabBarItem
            return vc
        })
    }
    
    public func makeUIViewController(context: Context) -> UIViewControllerType {
        return UITabBarController()
    }
    
    public func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        uiViewController.setViewControllers(viewControllers, animated: false)
    }
}

public struct TabBarItem {
    let view: AnyView
    let title: String?
    let image: UIImage?
}

@_functionBuilder public struct TabItemBuilder {
    public static func buildBlock() -> TabBarItem {
        return EmptyView().tabBarItem()
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
    func tabBarItem(title: String? = nil, image: UIImage? = nil) -> TabBarItem {
        TabBarItem(view: AnyView(self), title: title, image: image)
    }
}
