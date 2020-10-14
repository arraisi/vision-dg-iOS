//
//  OTPVerificationView.swift
//  Bank Mestika
//
//  Created by Prima Jatnika on 24/09/20.
//

import SwiftUI

struct OTPVerificationView: View {
    @EnvironmentObject var registerData: RegistrasiModel
    
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
    @State var isResendOtpDisabled = true
    
    @State private var timeRemaining = 30
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    /*
     Boolean for Show Modal
     */
    @State var showingModal = false
    
    var disableForm: Bool {
        pin.count < 6
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
            
            if self.timeRemaining < 1 {
                isResendOtpDisabled = false
            }
        }
        .popup(isPresented: $showingModal, type: .floater(), position: .bottom, animation: Animation.spring(), closeOnTapOutside: true) {
            createBottomFloater()
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
            Text("Kami telah mengirimkan OTP ke No. \(registerData.noTelepon)")
                .font(.title3)
                .foregroundColor(Color(hex: "#232175"))
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
                .padding(.top, 20)
                .padding(.horizontal, 20)
            
            Text("Silahkan masukan kode OTP dengan REF #1234")
                .font(.subheadline)
                .foregroundColor(Color(hex: "#707070"))
                .multilineTextAlignment(.center)
                .padding(.top, 5)
                .padding(.bottom, 20)
                .padding(.horizontal, 20)
        
            ZStack {
                pinDots
                backgroundField
            }
            
            HStack {
                Text("Tidak Menerima Kode?")
                    .font(.caption2)
                
                Button(action: {
                    print("-> Resend OTP")
                    self.timeRemaining = 60
                }) {
                    Text("Resend OTP")
                        .font(.caption2)
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .foregroundColor(isResendOtpDisabled ? Color.black : Color(hex: "#232175"))
                }
                .disabled(isResendOtpDisabled)
                
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
            
            VStack {
                NavigationLink(destination: ChooseSavingsView().environmentObject(registerData), isActive: self.$isOtpValid) {
                    Text("")
                }
                
                Button(action: {
                    print(pin)
                    if (pin == "111111") {
                        self.isOtpValid = true
                    } else {
                        print("Not Valid")
                        showingModal.toggle()
                    }
                }) {
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
        }
        .frame(width: UIScreen.main.bounds.width - 30)
        .background(Color.white)
        .cornerRadius(15)
        .shadow(radius: 30)
    }
    
    private var pinDots: some View {
        HStack {
            Spacer()
            ForEach(0..<maxDigits) { index in
                Image(systemName: self.getImageName(at: index))
                    .font(.system(size: 45, weight: .thin, design: .default))
                    .foregroundColor(Color(hex: "#232175"))
                    .background(Color.white)
            }
            Spacer()
        }
    }
    
    private var backgroundField: some View {
        let boundPin = Binding<String>(get: { self.pin }, set: { newValue in
            self.pin = newValue
        })
        
        return TextField("", text: boundPin)
           .accentColor(.clear)
           .foregroundColor(.clear)
           .keyboardType(.numberPad)
           .disabled(isDisabled)
    }
    
    private var showPinStack: some View {
        HStack {
            Spacer()
            if !pin.isEmpty {
                showPinButton
            }
        }
        .frame(height: 300)
        .padding([.trailing])
    }
    
    private var showPinButton: some View {
        Button(action: {
            self.showPin.toggle()
        }, label: {
            self.showPin ?
                Image(systemName: "eye.slash.fill").foregroundColor(.primary) :
                Image(systemName: "eye.fill").foregroundColor(.primary)
        })
    }
    
    private func getImageName(at index: Int) -> String {
        if index >= self.pin.count {
            return "square"
        }
        
        if self.showPin {
            return self.pin.digits[index].numberString + ".square"
        }
        
        return "square"
    }
    
    /*
     Fuction for Create Bottom Floater (Modal)
     */
    func createBottomFloater() -> some View {
        VStack(alignment: .leading) {
            Image(systemName: "xmark.octagon.fill")
                .resizable()
                .frame(width: 65, height: 65)
                .foregroundColor(.red)
                .padding(.top, 20)
            
            Text("Kode OTP Salah")
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                .font(.system(size: 22))
                .foregroundColor(Color(hex: "#232175"))
                .padding([.bottom, .top], 20)
            
            Text("Kode OTP yang anda masukan salah silahkan ulangi lagi")
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                .font(.system(size: 16))
                .foregroundColor(Color(hex: "#232175"))
                .padding(.bottom, 30)
            
            Button(action: {}) {
                Text("Kembali")
                    .foregroundColor(.white)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .font(.system(size: 12))
                    .frame(maxWidth: .infinity, minHeight: 40, maxHeight: 40)
            }
            .background(Color(hex: "#2334D0"))
            .cornerRadius(12)
            
            Text("")
        }
        .frame(width: UIScreen.main.bounds.width - 60)
        .padding(.horizontal, 15)
        .background(Color.white)
        .cornerRadius(20)
    }
}

extension String {
    var digits: [Int] {
        var result = [Int]()
        
        for char in self {
            if let number = Int(String(char)) {
                result.append(number)
            }
        }
        return result
    }
}

extension Int {
    var numberString: String {
        guard self < 10 else { return "0" }
        return String(self)
    }
}

#if DEBUG
struct OTPVerificationView_Previews: PreviewProvider {
    static var previews: some View {
        OTPVerificationView().environmentObject(RegistrasiModel())
    }
}
#endif
