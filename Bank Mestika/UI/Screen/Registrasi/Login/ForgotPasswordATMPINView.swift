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
                    Text("INPUT DATA ATM")
                        .font(.custom("Montserrat-Bold", size: 24))
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
            Button(action: {
                presentationMode.wrappedValue.dismiss()
            }) {
                Image(systemName: "arrow.left")
                    .foregroundColor(.white)
            }
            Spacer()
            logo
            Spacer()
            Button(action: {
                self.rootIsActive = false
            }) {
                Text("Cancel")
                    .foregroundColor(.white)
            }
        }
    }
    
    var logo: some View {
        HStack(alignment: .center, spacing: .none) {
            Image("Logo M")
                .resizable()
                .frame(width: 30, height: 30)
            Text("BANK MESTIKA")
                .foregroundColor(.white)
                .font(.system(size: 24))
                .bold()
        }
    }
    
    var Forms: some View {
        VStack(alignment: .center, spacing: 20) {
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
                destination: ForgotPasswordResetPasswordView(rootIsActive: $rootIsActive),
                isActive: self.$rootIsActive,
                label: {
                    Text("AKTIVASI KARTU ATM BARU")
                        .font(.custom("Montserrat-Bold", size: 14))
                        .foregroundColor(Color(hex: "#2334D0"))
                        .frame(maxWidth: .infinity, minHeight: 50, maxHeight: 50)
                })
                .background(Color.white)
                .cornerRadius(12)
                .padding(.top, 30)
            
            Button(action: {
                
            }, label: {
                Text("KONFIRMASI DATA")
                    .font(.custom("Montserrat-Bold", size: 14))
                    .foregroundColor(Color(hex: "#2334D0"))
                    .frame(maxWidth: .infinity, minHeight: 50, maxHeight: 50)
            })
            .background(Color.white)
            .cornerRadius(12)
        }
    }
}

struct ForgotPasswordATMPIN_Previews: PreviewProvider {
    static var previews: some View {
        ForgotPasswordATMPINView(rootIsActive: Binding.constant(false))
    }
}
