//
//  RadioButtonGroup.swift
//  Bank Mestika
//
//  Created by Abdul R. Arraisi on 01/10/20.
//

import SwiftUI

struct RadioButton: View {

    let id: String
    let label: String
    let callback: (String)->()
    let selectedID : String
    let size: CGFloat
    let color: Color
    let textSize: CGFloat

    init(
        _ id: String,
        label: String,
        callback: @escaping (String)->(),
        selectedID: String,
        size: CGFloat = 20,
        color: Color = Color.secondary,
        textSize: CGFloat = 14
        ) {
        self.id = id
        self.label = label
        self.size = size
        self.color = color
        self.textSize = textSize
        self.selectedID = selectedID
        self.callback = callback
    }

    var body: some View {
        
        Button(action:{
            
            self.callback(self.id)
            
        }) {
            
            HStack(alignment: .center, spacing: 10) {
                
                Image(systemName: self.selectedID == self.id ? "largecircle.fill.circle" : "circle")
//                    .renderingMode(.original)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: self.size, height: self.size)
                
                Text(label)
                    .font(Font.system(size: textSize))
                
                Spacer()
                
            }.foregroundColor(self.color)
            .padding(.bottom, 10)
        }
        .foregroundColor(self.color)
    }
}


// MARK: - Radio Button Group
struct RadioButtonGroup: View {

    let items : [String]
    
    let labels : [String]

    @Binding var selectedId: String?

    let callback: (String) -> ()

    var body: some View {
        VStack {
            ForEach(0..<items.count) { index in
                RadioButton(self.items[index], label: self.labels[index], callback: self.radioGroupCallback, selectedID: self.selectedId ?? "0")
            }
        }
    }

    func radioGroupCallback(id: String) {
        selectedId = id
        callback(id)
    }
}

struct RadioButtonGroup_Previews: PreviewProvider {
    static var previews: some View {
        RadioButtonGroup(items: ["1", "2", "3", "4", "5"], labels: ["Rome", "London", "Paris", "Berlin", "New York"], selectedId: Binding.constant("1")) { selected in
            print("Selected is: \(selected)")
        }
    }
}
