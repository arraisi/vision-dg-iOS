//
//  EmailOTPVerificationView.swift
//  Bank Mestika
//
//  Created by Prima Jatnika on 01/10/20.
//

import SwiftUI

struct EmailOTPVerificationView: View {
    @EnvironmentObject var registerData: RegistrasiModel
    
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
                cardForm
                Spacer()
            }
            .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            .navigationBarTitle("BANK MESTIKA", displayMode: .inline)
            .padding(.horizontal, 30)
            .padding(.top, 30)
            .padding(.bottom, 35)
        }
        .onTapGesture() {
            UIApplication.shared.endEditing()
        }
        .onReceive(timer) { time in
            if self.timeRemaining > 0 {
                self.timeRemaining -= 1
            }
        }
    }
    
    var cardForm: some View {
        VStack(alignment: .center) {
            Text("Kami telah mengirimkan Kode Verifikasi ke Email Anda")
                .font(.title3)
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
            
            Text("Silahkan cek email Anda untuk melihat kode OTP")
                .font(.caption)
                .foregroundColor(.black)
                .multilineTextAlignment(.center)
                .padding(.top, 15)
                .padding(.bottom, 20)
                .padding(.horizontal, 20)
            
            NavigationLink(destination: TujuanPembukaanRekeningView().environmentObject(registerData)) {
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

struct EmailOTPVerificationView_Previews: PreviewProvider {
    static var previews: some View {
        EmailOTPVerificationView()
    }
}
