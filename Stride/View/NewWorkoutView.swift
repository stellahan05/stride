//
//  NewWorkoutView.swift
//  Stride
//
//  Created by Jonathan Cai on 2025-01-14.
//

import SwiftUI

struct NewWorkoutView: View {
    @State private var selectedBPM: Double = 100
    @State private var selectedGenre: String? = nil
    @State private var workoutDurationText: String = ""
    @State private var workoutDuration: Int? = nil
    @State private var isEditing = false
    
    var body: some View {

        
        ZStack {
            AppColour.main.ignoresSafeArea()
            
            ScrollView {
                VStack(alignment: .leading, spacing: 24) {
                    // HEADER
                    VStack(alignment: .leading, spacing: 8) {
                        HStack(spacing: 16) {
                            ZStack {
                                Circle()
                                    .fill(AppColour.headerText)
                                    .frame(width: 50, height: 50)
                                Text("JG")
                                    .font(.headline)
                                    .fontWeight(.bold)
                                    .foregroundColor(AppColour.main)
                            }
                            
                            VStack(alignment: .leading, spacing: 4) {
                                Text("Good Morning!")
                                    .font(.headline)
                                    .fontWeight(.bold)
                                Text("Hello, John Grey")
                                    .font(.subheadline)
                            }
                        }
                        Divider()
                            .background(AppColour.headerText)
                    }
                    .padding(.horizontal)
                    .foregroundColor(AppColour.headerText)
                    
                    // BPM SELECTION
                    VStack(alignment: .leading, spacing: 8) {
                        Text("How are you feeling today?")
                            .font(.system(size: 23, weight: .bold))
                            .foregroundColor(AppColour.headerText)
                    }
                    .padding(.horizontal)
                    
                    // Buttons
                    HStack(spacing: 16) {
                        ForEach([80, 120, 145], id: \.self) { bpm in
                            Button(action: { selectedBPM = bpm }) {
                                VStack(spacing: 8) {
                                    
                                    
                                    Text(bpm == 80 ? "Taking it easy" : bpm == 120 ? "The usual" : "Pushing the limits")
                                        .font(.system(size: 16, weight: .bold))
                                        .multilineTextAlignment(.center)
                                        .minimumScaleFactor(0.8) // Shrink text if needed
                                        .lineLimit(2) // Limit to 2 lines
                                        .frame(maxHeight: .infinity)
                                    
                                    
                                    Text("\(Int(bpm)) BPM")
                                        .font(.system(size: 14, weight: .semibold))
                                    
                                }
                                .multilineTextAlignment(.center)
                                .padding()
                                .frame(width: 110, height: 100)
                                .background(selectedBPM == Double(bpm) ? AppColour.buttonSelected : AppColour.buttonBackground)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                            }
                        }
                    }
                    .padding(.horizontal)
                    
                    // SLIDER
                    VStack(spacing: 16) {
                        Text("Or... set your custom pace!")
                            .font(.system(size: 18, weight: .bold))
                            .foregroundColor(AppColour.headerText)
                        
                        HStack {
                            // Turtle Icon or Emoji for Minimum
                            //                        Text("🐢")
                            //                            .font(.title)
                            //                            .foregroundColor(AppColour.headerText)
                            
                            Slider(
                                value: $selectedBPM,
                                in: 45...200,
                                step: 1
                            ) {
                                Text("Speed")
                            } minimumValueLabel: {
                                Text("45")
                                    .foregroundColor(AppColour.headerText)
                            } maximumValueLabel: {
                                Text("200")
                                    .foregroundColor(AppColour.headerText)
                            } onEditingChanged: { editing in
                                isEditing = editing
                            }
                            .accentColor(AppColour.headerText)
                            
                            // Rabbit Icon or Emoji for Maximum
                            //                        Text("🐇")
                            //                            .font(.title)
                            //                            .foregroundColor(AppColour.headerText)
                        }
                        .padding(.horizontal)
                        .frame(maxWidth: .infinity)
                        
                        // Display BPM Value
                        Text("\(Int(selectedBPM)) BPM")
                            .font(.system(size: 16, weight: .semibold))
                            .foregroundColor(AppColour.headerText)
                    }
                    .padding(.bottom, 1)
                    
                    // Genre Selection
                    VStack(alignment: .leading, spacing: 16) {
                        Text("Choose your genre")
                            .font(.system(size: 20, weight: .bold))
                            .foregroundColor(AppColour.headerText)
                            .padding(.horizontal)
                        
                        GeometryReader { geometry in
                            HStack(spacing: 16) {
                                let buttonWidth = (geometry.size.width - 32) / 3
                                
                                // R&B Button
                                Button(action: { selectedGenre = "R&B" }) {
                                    VStack(spacing: 4) {
                                        Image("rnb_image")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: buttonWidth - 16, height: buttonWidth - 24)
                                            .cornerRadius(8)
                                        Text("R&B")
                                            .font(.caption)
                                            .fontWeight(.bold)
                                            .foregroundColor(.white)
                                    }
                                    .padding(6)
                                    .frame(width: buttonWidth, height: buttonWidth)
                                    .background(selectedGenre == "R&B" ? AppColour.buttonSelected : AppColour.buttonBackground)
                                    .cornerRadius(10)
                                }
                                
                                // Hip-Hop Button
                                Button(action: { selectedGenre = "Hip-Hop" }) {
                                    VStack(spacing: 4) {
                                        Image("hiphop_image")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: buttonWidth - 16, height: buttonWidth - 24)
                                            .cornerRadius(8)
                                        Text("Hip-Hop")
                                            .font(.caption)
                                            .fontWeight(.bold)
                                            .foregroundColor(.white)
                                    }
                                    .padding(6)
                                    .frame(width: buttonWidth, height: buttonWidth)
                                    .background(selectedGenre == "Hip-Hop" ? AppColour.buttonSelected : AppColour.buttonBackground)
                                    .cornerRadius(10)
                                }
                                
                                // More Button
                                Button(action: { selectedGenre = "More" }) {
                                    VStack(spacing: 4) {
                                        Image("more_image")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: buttonWidth - 16, height: buttonWidth - 24)
                                            .cornerRadius(8)
                                        Text("More...")
                                            .font(.caption)
                                            .fontWeight(.bold)
                                            .foregroundColor(.white)
                                    }
                                    .padding(6)
                                    .frame(width: buttonWidth, height: buttonWidth)
                                    .background(selectedGenre == "More" ? AppColour.buttonSelected : AppColour.buttonBackground)
                                    .cornerRadius(10)
                                }
                            }
                        }
                        .frame(height: 120)
                        .padding(.horizontal)
                        
                        // Workout Duration
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Ready to move? Enter your desired workout duration to get started!")
                                .font(.headline)
                            TextField("Enter a duration between 10 to 180 minutes", text: $workoutDurationText)
                                .keyboardType(.numberPad)
                                .foregroundColor(.black)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .onChange(of: workoutDurationText) { newValue in
                                    let filtered = newValue.filter {$0.isNumber}
                                    if filtered != newValue {
                                        workoutDurationText = filtered
                                    }
                                    
                                    if let intValue = Int(filtered), intValue >= 10, intValue <= 180 {
                                        workoutDuration = intValue
                                    } else {
                                        workoutDuration = nil // Reset if invalid
                                    }
                                }
                        }
                        .padding()
                        .foregroundColor(AppColour.headerText)
                        
                        if let duration = workoutDuration {
                            Text("Workout Duration: \(duration) minutes")
                                .font(.footnote)
                                .foregroundColor(AppColour.headerText)
                                .padding(8)
                        } else if !workoutDurationText.isEmpty {
                            Text("Please enter a valid duration between 10 and 180 minutes.")
                                .font(.footnote)
                                .foregroundColor(.red)
                                .padding(8)
                        }
                    }
                    .padding()
                    .foregroundColor(AppColour.headerText)
                }
                NavigationLink(destination: CurrentWorkoutView()) {
                    Text("BEGIN WORKOUT")
                        .font(.headline)
                        .foregroundColor(.black)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(AppColour.lightButtonBackground)
                        .cornerRadius(15)
                        .padding(.horizontal)
                }
                .padding(.bottom) // Adds spacing from the screen bottom
            }
        }
    }
}

#Preview {
    NavigationView {
        NewWorkoutView()
    }
}
