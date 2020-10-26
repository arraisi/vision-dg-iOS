//
//  ForgotPasswordNoRekeningOrKTP.swift
//  Bank Mestika
//
//  Created by Abdul R. Arraisi on 26/10/20.
//

import SwiftUI

struct ForgotPasswordNoRekeningOrKTPView: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @State var noRekeningOrKTP: String = ""
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
                    Text("INPUT NO REKENING/KTP")
                        .font(.custom("Montserrat-Bold", size: 24))
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .padding(.vertical, 15)
                        .padding(.horizontal, 15)
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
            Text("Masukkan nomor rekening / KTP \ndan PIN ATM Anda.")
                .font(.custom("Montserrat-Regular", size: 12))
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
                .padding(.top, 5)
                .padding(.bottom, 20)
                .padding(.horizontal, 20)
            
            TextField("Masukan nomor Rekening/KTP Anda", text: $noRekeningOrKTP, onEditingChanged: { changed in
                print("\($noRekeningOrKTP)")
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
                label: {
                    Text("KONFIRMASI DATA")
                        .font(.custom("Montserrat-Bold", size: 14))
                        .foregroundColor(Color(hex: "#2334D0"))
                        .frame(maxWidth: .infinity, minHeight: 50, maxHeight: 50)
                })
                .background(Color.white)
                .cornerRadius(12)
                .padding(.top, 30)
        }
    }
}

struct ForgotPasswordNoRekeningOrKTP_Previews: PreviewProvider {
    static var previews: some View {
        ForgotPasswordNoRekeningOrKTPView()
    }
}
