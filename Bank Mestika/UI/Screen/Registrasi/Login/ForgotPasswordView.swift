//
//  ForgotPasswordView.swift
//  Bank Mestika
//
//  Created by Abdul R. Arraisi on 22/10/20.
//

import SwiftUI

struct ForgotPasswordView: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @State var phoneNumber: String = ""
    @Binding var rootIsActive : Bool
    
    var body: some View {
        ZStack(alignment: .top) {
            Image("bg_splash")
                .resizable()
            
            VStack {
                AppBar
                    .padding(.top, 45)
                    .padding(.horizontal, 30)
                
                VStack {
                    Text("VERIFIKASI NO. HP ANDA")
                        .font(.custom("Montserrat-Bold", size: 24))
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .padding(.top, 20)
                        .padding(.bottom, 5)
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
        VStack(alignment: .center) {
            Text("Silahkan Masukkan Nomor Handphone Anda")
                .font(.custom("Montserrat-Regular", size: 12))
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
                .padding(.top, 5)
                .padding(.bottom, 20)
                .padding(.horizontal, 20)
            
            HStack {
                HStack {
                    Image("indo_flag")
                    Text("+62 ")
                        .font(.system(size: 12))
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                }
                
                Divider()
                    .frame(height: 20)
                
                TextField("Phone Number", text: $phoneNumber, onEditingChanged: { changed in
                    print("\($phoneNumber)")
                    
//                    self.loginData.noTelepon = "0" + phoneNumber
                })
                .font(.custom("Montserrat-Regular", size: 12))
                .keyboardType(.numberPad)
            }
            .frame(height: 20)
            .font(.subheadline)
            .padding()
            .background(Color.white)
            .cornerRadius(15)
            .padding(.horizontal, 20)
            
            Text("Pastikan nomor handphone Anda telah sesuai sebelum melanjutkan ketahap berikutnya")
                .font(.custom("Montserrat-Regular", size: 12))
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
                .padding(.top, 20)
                .padding(.bottom, 10)
                .padding(.horizontal, 20)
            
            NavigationLink(
                destination: ForgotPasswordOTPView(rootIsActive: self.$rootIsActive),
                isActive: self.$rootIsActive,
                label: {
                    Text("Masukkan No. HP Anda")
                        .font(.custom("Montserrat-SemiBold", size: 14))
                        .foregroundColor(Color(hex: "#2334D0"))
                        .frame(maxWidth: .infinity, minHeight: 50, maxHeight: 50)
                })
            .background(Color.white)
            .cornerRadius(12)
            .padding(.horizontal, 20)
            .padding(.top, 30)
            .padding(.bottom, 20)
        }
        .frame(width: UIScreen.main.bounds.width - 30)
    }
}

struct ForgotPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        ForgotPasswordView(rootIsActive: Binding.constant(false))
    }
}
