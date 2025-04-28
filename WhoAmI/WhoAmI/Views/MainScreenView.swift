//
//  MainScreenView.swift
//  WhoAmI
//
//  Created by Goran Saric on 28.04.25.
//

import SwiftUI

struct MainScreenView: View {
    
    @State private var showCameraView = false

    var body: some View {
        NavigationView {
            ZStack {
                // Gradient Background
                LinearGradient(gradient: Gradient(colors: [Color.purple, Color.blue]), startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea()

                VStack {
                    Spacer()

                    // App Title
                    Text("Who Am I?")
                        .font(.system(size: 50, weight: .bold, design: .rounded))
                        .foregroundColor(.white)
                        .shadow(color: .black.opacity(0.5), radius: 5, x: 0, y: 5)

                    Text("Snap a picture of an animal to identify its breed and species!")
                        .font(.title2)
                        .multilineTextAlignment(.center)
                        .foregroundColor(.white)
                        .padding(.top, 10)
                        .opacity(0.8)

                    Spacer()

                    // Animal Image (Placeholder)
                    Image(systemName: "camera.viewfinder")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 150, height: 150)
                        .foregroundColor(.white)
                        .shadow(color: .black.opacity(0.4), radius: 10, x: 0, y: 10)
                        .padding(.bottom, 30)
                    Spacer()
                    // Start Identifying Button
                    Button(action: {
                        showCameraView.toggle()
                    }) {
                        Text("Start Identifying")
                            .font(.title3)
                            .fontWeight(.bold)
                            .fontDesign(.rounded)
                            .foregroundColor(.white)
                            .padding()
                            .frame(width: 250, height: 50)
                            .background(Color.white.opacity(0.2))
                            .background(
                                RoundedRectangle(cornerRadius: 25)
                                    .stroke(Color.white.opacity(0.7), lineWidth: 2)
                            )
                            .cornerRadius(25)
                            .shadow(color: .black.opacity(0.3), radius: 5)
                    }
                    .padding(.bottom, 40)

                    Spacer()
                }
            }
            .sheet(isPresented: $showCameraView) {
                CameraCaptureView() // Placeholder for Camera View
            }
        }
    }
}

#Preview {
    MainScreenView()
    
}


