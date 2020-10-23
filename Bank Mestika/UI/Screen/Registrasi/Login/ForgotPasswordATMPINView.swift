//
//  ForgotPasswordATMPIN.swift
//  Bank Mestika
//
//  Created by Abdul R. Arraisi on 22/10/20.
//

import SwiftUI

struct ForgotPasswordATMPINView: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @Binding var rootIsActive : Bool
    @State var atmNumber: String = ""
    @State var pin: String = ""
    
    var body: some View {
        ZStack(alignment: .top) {
            Image("bg_splash")
                .resizable()
            
            VStack {
                AppBar
                    .padding(.top, 45)
                    .padding(.horizontal, 30)
                
                VStack {
                    Text("LUPA PASSWORD")
                        .font(.custom("Montserrat-SemiBold", size: 24))
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .padding(.vertical, 20)
                        .padding(.horizontal, 20)
                        .fixedSize(horizontal: false, vertical: true)
                    
                    Forms
                    Spacer()
                }
                .padding(.horizontal, 30)
                .padding(.top, 35)
            }
        }
        .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
        .navigationBarHidden(true)
        .onTapGesture() {
            UIApplication.shared.endEditing()
        }
    }
    
    var AppBar: some View {
        HStack {
            Spacer()
            logo
            Spacer()
        }
    }
    
    var logo: some View {
        HStack(alignment: .center, spacing: .none) {
            Image("Logo M")
                .resizable()
                .frame(width: 30, height: 30)
            Text("BANK MESTIKA")
                .foregroundColor(.white)
                .font(.system(size: 30))
                .bold()
        }
    }
    
    var Forms: some View {
        VStack(alignment: .center) {
            Text("Masukkan nomor kartu ATM dan PIN ATM Anda yang sudah terdaftar")
                .font(.custom("Montserrat-Regular", size: 12))
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
                .padding(.top, 5)
                .padding(.bottom, 20)
                .padding(.horizontal, 20)
            
            TextField("Masukan nomor ATM Anda", text: $atmNumber, onEditingChanged: { changed in
                print("\($atmNumber)")
            })
            .frame(height: 30)
            .font(.custom("Montserrat-Regular", size: 14))
            .padding()
            .background(Color.white)
            .cornerRadius(20)
            
            TextField("Masukan PIN ATM Anda", text: $pin, onEditingChanged: { changed in
                print("\($pin)")
            })
            .frame(height: 30)
            .font(.custom("Montserrat-Regular", size: 14))
            .padding()
            .background(Color.white)
            .cornerRadius(20)
        
        NavigationLink(
            destination: ForgotPasswordResetPasswordView(),
            isActive: self.$rootIsActive,
            label: {
                Text("Masukkan Data Kartu ATM Anda")
                    .font(.custom("Montserrat-SemiBold", size: 14))
                    .foregroundColor(Color(hex: "#2334D0"))
                    .frame(maxWidth: .infinity, minHeight: 50, maxHeight: 50)
            })
            .background(Color.white)
            .cornerRadius(12)
            .padding(.top, 30)
            .padding(.bottom, 10)
        }
    }
}

struct ForgotPasswordATMPIN_Previews: PreviewProvider {
    static var previews: some View {
        ForgotPasswordATMPINView(rootIsActive: Binding.constant(false))
    }
}
