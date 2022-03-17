//
//  ContentView.swift
//  TemperatureApp
//
//  Created by parol-12345 on 3/10/22.
//

import SwiftUI

struct ContentView: View {
    
    @State private var InputValue = ""
    @State private var OutputValue = ""
    
    @State private var InputUnitValue = 0
    let InputUnits = ["Meters","Kilometers","Miles","Feet"]
    
    @State private var OutputUnitValue = 0
    let OutputUnits = ["Meters","Kilometers","Miles","Feet"]
    
    
    var result: String {
        
        var output = ""
        var input = Measurement(value: 0, unit: UnitLength.meters)
        
        switch InputUnits[InputUnitValue] {
        case "Meters":
            input = Measurement(value: Double(InputValue) ?? 0, unit: UnitLength.meters)
        case "Kilometers":
            input = Measurement(value: Double(InputValue) ?? 0, unit: UnitLength.kilometers)
        case "Miles":
            input = Measurement(value: Double(InputValue) ?? 0, unit: UnitLength.miles)
        case "Feet":
            input = Measurement(value: Double(InputValue) ?? 0, unit: UnitLength.feet)
        default:
            input = Measurement(value: Double(InputValue) ?? 0, unit: UnitLength.meters)
        }
        
        switch OutputUnits[OutputUnitValue] {
        case "Meters":
            output = String(describing: input.converted(to: UnitLength.meters))
        case "Kilometers":
            output = String(describing: input.converted(to: UnitLength.kilometers))
        case "Miles":
            output = String(describing: input.converted(to: UnitLength.miles))
        case "Feet":
            output = String(describing: input.converted(to: UnitLength.feet))
        default:
            output = String(describing: input.converted(to: UnitLength.meters))
        }
        
        return output
    }
    
    var body: some View {
        
        NavigationView{
            Form{
                
                Section{
                    TextField("Enter a number", text:$InputValue)
                }
                
                Section(header:Text("Choose your main unit")){
                    Picker("Input", selection:$InputUnitValue){
                        ForEach(0..<InputUnits.count){
                            Text("\(InputUnits[$0])")
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                }
                
                Section(header: Text("What unit u wanna convert?")){
                    Picker("Input", selection:$OutputUnitValue){
                        ForEach(0..<OutputUnits.count){
                            Text("\(OutputUnits[$0])")
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                }
                
                Section{
                    Text(result)
                }
            }
            .navigationTitle("Length conversion")
        }
        
        
        
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
