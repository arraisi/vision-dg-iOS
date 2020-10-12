//
//  VerificationAddressView.swift
//  Bank Mestika
//
//  Created by Prima Jatnika on 30/09/20.
//

import SwiftUI

struct VerificationAddressView: View {
    
    @EnvironmentObject var registerData: RegistrasiModel
    
    @State var selected: Int = 1
    @State var alamat: String = ""
    @State var verificationAddressId: Int?
    
    let verificationAddress: [MasterModel] = load("verificationAddress.json")
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var body: some View {
        ZStack(alignment: .top) {
            Image("bg_splash")
                .resizable()
            
            VStack {
                ScrollView {
                    VStack {
                        Text("PASTIKAN INFORMASI ANDA BENAR")
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
                    .padding(.top, 85)
                }
                
                VStack {
                    NavigationLink(destination: PasswordView().environmentObject(registerData)) {
                        Text("Submit Data")
                            .foregroundColor(.white)
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                            .font(.system(size: 13))
                            .frame(maxWidth: .infinity, minHeight: 40, maxHeight: 40)
                    }
                    .background(Color(hex: "#2334D0"))
                    .cornerRadius(12)
                    .padding(.horizontal, 100)
                    .padding(.top, 10)
                    .padding(.bottom, 20)
                }
                .background(Color.white)
            }
        }
        .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
        .navigationBarTitle("BANK MESTIKA", displayMode: .inline)
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
            Text("Apakah Alamat Surat Menyurat Anda adalah dibawah ini?")
                .font(.title2)
                .foregroundColor(Color(hex: "#232175"))
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
                .padding(.top, 20)
                .padding(.horizontal, 20)
            
            ZStack {

                RadioButtonGroup(
                    items: verificationAddress,
                    selectedId: $verificationAddressId) { selected in
                    print("Selected is: \(selected)")
                    self.selected = selected
                }
                .padding(.horizontal, 20)
                .padding(.top, 15)
                .padding(.bottom, 20)
                
            }
            
            if (selected == 1) {
                Group {
                    Divider()
                        .padding(.horizontal, 20)
                    
                    LabelTextField(value: $registerData.alamatPerusahaan, label: "Alamat", placeHolder: "Alamat")
                        .padding(.horizontal, 20)
                    
                    LabelTextField(value: $registerData.rtrw, label: "RT/RW", placeHolder: "RT/RW")
                        .padding(.horizontal, 20)
                    
                    LabelTextField(value: $registerData.kelurahan, label: "Kelurahan", placeHolder: "Kelurahan")
                        .padding(.horizontal, 20)
                    
                    LabelTextField(value: $registerData.kecamatan, label: "Kecamatan", placeHolder: "Kecamatan")
                        .padding(.horizontal, 20)
                    
                    LabelTextField(value: $registerData.kodePos, label: "Kode Pos", placeHolder: "Kode Pos")
                        .padding(.horizontal, 20)
                        .padding(.bottom, 20)
                }
            } else {
                EmptyView()
            }
        
        }
        .frame(width: UIScreen.main.bounds.width - 30)
        .background(Color.white)
        .cornerRadius(15)
        .shadow(radius: 30)
    }
}

struct VerificationAddressView_Previews: PreviewProvider {
    static var previews: some View {
        VerificationAddressView()
    }
}
