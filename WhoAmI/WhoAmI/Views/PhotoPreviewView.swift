//
//  PhotoPreviewView.swift
//  WhoAmI
//
//  Created by Goran Saric on 28.04.25.
//

import SwiftUI

struct PhotoPreviewView: View {
    
    var imageData: Data
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            
            if let uiImage = UIImage(data: imageData) {
                VStack {
                    Spacer()
                    
                    Image(uiImage: uiImage)
                        .resizable()
                        .scaledToFit()
                        .cornerRadius(20)
                        .padding()
                        .shadow(radius: 10)
                    
                    Spacer()
                    
                    HStack(spacing: 30) {
                        Button(action: {
                            // Action for Retake (pop back)
                        }) {
                            Text("Retake")
                                .font(.title2)
                                .fontWeight(.bold)
                                .padding()
                                .frame(width: 140)
                                .background(Color.red.opacity(0.8))
                                .foregroundColor(.white)
                                .cornerRadius(15)
                        }
                        
                        Button(action: {
                            // Action for Confirm (go to detection view)
                        }) {
                            Text("Use Photo")
                                .font(.title2)
                                .fontWeight(.bold)
                                .padding()
                                .frame(width: 140)
                                .background(Color.green.opacity(0.8))
                                .foregroundColor(.white)
                                .cornerRadius(15)
                        }
                    }
                    .padding(.bottom, 40)
                }
            } else {
                Text("No photo selected")
                    .foregroundColor(.white)
            }
        }
    }
}

#Preview {
    PhotoPreviewView(imageData: Data())
}
