//
//  FirstATMLoginView.swift
//  Bank Mestika
//
//  Created by Prima Jatnika on 12/10/20.
//

import SwiftUI

struct FirstATMLoginView: View {
    @Binding var rootIsActive : Bool
    @State var atmNumber: String = ""
    @State var pin: String = ""
    
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
                    Text("MASUKKAN DATA ANDA")
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
            Button(action: {
                self.presentationMode.wrappedValue.dismiss()
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
            Text("Masukkan nomor kartu ATM dan PIN ATM Anda yang sudah terdaftar")
                .font(.subheadline)
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
                .padding(.top, 5)
                .padding(.bottom, 20)
                .padding(.horizontal, 20)
            
            TextField("Masukan nomor ATM Anda", text: $atmNumber, onEditingChanged: { changed in
                print("\($atmNumber)")
            })
            .frame(height: 30)
            .font(.subheadline)
            .padding()
            .background(Color.white)
            .cornerRadius(20)
            .padding(.horizontal, 20)
            
            TextField("Masukan PIN ATM Anda", text: $pin, onEditingChanged: { changed in
                print("\($pin)")
            })
            .frame(height: 30)
            .font(.subheadline)
            .padding()
            .background(Color.white)
            .cornerRadius(20)
            .padding(.horizontal, 20)

            NavigationLink(destination: FirstPasswordLoginView(rootIsActive: self.$rootIsActive)) {
                Text("Masukkan Data Kartu ATM Anda")
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
struct FirstATMLoginView_Previews: PreviewProvider {
    static var previews: some View {
        FirstATMLoginView(rootIsActive: .constant(false))
    }
}
#endif
