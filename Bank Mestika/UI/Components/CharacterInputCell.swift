//
//  CharacterInputCell.swift
//  Bank Mestika
//
//  Created by Prima Jatnika on 01/10/20.
//

import SwiftUI

struct CharacterInputCell: View {
    @State private var textValue: String = ""
    @Binding var currentlySelectedCell: Int

    var index: Int

    var responder: Bool {
        return index == currentlySelectedCell
    }

    var body: some View {
        OTPTextField(text: $textValue, currentlySelectedCell: $currentlySelectedCell, isFirstResponder: responder)
            .frame(width: 40, height: 40)
            .font(.title2)
            .foregroundColor(Color(hex: "#232175"))
            .multilineTextAlignment(.center)
            .background(Color.gray.opacity(0.1))
            .cornerRadius(8)
    }
}
