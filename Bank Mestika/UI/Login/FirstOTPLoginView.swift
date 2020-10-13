//
//  FirstOTPLoginView.swift
//  Bank Mestika
//
//  Created by Prima Jatnika on 12/10/20.
//

import SwiftUI

struct FirstOTPLoginView: View {
    @Binding var rootIsActive : Bool
    @State private var numberOfCells: Int = 6
    @State private var currentlySelectedCell = 0
    
    @State private var timeRemaining = 40
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
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
                    Text("MASUKKAN KODE OTP")
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
        .onReceive(timer) { time in
            if self.timeRemaining > 0 {
                self.timeRemaining -= 1
            }
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
            Text("Kode OTP telah dikirimkan ke nomor")
                .font(.subheadline)
                .foregroundColor(.white)
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
                    .foregroundColor(.white)
                Button(action: {
                    print("-> Resend OTP")
                }) {
                    Text("Resend OTP")
                        .font(.caption2)
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .foregroundColor(.white)
                }
                Text("(00:\(timeRemaining))")
                    .font(.caption2)
                    .foregroundColor(.white)
            }
            .padding(.top, 5)
            
            Text("Pastikan Anda terkoneksi ke Internet dan pulsa mencukupi untuk menerima OTP")
                .font(.caption)
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
                .padding(.top, 15)
                .padding(.bottom, 20)
                .padding(.horizontal, 20)
            
            NavigationLink(destination: FirstATMLoginView(rootIsActive: self.$rootIsActive)) {
                Text("Masukkan Kode OTP")
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
struct FirstOTPLoginView_Previews: PreviewProvider {
    static var previews: some View {
        FirstOTPLoginView(rootIsActive: .constant(false))
    }
}
#endif
