//
//  ContentView.swift
//  LinearR
//
//  Created by Besar Ismaili on 11/03/2025.
//

import SwiftUI
import CoreML

struct ContentView: View {
    @State private var inputValue: Double = 0.0
    @State private var predictedValue: Double?

    let model = LinearRegressionModel()

    var body: some View {
        VStack(spacing: 20) {
            TextField("Enter input", value: $inputValue, format: .number)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            Button("Predict") {
                updatePrediction()
            }

            if let result = predictedValue {
                Text("Prediction: \(result, specifier: "%.2f")")
            }
        }
        .padding()
    }

    func predict(input: Double) -> Double? {
        let inputObj = LinearRegressionModelInput(input: input)
        guard let prediction = try? model.prediction(input: inputObj) else {
            return nil
        }
        return prediction.prediction
    }

    func updatePrediction() {
        predictedValue = predict(input: inputValue)
    }
}

#Preview {
    ContentView()
}
