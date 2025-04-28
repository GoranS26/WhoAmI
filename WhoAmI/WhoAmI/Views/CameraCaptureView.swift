//
//  CameraCaptureView.swift
//  WhoAmI
//
//  Created by Goran Saric on 28.04.25.
//

import SwiftUI
import PhotosUI

struct CameraCaptureView: View {
    
    @State private var selectedItem: PhotosPickerItem? = nil
    @State private var selectedImageData: Data? = nil
    @State private var navigateToPreview = false
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color.purple.opacity(0.8), Color.blue.opacity(0.8)]),
                           startPoint: .top,
                           endPoint: .bottom)
            .ignoresSafeArea()
            
            VStack(spacing: 30) {
                Spacer()
                
                Text("Snap a Photo!")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundStyle(.white)
                    .shadow(radius: 5)
                
                Text("Select a photo or take a new one to identify the animal.")
                    .font(.title3)
                    .foregroundStyle(.white.opacity(0.8))
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                
                Spacer()
                
                // Photos Picker
                PhotosPicker(selection: $selectedItem,
                             matching: .images,
                             photoLibrary: .shared()) {
                    VStack {
                        Image(systemName: "camera.viewfinder")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 80, height: 80)
                            .padding()
                        
                        Text("Open Camera or Gallery")
                            .font(.title3)
                            .fontWeight(.semibold)
                    }
                    .foregroundColor(.white)
                    .frame(width: 250, height: 250)
                    .background(Color.white.opacity(0.2))
                    .background(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(Color.white.opacity(0.7), lineWidth: 2)
                    )
                    .cornerRadius(20)
                    .shadow(color: .black.opacity(0.3), radius: 5)
                }
                .onChange(of: selectedItem) { newItem in
                    Task {
                        if let data = try? await newItem?.loadTransferable(type: Data.self) {
                            selectedImageData = data
                            navigateToPreview = true
                        }
                    }
                }
                
                Spacer()
            }
            .padding()
            
            // Navigation to Preview if image is selected
            NavigationLink(destination: PhotoPreviewView(imageData: selectedImageData ?? Data()), isActive: $navigateToPreview) {
                EmptyView()
            }
            .hidden()
        }
    }
}

#Preview {
    CameraCaptureView()
}
