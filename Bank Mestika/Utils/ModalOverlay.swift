//
//  ModalOverlay.swift
//  Bank Mestika
//
//  Created by Prima Jatnika on 01/10/20.
//

import SwiftUI

struct ModalOverlay: View {
    var color = Color.black.opacity(0.4)
    var tapAction: (() -> Void)? = nil
    
    var body: some View {
        color.onTapGesture { self.tapAction?() }
    }
}
