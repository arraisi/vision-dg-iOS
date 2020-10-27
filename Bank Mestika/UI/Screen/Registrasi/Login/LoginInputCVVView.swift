//
//  LoginInputCVVView.swift
//  Bank Mestika
//
//  Created by Abdul R. Arraisi on 27/10/20.
//

import SwiftUI

class TextFieldManager: ObservableObject {
    let limit = 3
    @Published var text = "" {
        didSet {
            if text.count > limit {
                text = String(text.prefix(limit))
                print(text)
            }
        }
    }
}

struct LoginInputCVVView: View {
    
    @ObservedObject var cvv = TextFieldManager()
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var body: some View {
        ZStack(alignment: .top) {
            Color(hex: "#232175")
            
            VStack {
                appbar
                    .padding(.top, 45)
                    .padding(.bottom, 5)
                    .padding(.horizontal, 30)
                
                Spacer()
                
                VStack {
                    
                    VStack(alignment: .leading, spacing: 20) {
                        HStack {
                            Image(systemName: "largecircle.fill.circle")
                                .foregroundColor(.blue)
                            
                            Text("Kode CVV")
                        }
                        
                        VStack(alignment: .leading) {
                            
                            HStack (spacing: 0) {
                                TextField("Masukan Password", text: $cvv.text, onEditingChanged: { changed in
                                    print("input \($cvv.text)")
                                })
                                .font(.custom("Montserrat-Regular", size: 14))
                                .foregroundColor(Color(hex: "#232175"))
                                .keyboardType(.phonePad)
                                
                                Spacer()
                            }
                            
                            Divider()
                            
                            Text("Masukkan 3 digit angka dibelakang kartu ATM Anda")
                                .font(.system(size: 10))
                        }
                        .padding(.vertical, 25)
                        .padding(.horizontal, 15)
                        .background(Color(hex: "#F6F8FB"))
                        .cornerRadius(15)
                        .overlay(RoundedRectangle(cornerRadius: 25).stroke(lineWidth: 0.5).foregroundColor(.gray))
                    }
                    .padding(20)
                    .background(Color.white)
                    .cornerRadius(25)
                    .shadow(color: Color(hex: "#3756DF").opacity(0.2), radius: 15, x: 0, y: 4)
                    
                    Spacer()
                    Button(action: {}, label: {
                        Text("AKTIFKAN KARTU")
                            .foregroundColor(.white)
                            .font(.custom("Montserrat-SemiBold", size: 14))
                            .frame(maxWidth: .infinity, maxHeight: 50)
                    })
                    .frame(height: 50)
                    .background(Color(hex: "#2334D0"))
                    .cornerRadius(12)
                    .padding(.vertical, 30)
                    .padding(.bottom, 30)
//                    Spacer()
                }
                .padding(.horizontal, 25)
                .padding(.top, UIScreen.main.bounds.height/10)
                .background(Color(hex: "#F6F8FB"))
            }
        }
        .edgesIgnoringSafeArea(.all)
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
}

struct LoginInputCVVView_Previews: PreviewProvider {
    static var previews: some View {
        LoginInputCVVView()
    }
}
