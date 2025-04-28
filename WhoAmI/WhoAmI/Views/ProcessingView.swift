//
//  ProcessingView.swift
//  WhoAmI
//
//  Created by Goran Saric on 28.04.25.
//

import SwiftUI

struct ProcessingView: View {
    @State private var isAnimating = false
    
    var body: some View {
        ZStack {
            // Gradient background
            LinearGradient(gradient: Gradient(colors: [Color.purple, Color.blue]),
                           startPoint: .topLeading,
                           endPoint: .bottomTrailing)
                .ignoresSafeArea()
            
            VStack(spacing: 40) {
                Spacer()
                
                // Animated loading indicator
                Circle()
                    .trim(from: 0, to: 0.7)
                    .stroke(Color.white.opacity(0.8),
                            style: StrokeStyle(lineWidth: 10, lineCap: .round))
                    .frame(width: 100, height: 100)
                    .rotationEffect(.degrees(isAnimating ? 360 : 0))
                    .animation(.linear(duration: 1).repeatForever(autoreverses: false), value: isAnimating)
                    .onAppear {
                        isAnimating = true
                    }
                
                // Processing text
                Text("Processing your photo...")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                
                Spacer()
                
                // Info text
                Text("This may take a few seconds")
                    .font(.body)
                    .foregroundColor(.white.opacity(0.7))
                    .padding(.bottom, 50)
            }
            .padding()
        }
    }
}

#Preview {
    ProcessingView()
}
