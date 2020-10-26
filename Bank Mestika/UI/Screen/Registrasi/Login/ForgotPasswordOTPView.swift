//
//  ForgotPasswordOTP.swift
//  Bank Mestika
//
//  Created by Abdul R. Arraisi on 22/10/20.
//

import SwiftUI

struct ForgotPasswordOTPView: View {
    /*
     Environtment Object
     */
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @EnvironmentObject var loginData: LoginBindingModel
    
    /*
     Variable PIN OTP
     */
    var maxDigits: Int = 6
    @State var pin: String = ""
    @State var showPin = true
    @State var isDisabled = false
    
    /*
     Variable Validation
     */
    @State var isOtpValid = false
    @State var otpInvalidCount = 0
    @State var isResendOtpDisabled = true
    
    /*
     Boolean for Show Modal
     */
    @State var showingModal = false
    
    /*
     Timer
     */
    @State private var timeRemaining = 40
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        ZStack(alignment: .top) {
            Image("bg_splash")
                .resizable()
            
            VStack {
                AppBar
                    .padding(.top, 45)
                    .padding(.horizontal, 30)
                
                VStack {
                    Text("VERIFIKASI KODE OTP")
                        .font(.custom("Montserrat-Bold", size: 24))
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .padding(.top, 20)
                        .padding(.bottom, 10)
                        .padding(.horizontal, 20)
                        .fixedSize(horizontal: false, vertical: true)
                    
                    CardForms
                    Spacer()
                }
                .padding(.horizontal, 30)
                .padding(.top, 35)
            }
            
            // Background Color When Modal Showing
            if self.showingModal {
                ModalOverlay(tapAction: { withAnimation { self.showingModal = false } })
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
        .popup(isPresented: $showingModal, type: .default, position: .bottom, animation: Animation.spring(), closeOnTap: false, closeOnTapOutside: true) {
            createBottomFloater()
        }
    }
    
    var AppBar: some View {
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
    
    var CardForms: some View {
        VStack(alignment: .center) {
            HStack {
                VStack(alignment: .center) {
                    Text("Masukkan kode OTP telah dikirim ke nomor Anda untuk melanjutkan ke tahap berikutnya")
                        .font(.custom("Montserrat-Regular", size: 12))
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 20)
                    
//                                        Text("".replace(myString: loginData.noTelepon, [6, 7, 8, 9], "x"))
//                                            .font(.caption)
//                                            .foregroundColor(.white)
//                                            .fontWeight(.bold)
//                                            .multilineTextAlignment(.center)
//                                            .padding(.horizontal, 20)
//                                            .padding(.bottom, 20)
                }
            }
            
            ZStack {
                pinDots
                backgroundField
            }
            
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
                .font(.custom("Montserrat-Regular", size: 12))
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
                .padding(.top, 15)
                .padding(.bottom, 20)
                .padding(.horizontal, 20)
            
            Button(action: {
                
                showingModal.toggle()
                
            }, label: {
                
                Text("Masukkan Kode OTP")
                    .font(.custom("Montserrat-SemiBold", size: 14))
                    .foregroundColor(Color(hex: "#2334D0"))
                    .frame(maxWidth: .infinity, minHeight: 50, maxHeight: 50)
            })
            .background(Color.white)
            .cornerRadius(12)
            .padding(.horizontal, 20)
            .padding(.top, 30)
            .padding(.bottom, 10)
        }
        .frame(width: UIScreen.main.bounds.width - 30)
    }
    
    private var pinDots: some View {
        HStack {
            Spacer()
            ForEach(0 ..< maxDigits) { index in
                Text("\(self.getImageName(at: index))")
                    .font(.title)
                    .foregroundColor(Color(hex: "#232175"))
                    .bold()
                    .frame(width: 40, height: 40)
                    .multilineTextAlignment(.center)
                    .background(Color.white)
                    .cornerRadius(8)
                    .shadow(color: Color(hex: "#3756DF").opacity(0.2), radius: 15, x: 0, y: 4)
            }
            Spacer()
        }.onTapGesture(perform: {
            isDisabled = false
        })
    }
    
    private var backgroundField: some View {
        let boundPin = Binding<String>(get: { self.pin }, set: { newValue in
            self.pin = newValue
            self.submitPin()
        })
        
        return TextField("", text: boundPin, onCommit: submitPin)
            .accentColor(.clear)
            .foregroundColor(.clear)
            .keyboardType(.numberPad)
            .disabled(isDisabled)
    }
    
    private func submitPin() {
        if pin.count == maxDigits {
            isDisabled = true
        }
        
        if pin.count > maxDigits {
            pin = String(pin.prefix(maxDigits))
            submitPin()
        }
    }
    
    private func getImageName(at index: Int) -> String {
        if index >= self.pin.count {
            return "•"
        }
        
        if self.showPin {
            return self.pin.digits[index].numberString
        }
        
        return ""
    }
    
    // MARK: -BOTTOM FLOATER FOR MESSAGE
    func createBottomFloater() -> some View {
        VStack(alignment: .leading) {
            Image("ic_bell")
                .resizable()
                .frame(width: 95, height: 95)
                .padding(.top, 20)
            Text("Sebelum Melanjutkan Proses")
                .font(.custom("Montserrat-Bold", size: 12))
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                .font(.system(size: 16))
                .foregroundColor(Color(hex: "#232175"))
                .padding(.bottom, 20)
            Text("Apakah Anda \nMasih Mengingat PIN \nTransaksi Anda?")
                .font(.custom("Montserrat-Bold", size: 24))
                .foregroundColor(Color(hex: "#232175"))
                .padding(.bottom, 30)
            
            NavigationLink(destination: ForgotPasswordNoRekeningOrKTPView(), label: {
                Text("Ya, Saya Masih Mengingat")
                    .font(.custom("Montserrat-Regular", size: 12))
                    .foregroundColor(.black)
                    .frame(maxWidth: .infinity, maxHeight: 50)
            })
            .padding(.bottom, 2)
            .cornerRadius(12)
            
            NavigationLink(destination: ForgotPasswordATMPINView(), label: {
                Text("Tidak, Saya Tidak Ingat")
                    .font(.custom("Montserrat-SemiBold", size: 14))
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity, maxHeight: 50)
            })
            .background(Color(hex: "#2334D0"))
            .cornerRadius(12)
            .padding(.bottom, 30)
        }
        .frame(width: UIScreen.main.bounds.width - 100)
        .padding(.horizontal, 30)
        .background(Color.white)
        .cornerRadius(20)
    }
}

struct ForgotPasswordOTP_Previews: PreviewProvider {
    static var previews: some View {
        ForgotPasswordOTPView()
    }
}
