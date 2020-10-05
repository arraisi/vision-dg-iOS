//
//  OTPVerificationView.swift
//  Bank Mestika
//
//  Created by Prima Jatnika on 24/09/20.
//

import SwiftUI

struct OTPVerificationView: View {
    
    @State private var numberOfCells: Int = 6
    @State private var currentlySelectedCell = 0
    
    @State private var timeRemaining = 40
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var disableForm: Bool {
        currentlySelectedCell < 6
    }
    
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
        .onReceive(timer) { time in
            if self.timeRemaining > 0 {
                self.timeRemaining -= 1
            }
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
                .frame(width: 25, height: 25)
            Text("BANK MESTIKA")
                .foregroundColor(.white)
                .font(.system(size: 20))
                .bold()
        }
    }
    
    var cardForm: some View {
        VStack(alignment: .center) {
            Text("Kami telah mengirimkan OTP ke No. Telepon Anda")
                .font(.title2)
                .foregroundColor(Color(hex: "#232175"))
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
                .padding(.top, 20)
                .padding(.horizontal, 20)
            
            Text("Silahkan masukan kode OTP")
                .font(.subheadline)
                .foregroundColor(Color(hex: "#707070"))
                .multilineTextAlignment(.center)
                .padding(.top, 5)
                .padding(.bottom, 20)
                .padding(.horizontal, 20)
        
            HStack {
                ForEach(0 ..< self.numberOfCells) { index in
                    CharacterInputCell(currentlySelectedCell: self.$currentlySelectedCell, index: index)
                }
            }.lineSpacing(10)
            
            HStack {
                Text("Tidak Menerima Kode?")
                    .font(.caption2)
                Button(action: {
                    print("-> Resend OTP")
                }) {
                    Text("Resend OTP")
                        .font(.caption2)
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .foregroundColor(Color(hex: "#232175"))
                }
                Text("(00:\(timeRemaining))")
                    .font(.caption2)
            }
            .padding(.top, 5)
            
            Text("Pastikan Anda terkoneksi ke Internet dan pulsa mencukupi untuk menerima OTP")
                .font(.caption)
                .foregroundColor(.black)
                .multilineTextAlignment(.center)
                .padding(.top, 15)
                .padding(.bottom, 20)
                .padding(.horizontal, 20)
            
            NavigationLink(destination: ChooseSavingsView()) {
                Text("Verifikasi OTP")
                    .foregroundColor(.white)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .font(.system(size: 13))
                    .frame(maxWidth: .infinity, minHeight: 40, maxHeight: 40)
            }
            .background(Color(hex: disableForm ? "#CBD1D9" : "#2334D0"))
            .cornerRadius(12)
            .padding(.horizontal, 20)
            .padding(.top, 10)
            .padding(.bottom, 20)
            .disabled(disableForm)
        }
        .frame(width: UIScreen.main.bounds.width - 30)
        .background(Color.white)
        .cornerRadius(15)
        .shadow(radius: 30)
    }
}

#if DEBUG
struct OTPVerificationView_Previews: PreviewProvider {
    static var previews: some View {
        OTPVerificationView()
    }
}
#endif
