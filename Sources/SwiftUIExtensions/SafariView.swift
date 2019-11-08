//
//  SafariView.swift
//  rise
//
//  Created by Tomoya Hirano on 2019/11/04.
//  Copyright © 2019 Tomoya Hirano. All rights reserved.
//

import SwiftUI
import SafariServices

public struct SafariView: UIViewControllerRepresentable {
    public typealias UIViewControllerType = SFSafariViewController

    let url: URL
    
    public init(_ url: URL) {
        self.url = url
    }

    public func makeUIViewController(context: UIViewControllerRepresentableContext<SafariView>) -> UIViewControllerType {
        return SFSafariViewController(url: url)
    }

    public func updateUIViewController(_ safariViewController: UIViewControllerType,
                                       context: UIViewControllerRepresentableContext<SafariView>) {
    }
}

#if DEBUG
struct SafariView_Previews: PreviewProvider {
    static var previews: some View {
        SafariView(URL(string: "https://david.y4ng.fr")!)
    }
}
#endif
