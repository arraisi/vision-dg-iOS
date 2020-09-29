//
//  LabelTextField.swift
//  Bank Mestika
//
//  Created by Abdul R. Arraisi on 29/09/20.
//

import SwiftUI

struct LabelTextField: View {
    
    @Binding var value: String
    var label: String
    var placeHolder: String
    
    var body: some View {
        
        VStack (alignment: .leading) {
            
            Text(label)
                .font(.caption)
                .fontWeight(.semibold)
                .foregroundColor(.gray)
                .multilineTextAlignment(.leading)
                .padding(.horizontal, 20)
            
            TextField(placeHolder, text: $value)
                .frame(height: 10)
                .font(.subheadline)
                .padding()
                .background(Color.gray.opacity(0.1))
                .cornerRadius(15)
                .padding(.horizontal, 20)
        }
       
    }
}

struct LabelTextField_Previews: PreviewProvider {
    static var previews: some View {
        LabelTextField(value: Binding.constant(""), label: "Demo", placeHolder: "Demo")
    }
}
