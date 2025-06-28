//
//  ContentView.swift
//  Incubyte_assignment
//
//  Created by Prajjwal on 28/06/25.
//

import SwiftUI

struct ContentView: View {
    @State private var input = ""
    @State private var output = ""
    @State private var showAlert = false
    @State private var errorMessage = ""

    let calculator = StringCalculator()

    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                Text("String Calculator")
                    .font(.title)

                TextField("Enter input string", text: $input)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()

                Button("Calculate") {
                    do {
                        let result = try calculator.add(input)
                        output = "Result: \(result)"
                        showAlert = false
                    } catch {
                        errorMessage = error.localizedDescription
                        showAlert = true
                    }
                }
                .buttonStyle(.borderedProminent)

                if !output.isEmpty {
                    Text(output)
                        .font(.headline)
                        .padding(.top)
                }

                Spacer()
            }
            .padding()
            .navigationTitle("TDD Kata")
            .alert("Error", isPresented: $showAlert) {
                Button("OK", role: .cancel) {}
            } message: {
                Text(errorMessage)
            }
        }
    }
}


#Preview {
    ContentView()
}
