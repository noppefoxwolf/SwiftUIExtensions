//
//  ContentView.swift
//  SwiftUIExtensions
//
//  Created by Tomoya Hirano on 2020/08/29.
//

import SwiftUI
import PhotosUI
import Photos

struct PHPicker: UIViewControllerRepresentable, Identifiable {
    let id: String = "dev.noppe.ImagePicker"
    @Environment(\.presentationMode) var presentationMode
    let onCompletion: ([PHPickerResult]) -> Void
    let configuration: PHPickerConfiguration
    
    init(
        configuration: PHPickerConfiguration = .init(photoLibrary: PHPhotoLibrary.shared()),
        onCompletion: @escaping (([PHPickerResult]) -> Void)) {
        self.onCompletion = onCompletion
        self.configuration = configuration
    }
    
    class Coordinator: NSObject, PHPickerViewControllerDelegate {
        let parent: PHPicker
        
        init(_ parent: PHPicker) {
            self.parent = parent
        }
        
        func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
            parent.onCompletion(results)
            parent.presentationMode.wrappedValue.dismiss()
        }
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<Self>) -> PHPickerViewController {
        let picker = PHPickerViewController(configuration: configuration)
        picker.delegate = context.coordinator
        return picker
    }
    
    func updateUIViewController(_ uiViewController: PHPickerViewController, context: UIViewControllerRepresentableContext<Self>) {
    }
}
