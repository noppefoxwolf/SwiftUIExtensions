//
//  ContentView.swift
//  SwiftUIExtensions
//
//  Created by Tomoya Hirano on 2020/08/29.
//

import SwiftUI
import PhotosUI
import Photos

@available(iOS 14, *)
public struct PHPicker: UIViewControllerRepresentable, Identifiable {
    public let id: String = "dev.noppe.ImagePicker"
    @Environment(\.presentationMode) public var presentationMode
    let onCompletion: ([PHPickerResult]) -> Void
    let configuration: PHPickerConfiguration
    
    public init(
        configuration: PHPickerConfiguration = .init(photoLibrary: PHPhotoLibrary.shared()),
        onCompletion: @escaping (([PHPickerResult]) -> Void)) {
        self.onCompletion = onCompletion
        self.configuration = configuration
    }
    
    public class Coordinator: NSObject, PHPickerViewControllerDelegate {
        let parent: PHPicker
        
        init(_ parent: PHPicker) {
            self.parent = parent
        }
        
        public func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
            parent.onCompletion(results)
            parent.presentationMode.wrappedValue.dismiss()
        }
    }
    
    public func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    public func makeUIViewController(context: UIViewControllerRepresentableContext<Self>) -> PHPickerViewController {
        let picker = PHPickerViewController(configuration: configuration)
        picker.delegate = context.coordinator
        return picker
    }
    
    public func updateUIViewController(_ uiViewController: PHPickerViewController, context: UIViewControllerRepresentableContext<Self>) {
    }
}
