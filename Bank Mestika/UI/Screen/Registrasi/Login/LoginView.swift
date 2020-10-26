//
//  LoginView.swift
//  Bank Mestika
//
//  Created by Prima Jatnika on 12/10/20.
//

import SwiftUI

struct LoginView: View {
    @Binding var rootIsActive : Bool
    @State var password: String = ""
    
    @State private var securedPassword: Bool = true
    
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
                    Text("LOGIN APPS")
                        .font(.title2)
                        .bold()
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
    
    var cardForm: some View {
        VStack(alignment: .center) {
            Text("Masukkan Password Akun Anda")
                .font(.subheadline)
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
                .padding(.top, 5)
                .padding(.bottom, 20)
                .padding(.horizontal, 20)
            
            if (securedPassword) {
                HStack {
                    SecureField("Password account Anda", text: $password)
                    
                    Button(action: {
                        self.securedPassword.toggle()
                    }) {
                        Text("show")
                            .frame(width: 80, height: 50)
                            .cornerRadius(10)
                            .foregroundColor(Color(hex: "#3756DF"))
                    }
                }
                .frame(height: 40)
                .font(.subheadline)
                .padding()
                .background(Color.white)
                .cornerRadius(15)
                .padding(.horizontal, 20)
            } else {
                HStack {
                    TextField("Password account Anda", text: $password, onEditingChanged: { changed in
                        print("\($password)")
                    }, onCommit: {
                        print("Commited")
                    })
                    
                    Button(action: {
                        self.securedPassword.toggle()
                    }) {
                        Text("show")
                            .frame(width: 80, height: 50)
                            .cornerRadius(10)
                            .foregroundColor(Color(hex: "#3756DF"))
                    }
                }
                .frame(height: 40)
                .font(.subheadline)
                .padding()
                .background(Color.white)
                .cornerRadius(15)
                .padding(.horizontal, 20)
            }
            
            NavigationLink(
                destination: ForgotPasswordView(),
                label: {
                    Text("Forgot Password?")
                        .font(.subheadline)
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .padding(.top, 5)
                        .padding(.bottom, 40)
                        .padding(.horizontal, 20)
                })
            
            HStack {
                Button(action: {}) {
                    Text("LOGIN APPS")
                        .foregroundColor(Color(hex: "#232175"))
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .font(.system(size: 13))
                        .frame(maxWidth: .infinity, minHeight: 40, maxHeight: 40)
                }
                .background(Color.white)
                .cornerRadius(12)
                .padding(.leading, 20)
                .padding(.trailing, 10)
                
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Image("ic_fingerprint")
                        .padding(.trailing, 20)
                })
            }
            
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                Text("Login Menggunakan PIN?")
                    .font(.subheadline)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .padding(.top, 5)
                    .padding(.bottom, 10)
                    .padding(.horizontal, 20)
            })
            
            Spacer()
            
            HStack {
                Text("Don't have an account yet?")
                    .font(.subheadline)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .padding(.top, 5)
                    .padding(.bottom, 10)
                    .padding(.leading, 20)
                
                Button(action: {
                    self.rootIsActive = false
                }, label: {
                    Text("Register Here")
                        .font(.subheadline)
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .padding(.top, 5)
                        .padding(.bottom, 10)
                        .padding(.trailing, 20)
                })
            }
        }
        .frame(width: UIScreen.main.bounds.width - 30)
    }
}

#if DEBUG
struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(rootIsActive: .constant(false))
    }
}
#endif
