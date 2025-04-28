//
//  SplashScreenView.swift
//  WhoAmI
//
//  Created by Goran Saric on 28.04.25.
//

import SwiftUI

struct SplashScreenView: View {
    
    @State private var animateBackground = false
    @State private var animateLogo = false
    @State private var animateText = false
    @State private var showButton = false
    @State private var textOpacity = 0.0
    
    var body: some View {
        NavigationStack {
            ZStack {
                // Background
                LinearGradient(colors: [Color.blue, Color.purple],
                               startPoint: .topLeading,
                               endPoint: .bottomTrailing)
                    .ignoresSafeArea()
                    .opacity(animateBackground ? 1 : 0)
                    .onAppear {
                        withAnimation(.easeIn(duration: 1)) {
                            animateBackground = true
                        }
                    }
                
                VStack(spacing: 30) {
                    Spacer()
                    
                    // Logo
                    Image(systemName: "pawprint.circle.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 250, height: 250)
                        .foregroundStyle(.white)
                        .scaleEffect(animateLogo ? 1 : 0.5)
                        .opacity(animateLogo ? 1 : 0)
                        .shadow(color: .black.opacity(0.4), radius: 10)
                        .onAppear {
                            withAnimation(.interpolatingSpring(stiffness: 70, damping: 8).delay(0.5)) {
                                animateLogo = true
                            }
                        }
                    
                    // App name
                    Text("Who am I?")
                        .font(.system(size: 45, weight: .bold, design: .rounded))
                        .foregroundStyle(.white)
                        .opacity(animateText ? 1 : 0)
                        .offset(y: animateText ? 0 : 20)
                        .onAppear {
                            withAnimation(.easeOut(duration: 1).delay(1)) {
                                animateText = true
                            }
                        }
                    
                    // Added Text: "Snap • Identify • Adopt"
                    Text("Snap & Identify")
                        .font(.title3)
                        .fontWeight(.semibold)
                        .foregroundStyle(.white.opacity(0.8))
                        .opacity(textOpacity)
                        .onAppear {
                            withAnimation(.easeIn(duration: 1).delay(1.5)) {
                                textOpacity = 1.0
                            }
                        }
                    
                    Spacer()
                }
                .padding()
                
                // Button overlayed at bottom
                VStack {
                    Spacer()
                    
                    if showButton {
                        NavigationLink(destination: OnboardingScreenView()) {
                            Text("CONTINUE".uppercased())
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
                        .padding(.bottom, 50)
                        .transition(.move(edge: .bottom))
                        .animation(.interpolatingSpring(stiffness: 100, damping: 10), value: showButton)
                    }
                }
            }
            .onAppear {
                // Show the button after delay
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                    withAnimation {
                        showButton = true
                    }
                }
            }
        }
    }
}

#Preview {
    SplashScreenView()
}
