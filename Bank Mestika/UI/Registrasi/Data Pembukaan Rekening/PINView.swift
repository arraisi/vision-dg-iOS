//
//  FormPINView.swift
//  Bank Mestika
//
//  Created by Prima Jatnika on 04/10/20.
//

import SwiftUI

struct PINView: View {
    @EnvironmentObject var registerData: RegistrasiModel
    @State var pin: String = ""
    @State var confirmationPin: String = ""
    
    @State private var securedPin: Bool = true
    @State private var securedConfirmationPin: Bool = true
    
    var disableForm: Bool {
        pin != confirmationPin || pin.count < 5
    }
    
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
                        .bold()
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .padding(.vertical, 40)
                        .padding(.horizontal, 20)
                        .fixedSize(horizontal: false, vertical: true)
                    
                    // Content
                    ZStack {
                        
                        // Forms
                        ZStack {
                            
                            VStack{
                                LinearGradient(gradient: Gradient(colors: [.white, Color(hex: "#D6DAF0")]), startPoint: .top, endPoint: .bottom)
                            }
                            .cornerRadius(25.0)
                            .shadow(color: Color(hex: "#D6DAF0"), radius: 5)
                            .padding(.horizontal, 60)
                            
                            VStack{
                                LinearGradient(gradient: Gradient(colors: [.white, Color(hex: "#D6DAF0")]), startPoint: .top, endPoint: .bottom)
                            }
                            .cornerRadius(25.0)
                            .shadow(color: Color(hex: "#D6DAF0"), radius: 5)
                            .padding(.horizontal, 40)
                            .padding(.top, 15)
                            
                            VStack {
                                Spacer()
                                
                                // Sub title
                                Text("Masukan PIN Transaksi Perbankan")
                                    .font(Font.system(size: 18))
                                    .foregroundColor(Color(hex: "#232175"))
                                    .fontWeight(.semibold)
                                    .multilineTextAlignment(.center)
                                    .padding(.horizontal, 20)
                                    .padding(.top, 20)
                                
                                Text("Pin ini digunakan untuk setiap kegiatan transaksi keuangan")
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
                                
                               
                                NavigationLink(destination: Term_ConditionView().environmentObject(registerData), label:{
                                    
                                    Text("Berikutnya")
                                        .foregroundColor(.white)
                                        .fontWeight(.bold)
                                        .font(.system(size: 14))
                                        .frame(maxWidth: .infinity, maxHeight: 40)
                                    
                                })
                                .frame(height: 50)
                                .background(Color(hex: disableForm ? "#CBD1D9" : "#2334D0"))
                                .cornerRadius(12)
                                .padding(.horizontal, 35)
                                .padding(.vertical, 20)
                                .disabled(disableForm)
                                
                            }
                            .background(LinearGradient(gradient: Gradient(colors: [.white, Color(hex: "#D6DAF0")]), startPoint: .top, endPoint: .bottom))
                            .cornerRadius(25.0)
                            .shadow(color: Color(hex: "#D6DAF0"), radius: 5)
                            .padding(.horizontal, 20)
                            .padding(.top, 40)
                            
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
            if (securedPin) {
                ZStack {
                    HStack (spacing: 0) {
                        SecureField("Masukan PIN", text: $pin)
                            .padding()
                            .frame(width: 200, height: 50)
                            .foregroundColor(Color(hex: "#232175"))
                            .keyboardType(.phonePad)
                        
                        Button(action: {
                            self.securedPin.toggle()
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
                        TextField("Masukan PIN", text: $pin, onEditingChanged: { changed in
                            print("\($pin)")
                            
                            self.registerData.pin = pin
                        })
                            .padding()
                            .frame(width: 200, height: 50)
                            .foregroundColor(Color(hex: "#232175"))
                            .keyboardType(.phonePad)
                        
                        Button(action: {
                            self.securedPin.toggle()
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
            
            if (securedConfirmationPin) {
                ZStack {
                    HStack (spacing: 0) {
                        SecureField("Konfirmasi PIN", text: $confirmationPin)
                            .padding()
                            .frame(width: 200, height: 50)
                            .foregroundColor(Color(hex: "#232175"))
                            .keyboardType(.phonePad)
                        
                        Button(action: {
                            self.securedConfirmationPin.toggle()
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
                        TextField("Konfirmasi PIN", text: $confirmationPin)
                            .padding()
                            .frame(width: 200, height: 50)
                            .foregroundColor(Color(hex: "#232175"))
                            .keyboardType(.phonePad)
                        
                        Button(action: {
                            self.securedConfirmationPin.toggle()
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

#if DEBUG
struct PINView_Previews: PreviewProvider {
    static var previews: some View {
        PINView()
    }
}
#endif
