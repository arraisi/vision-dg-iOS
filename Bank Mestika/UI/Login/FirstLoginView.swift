//
//  FirstLoginView.swift
//  Bank Mestika
//
//  Created by Prima Jatnika on 12/10/20.
//

import SwiftUI

struct FirstLoginView: View {
    @Binding var rootIsActive : Bool
    @State var phoneNumber: String = ""
    
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
            Text("Silahkan Masukkan Nomor Handphone Anda")
                .font(.subheadline)
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
                .padding(.top, 5)
                .padding(.bottom, 20)
                .padding(.horizontal, 20)
            
            HStack {
                Text("🇮🇩 +62 ").foregroundColor(.gray)
                
                Divider()
                    .frame(height: 30)
                
                TextField("No. Telepon", text: $phoneNumber, onEditingChanged: { changed in
                    print("\($phoneNumber)")
                }, onCommit: {
                    print("Commited")
                })
                .keyboardType(.numberPad)
            }
            .frame(height: 40)
            .font(.subheadline)
            .padding()
            .background(Color.white)
            .cornerRadius(15)
            .padding(.horizontal, 20)
            
            Text("Pastikan nomor handphone Anda telah sesuai sebelum melanjutkan ketahap berikutnya")
                .font(.subheadline)
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
                .padding(.top, 20)
                .padding(.bottom, 10)
                .padding(.horizontal, 20)
            
            NavigationLink(destination: FirstOTPLoginView(rootIsActive: self.$rootIsActive)) {
                Text("Masukkan No. HP Anda")
                    .foregroundColor(Color(hex: "#232175"))
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .font(.system(size: 13))
                    .frame(maxWidth: .infinity, minHeight: 40, maxHeight: 40)
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

#if DEBUG
struct FirstLoginView_Previews: PreviewProvider {
    static var previews: some View {
        FirstLoginView(rootIsActive: .constant(false))
    }
}
#endif
