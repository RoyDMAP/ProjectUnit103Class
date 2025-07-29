//
//  ContentView.swift
//  ProjectUnit104
//
//  Created by Roy Dimapilis on 7/28/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        FitnessAchievementView()
    }
}

struct FitnessAchievementView: View {
    var body: some View {
        ZStack {
            Color.purple.opacity(0.15)
                .ignoresSafeArea()
            
            VStack(spacing: 40) {
                // Header
                VStack(spacing: 16) {
                    HStack(spacing: 12) {
                        Image(systemName: "trophy.fill")
                            .font(.system(size: 40))
                            .foregroundColor(.purple)
                        
                        Text("Goal Achieved!")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(.purple)
                    }
                    .padding(.top, 60)
                    
                    Text("You reached your daily step goal")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .foregroundColor(.purple)
                }
                .padding(.top, 40)
                
                // Progress Card
                VStack(spacing: 20) {
                    ZStack {
                        VStack(spacing: 8) {
                            Text("10,000")
                                .font(.system(size: 48, weight: .bold))
                                .foregroundColor(.purple)
                            
                            HStack(spacing: 4) {
                                Image(systemName: "figure.walk.motion")
                                    .font(.caption)
                                    .foregroundColor(.purple)
                                
                                Text("STEPS COMPLETED")
                                    .font(.caption)
                                    .fontWeight(.semibold)
                                    .foregroundColor(.secondary)
                            }
                        }
                    }
                    
                    // Stats with icons
                    VStack(spacing: 25) {
                        VStack {
                            Image(systemName: "flame.fill")
                                .font(.title)
                                .foregroundColor(.purple)
                            
                            Text("420")
                                .font(.title2)
                                .fontWeight(.bold)
                            
                            Text("Calories")
                                .font(.caption)
                                .foregroundColor(.secondary)
                        }
                        
                        VStack {
                            Image(systemName: "clock.fill")
                                .font(.title)
                                .foregroundColor(.purple)
                            
                            Text("45")
                                .font(.title2)
                                .fontWeight(.bold)
                            
                            Text("Minutes")
                                .font(.caption)
                                .foregroundColor(.secondary)
                        }
                        
                        VStack {
                            Image(systemName: "figure.run")
                                .font(.title)
                                .foregroundColor(.purple)
                            
                            Text("6.2")
                                .font(.title2)
                                .fontWeight(.bold)
                            
                            Text("Miles")
                                .font(.caption)
                                .foregroundColor(.secondary)
                        }
                    }
                }
                .padding(30)
                .background(
                    RoundedRectangle(cornerRadius: 16)
                        .fill(Color(.systemBackground))
                        
                )
                .padding(.horizontal, 20)
                
                // Buttons
                VStack(spacing: 12) {
                    Button(action: {
                        // Share Achievement
                        print("")
                    }) {
                        Text("Share Achievement")
                            .font(.headline)
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 16)
                            .background(Color.purple)
                            .cornerRadius(12)
                    }
                    
                    Button(action: {
                        // Continue action
                        print("Continue tapped")
                    }) {
                        Text("Continue")
                            .font(.subheadline)
                            .fontWeight(.medium)
                            .foregroundColor(.purple)
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 16)
                            .background(
                                RoundedRectangle(cornerRadius: 12)
                                    .stroke(Color.purple, lineWidth: 2)
                                    .background(Color.clear)
                            )
                    }
                }
                .padding(.horizontal, 30)
                
                Spacer()
                    .frame(height: 70)
            }
        }
    }
}

#Preview {
    FitnessAchievementView()
}
