//
//  OnboardingScreenView.swift
//  WhoAmI
//
//  Created by Goran Saric on 28.04.25.
//

import SwiftUI

struct OnboardingScreenView: View {
    
    @State private var textOpacity = 0.0
    @State private var imageOpacity = 0.0
    @State private var showButton = false
    @State private var logoScale: CGFloat = 0.5
    @State private var welcomeTextOffset: CGFloat = -30
    
    var body: some View {
        NavigationStack {
            ZStack {
                // Dynamic Gradient Background
                LinearGradient(gradient: Gradient(colors: [Color.blue, Color.purple]), startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea()
                
                VStack {
                    Spacer()
                    
                    // Stylish and Animated App Intro Text
                    Text("FIND OUT WHICH BREED IN NO TIME")
                        .font(.system(size: 40, weight: .bold, design: .rounded))
                        .multilineTextAlignment(.center)
                        .foregroundStyle(LinearGradient(gradient: Gradient(colors: [Color.white, Color.white]), startPoint: .topLeading, endPoint: .bottomTrailing))
                        .shadow(color: .black.opacity(0.6), radius: 10, x: 0, y: 5)
                        .opacity(textOpacity)
                        .offset(y: welcomeTextOffset)
                        
                    Spacer()
                    // Logo Image with Scaling Animation
                    Image("mobilescan") // Replace with your logo image
                        .resizable()
                        .scaledToFit()
                        .cornerRadius(20)
                        .frame(width: 300, height: 300)
                        .scaleEffect(logoScale)
                        .opacity(imageOpacity)
                        .onAppear {
                            withAnimation(.easeOut(duration: 1).delay(0.5)) {
                                imageOpacity = 1.0
                                logoScale = 1.0
                            }
                        }
                        
                    
                    // Step-by-step Introduction Text
                    Text("""
                        Snap a photo of a dog,
                        identify its breed and details,
                        and help them find a home!
                        """)
                        .font(.title3)
                        .multilineTextAlignment(.center)
                        .foregroundStyle(.white)
                        .padding()
                        .opacity(textOpacity)
                        .scaleEffect(1.1)
                        .onAppear {
                            withAnimation(.easeIn(duration: 1).delay(1.0)) {
                                textOpacity = 1.0
                            }
                        }
                    
                    Spacer()
                    
                    // Get Started Button (Appears after everything else)
                    NavigationLink(destination: MainScreenView()) {
                        Text("Get Started")
                            .font(.title3)
                            .fontWeight(.bold)
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
                            .opacity(showButton ? 1.0 : 0.0)
                            .onAppear {
                                withAnimation(.easeIn(duration: 1).delay(1.5)) {
                                    showButton = true
                                }
                            }
                    }
                    .scaleEffect(showButton ? 1.0 : 0.8)
                    .opacity(showButton ? 1.0 : 0.0)
                    .animation(.easeOut(duration: 1).delay(1.5), value: showButton)
                    
                    Spacer()
                }
            }
        }
    }
}




#Preview {
    OnboardingScreenView()
}


