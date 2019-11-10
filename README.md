# SwiftUIExtensions

## Presentation items

```swift
@State var alertItem: AlertItem? = nil
@State var sheetItem: SheetItem? = nil
@State var actionSheetItem: ActionSheetItem? = nil

currentView
    .alert(item: $alertItem, content: { $0.alert })
    .sheet(item: $sheetItem, content: { $0 })
    .actionSheet(item: $actionSheetItem, content: { $0.actionSheet })
```

## UIKit Wrapper

- ActivityIndicator
- SafariView

## TabBarView

Tab style view that able to keep view presentation state.

```swift
TabBarView {
    Text("1").tabBarItem(title: "item1", image: UIImage(systemName: "circle.fill"))
    
    Text("2").tabBarItem(title: "item2", image: UIImage(systemName: "circle.fill"))

    Text("3").tabBarItem(title: "item3", image: UIImage(systemName: "circle.fill"))
}
```
