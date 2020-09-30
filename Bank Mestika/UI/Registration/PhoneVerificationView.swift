//
//  PhoneVerificationView.swift
//  Bank Mestika
//
//  Created by Prima Jatnika on 24/09/20.
//

import SwiftUI

struct PhoneVerificationView: View {
    
    @State var phoneNumber: String = ""
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var body: some View {
        ZStack(alignment: .top) {
            VStack {
                Color(hex: "#232175")
                    .frame(height: 300)
                Color(hex: "#F6F8FB")
            }
            VStack {
                appbar
                    .padding(.top, 45)
                    .padding(.horizontal, 30)
                
                VStack {
                    cardForm
                    Spacer()
                }
                .padding(.horizontal, 30)
                .padding(.top, 35)
                .padding(.bottom, 35)
            }
        }
        .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
        .navigationBarHidden(true)
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
                .frame(width: 25, height: 25)
            Text("BANK MESTIKA")
                .foregroundColor(.white)
                .font(.system(size: 20))
                .bold()
        }
    }
    
    var cardForm: some View {
        VStack(alignment: .center) {
            Text("Phone Verification")
                .font(.title2)
                .foregroundColor(Color(hex: "#232175"))
                .fontWeight(.bold)
                .padding(.top, 20)
                .padding(.horizontal, 20)
            
            Text("Silahkan masukan No. Telepon Anda")
                .font(.subheadline)
                .foregroundColor(Color(hex: "#232175"))
                .multilineTextAlignment(.center)
                .padding(.top, 5)
                .padding(.horizontal, 20)
            
            ZStack {
                HStack (spacing: 0) {
                    Text("🇮🇩 +62")
                        .frame(width: 80, height: 50)
                        .background(Color.secondary.opacity(0.2))
                        .cornerRadius(10)
                        .foregroundColor(.black)
                    TextField("Phone Number", text: $phoneNumber)
                        .padding()
                        .frame(width: 200, height: 50)
                        .keyboardType(.phonePad)
                }.padding()
                RoundedRectangle(cornerRadius: 10).stroke()
                    .frame(width: 280, height: 50)
                    .foregroundColor(Color.secondary.opacity(0.2))
            }
            
            NavigationLink(destination: OTPVerificationView()) {
                Text("Verifikasi No. Telepon")
                    .foregroundColor(.white)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .font(.system(size: 13))
                    .frame(maxWidth: .infinity, minHeight: 40, maxHeight: 40)
            }
            .background(Color(hex: "#2334D0"))
            .cornerRadius(12)
            .padding(.horizontal, 20)
            .padding(.top, 10)
            .padding(.bottom, 20)
        }
        .frame(width: UIScreen.main.bounds.width - 30)
        .background(Color.white)
        .cornerRadius(15)
        .shadow(radius: 30)
    }
}

struct PhoneVerificationView_Previews: PreviewProvider {
    static var previews: some View {
        PhoneVerificationView()
    }
}
