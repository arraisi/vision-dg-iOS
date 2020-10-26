//
//  ForgotPasswordResetPasswordView.swift
//  Bank Mestika
//
//  Created by Abdul R. Arraisi on 22/10/20.
//

import SwiftUI

struct ForgotPasswordResetPasswordView: View {
    @Binding var rootIsActive : Bool
    @State var password: String = ""
    @State var confirmationPassword: String = ""
    
    @State private var securedPassword: Bool = true
    @State private var securedConfirmation: Bool = true
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var body: some View {
        ZStack(alignment: .top) {
            Image("bg_splash")
                .resizable()
            
            VStack {
                appbar
                    .padding(.top, 45)
                    .padding(.horizontal, 30)
                
                VStack {
                    Text("PASSWORD BARU")
                        .font(.custom("Montserrat-ExtraBold", size: 24))
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .padding(.vertical, 20)
                        .padding(.horizontal, 20)
                        .fixedSize(horizontal: false, vertical: true)
                    
                    cardForm
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
    
    var appbar: some View {
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
                .frame(width: 25, height: 25)
            Text("BANK MESTIKA")
                .foregroundColor(.white)
                .font(.system(size: 20))
                .bold()
        }
    }
    
    var cardForm: some View {
        VStack(alignment: .center) {
            Text("Password Aplikasi harus berjumlah minimal 8 karakter huruf. Terdiri dari Uppercase, Number, etc.")
                .font(.custom("Montserrat-Regular", size: 12))
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
                .padding(.top, 5)
                .padding(.bottom, 20)
                .padding(.horizontal, 20)
            
            VStack(alignment: .leading) {
                if (securedPassword) {
                    ZStack {
                        HStack (spacing: 0) {
                            SecureField("Masukan Password", text: $password)
                                .font(.custom("Montserrat-Regular", size: 14))
                                .padding()
                                .frame(width: 200, height: 50)
                                .foregroundColor(Color(hex: "#232175"))
                                .keyboardType(.phonePad)
                            
                            Spacer()
                            
                            Button(action: {
                                self.securedPassword.toggle()
                            }) {
                                Text("show")
                                    .font(.custom("Montserrat-Regular", size: 12))
                                    .frame(width: 80, height: 50)
                                    .cornerRadius(10)
                                    .foregroundColor(Color(hex: "#3756DF"))
                            }
                        }.padding(.leading, 15)
                    }
                } else {
                    ZStack {
                        HStack (spacing: 0) {
                            TextField("Masukan Password", text: $password, onEditingChanged: { changed in
                                print("\($password)")
                            })
                            .font(.custom("Montserrat-Regular", size: 14))
                            .padding()
                            .frame(width: 200, height: 50)
                            .foregroundColor(Color(hex: "#232175"))
                            .keyboardType(.phonePad)
                            
                            Spacer()
                            
                            Button(action: {
                                self.securedPassword.toggle()
                            }) {
                                Text("show")
                                    .font(.custom("Montserrat-Regular", size: 12))
                                    .frame(width: 80, height: 50)
                                    .cornerRadius(10)
                                    .foregroundColor(Color(hex: "#3756DF"))
                            }
                        }
                    }.padding(.leading, 15)
                }
                
                Divider()
                    .padding(.horizontal, 15)
                
                if (securedConfirmation) {
                    ZStack {
                        HStack (spacing: 0) {
                            SecureField("Konfirmasi Password", text: $confirmationPassword)
                                .font(.custom("Montserrat-Regular", size: 14))
                                .padding()
                                .frame(width: 200, height: 50)
                                .foregroundColor(Color(hex: "#232175"))
                                .keyboardType(.phonePad)
                            
                            Spacer()
                            
                            Button(action: {
                                self.securedConfirmation.toggle()
                            }) {
                                Text("show")
                                    .font(.custom("Montserrat-Regular", size: 12))
                                    .frame(width: 80, height: 50)
                                    .cornerRadius(10)
                                    .foregroundColor(Color(hex: "#3756DF"))
                            }
                        }
                    }.padding(.leading, 15)
                } else {
                    ZStack {
                        HStack (spacing: 0) {
                            TextField("Konfirmasi Password", text: $confirmationPassword)
                                .font(.custom("Montserrat-Regular", size: 14))
                                .padding()
                                .frame(width: 200, height: 50)
                                .foregroundColor(Color(hex: "#232175"))
                                .keyboardType(.phonePad)
                            
                            Spacer()
                            
                            Button(action: {
                                self.securedConfirmation.toggle()
                            }) {
                                Text("show")
                                    .font(.custom("Montserrat-Regular", size: 12))
                                    .frame(width: 80, height: 50)
                                    .cornerRadius(10)
                                    .foregroundColor(Color(hex: "#3756DF"))
                            }
                        }
                    }.padding(.leading, 15)
                }
            }
            .frame(width: UIScreen.main.bounds.width - 70)
            .background(Color.white)
            .cornerRadius(15)
            .shadow(color: Color.gray, radius: 1, x: 0, y: 0)

            NavigationLink(destination: LoginView(rootIsActive: self.$rootIsActive)) {
                Text("SIMPAN DATA LOGIN")
                    .font(.custom("Montserrat-Bold", size: 14))
                    .foregroundColor(Color(hex: "#232175"))
                    .frame(maxWidth: .infinity, minHeight: 50, maxHeight: 50)
            }
            .background(Color.white)
            .cornerRadius(12)
            .padding(.horizontal, 20)
            .padding(.top, 30)
            .padding(.bottom, 20)
        }
        .frame(width: UIScreen.main.bounds.width - 30)
    }
}

struct ForgotPasswordResetPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        ForgotPasswordResetPasswordView(rootIsActive: Binding.constant(false))
    }
}
