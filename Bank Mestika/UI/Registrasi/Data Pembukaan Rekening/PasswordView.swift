//
//  FormPasswordView.swift
//  Bank Mestika
//
//  Created by Prima Jatnika on 04/10/20.
//

import SwiftUI

struct PasswordView: View {
    
    @State var password: String = ""
    @State var confirmationPassword: String = ""
    
    @State private var secured: Bool = true
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var body: some View {
        
        ZStack(alignment: .top) {
            Color(hex: "#232175")
            
            VStack {
                
                Spacer()
                Rectangle()
                    .fill(Color.white)
                    .frame(height: 42 / 100 * UIScreen.main.bounds.height)
                    .cornerRadius(radius: 25.0, corners: .topLeft)
                    .cornerRadius(radius: 25.0, corners: .topRight)
            }
            
            VStack {
                
                Spacer()
                
                CustomNavigationBarView(presentationMode: _presentationMode)
                    .padding(.top, 45)
                    .padding(.horizontal, 30)
                
                ScrollView {
                    
                    // Title
                    Text("DATA PEMBUKAAN REKENING")
                        .font(Font.system(size: 24))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .padding(.vertical, 30)
                        .padding(.horizontal, 30)
                    
                    // Content
                    ZStack {
                        
                        // Forms
                        ZStack {
                            
                            VStack{
                                LinearGradient(gradient: Gradient(colors: [.white, Color(hex: "#D6DAF0")]), startPoint: .top, endPoint: .bottom)
                            }
                            .cornerRadius(25.0)
                            .padding(.horizontal, 60)
                            
                            VStack{
                                LinearGradient(gradient: Gradient(colors: [.white, Color(hex: "#D6DAF0")]), startPoint: .top, endPoint: .bottom)
                            }
                            .cornerRadius(25.0)
                            .shadow(color: Color(hex: "#2334D0").opacity(0.2), radius: 5, y: -2)
                            .padding(.horizontal, 40)
                            .padding(.top, 10)
                            
                            VStack {
                                
                                Spacer()
                                
                                // Sub title
                                Text("Masukan Password Aplikasi Digital Banking")
                                    .font(Font.system(size: 18))
                                    .foregroundColor(Color(hex: "#232175"))
                                    .fontWeight(.semibold)
                                    .multilineTextAlignment(.center)
                                    .padding(.horizontal, 20)
                                    .padding(.top, 30)
                                
                                Text("Password ini digunakan saat anda masuk kedalam Aplikasi Mobile Banking Mestika Bank")
                                    .font(.caption2)
                                    .multilineTextAlignment(.center)
                                    .padding(.horizontal, 20)
                                    .padding(.top, 3)
                                    .padding(.bottom, 20)
                                
                                // Forms input
                                ZStack {
                                    cardForm
                                        .padding(.vertical, 20)
                                    
                                }
                                .frame(width: UIScreen.main.bounds.width - 70)
                                .background(Color.white)
                                .cornerRadius(15)
                                .shadow(color: Color.gray, radius: 1, x: 0, y: 0)
                                
                                
                                NavigationLink(destination: PINView(), label:{
                                    
                                    Text("Berikutnya")
                                        .foregroundColor(.white)
                                        .fontWeight(.bold)
                                        .font(.system(size: 14))
                                        .frame(maxWidth: .infinity, maxHeight: 40)
                                    
                                })
                                .frame(height: 50)
                                .background(Color(hex: "#2334D0"))
                                .cornerRadius(12)
                                .padding(.horizontal, 35)
                                .padding(.vertical, 20)
                                
                                
                            }
                            .background(LinearGradient(gradient: Gradient(colors: [.white, Color(hex: "#D6DAF0")]), startPoint: .top, endPoint: .bottom))
                            .cornerRadius(25.0)
                            .shadow(color: Color(hex: "#2334D0").opacity(0.2), radius: 10, y: -2)
                            .padding(.horizontal, 20)
                            .padding(.top, 25)
                        }
                        
                    }
                    .padding(.bottom, 25)
                    
                }
                .padding(.bottom, 0.1)
                .KeyboardAwarePadding()
                
            }
            
        }
        .edgesIgnoringSafeArea(.all)
        .navigationBarHidden(true)
        
    }
    
    var cardForm: some View {
        VStack(alignment: .leading) {
            if (secured) {
                ZStack {
                    HStack (spacing: 0) {
                        SecureField("Masukan Password", text: $password)
                            .padding()
                            .frame(width: 200, height: 50)
                            .foregroundColor(Color(hex: "#232175"))
                            .keyboardType(.phonePad)
                        
                        Button(action: {
                            self.secured.toggle()
                        }) {
                            Text("show")
                                .frame(width: 80, height: 50)
                                .cornerRadius(10)
                                .foregroundColor(Color(hex: "#3756DF"))
                        }
                    }.padding(.leading, 15)
                }
            } else {
                ZStack {
                    HStack (spacing: 0) {
                        TextField("Masukan Password", text: $password)
                            .padding()
                            .frame(width: 200, height: 50)
                            .foregroundColor(Color(hex: "#232175"))
                            .keyboardType(.phonePad)
                        
                        Button(action: {
                            self.secured.toggle()
                        }) {
                            Text("show")
                                .frame(width: 80, height: 50)
                                .cornerRadius(10)
                                .foregroundColor(Color(hex: "#3756DF"))
                        }
                    }
                }.padding(.leading, 15)
            }
            
            Divider()
                .padding(.horizontal, 15)
            
            if (secured) {
                ZStack {
                    HStack (spacing: 0) {
                        SecureField("Konfirmasi Password", text: $confirmationPassword)
                            .padding()
                            .frame(width: 200, height: 50)
                            .foregroundColor(Color(hex: "#232175"))
                            .keyboardType(.phonePad)
                        
                        Button(action: {
                            self.secured.toggle()
                        }) {
                            Text("show")
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
                            .padding()
                            .frame(width: 200, height: 50)
                            .foregroundColor(Color(hex: "#232175"))
                            .keyboardType(.phonePad)
                        
                        Button(action: {
                            self.secured.toggle()
                        }) {
                            Text("show")
                                .frame(width: 80, height: 50)
                                .cornerRadius(10)
                                .foregroundColor(Color(hex: "#3756DF"))
                        }
                    }
                }.padding(.leading, 15)
            }
        }
    }
}

struct FormPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        PasswordView()
    }
}