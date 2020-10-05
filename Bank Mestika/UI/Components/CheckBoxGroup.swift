//
//  CheckBoxGroup.swift
//  Bank Mestika
//
//  Created by Abdul R. Arraisi on 05/10/20.
//

import SwiftUI

struct CheckBoxField: View {
    
    let id: Int
    let markedId: [Int]
    let label: String
    let size: CGFloat
    let color: Color
    let textSize: CGFloat
    let callback: (Int, [Int])->()
    
    init(
        id: Int,
        markedId: [Int],
        label:String,
        size: CGFloat = 20,
        color: Color = Color.secondary,
        textSize: CGFloat = 14,
        callback: @escaping (Int, [Int])->()
    ) {
        self.id = id
        self.markedId = markedId
        self.label = label
        self.size = size
        self.color = color
        self.textSize = textSize
        self.callback = callback
    }
    
    var body: some View {
        
        Button(action:{
            
            self.callback(self.id, self.markedId)
            
        }) {
            HStack(alignment: .center, spacing: 10) {
                
                Image(systemName: self.markedId.contains(self.id) ? "checkmark.square" : "square")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: self.size, height: self.size)
                
                Text(label)
                    .font(Font.system(size: textSize))
                
                Spacer()
                
            }.foregroundColor(self.color)
        }
        .foregroundColor(Color.white)
    }
    
}

struct CheckBoxGroup: View {
    
    let id : [Int]
    @Binding var markedId: [Int]
    let labels : [String]
    let callback: (Int, [Int])->()
    
    var body: some View {
        HStack{
            
            VStack {
                
                ForEach(0..<id.count) { index in
                    CheckBoxField(id: id[index], markedId: self.markedId, label: labels[index], callback: self.checkboxSelected)
                }
                
            }
        }
        .padding()
    }
    
    func checkboxSelected(id: Int, marked: [Int]) {
        
        if markedId.contains(id) {
            
            markedId = markedId.filter {$0 != id}
            
        } else {
            
            self.markedId.append(id)
            
        }
        
        callback(id, markedId)
    }
}

struct CheckBoxGroup_Previews: PreviewProvider {
    static var previews: some View {
        CheckBoxGroup(id: [0, 1], markedId: Binding.constant([1]), labels: ["A", "B"]) { id, marked  in
            
        }
    }
}
