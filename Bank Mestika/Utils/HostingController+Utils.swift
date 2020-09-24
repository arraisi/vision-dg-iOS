//
//  HostingController+Utils.swift
//  Bank Mestika
//
//  Created by Prima Jatnika on 23/09/20.
//

import SwiftUI

class HostingController<RegisterView>: UIHostingController<RegisterView> where RegisterView : View {
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}
