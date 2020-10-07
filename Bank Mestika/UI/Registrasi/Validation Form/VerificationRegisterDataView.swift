//
//  VerificationRegisterDataView.swift
//  Bank Mestika
//
//  Created by Prima Jatnika on 01/10/20.
//

import SwiftUI

struct VerificationRegisterDataView: View {
    
    @EnvironmentObject var registerData: RegistrasiModel
    
    @State var image: Image? = nil
    
    private func retrieveImage(forKey key: String) -> UIImage? {
        if let imageData = UserDefaults.standard.object(forKey: key) as? Data,
            let image = UIImage(data: imageData) {
            return image
        }
        
        return nil
    }
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var body: some View {
        ZStack(alignment: .top) {
            Color(hex: "#232175")
            
            VStack {
                Spacer()
                RoundedRectangle(cornerRadius: 25, style: .continuous)
                    .fill(Color.white)
                    .frame(height: UIScreen.main.bounds.height / 2.2)
                
            }
            
            VStack {
                appbar
                    .padding(.top, 45)
                    .padding(.horizontal, 30)
                
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
                    .padding(.top, 35)
                    .padding(.bottom, 35)
                }
                
                VStack {
                    NavigationLink(destination: SuccessRegisterView().environmentObject(registerData)) {
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
                .frame(width: 25, height: 25)
            Text("BANK MESTIKA")
                .foregroundColor(.white)
                .font(.system(size: 20))
                .bold()
        }
    }
    
    var cardForm: some View {
        VStack(alignment: .leading) {
            Group {
                LabelTextField(value: $registerData.nik, label: "KTP", placeHolder: "KTP")
                    .padding(.top, 20)
                    .disabled(/*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                
                LabelTextField(value: $registerData.noTelepon, label: "No. Telepon", placeHolder: "No. Telepon")
                    .padding(.top, 10)
                    .disabled(/*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                
                LabelTextField(value: $registerData.email, label: "Email", placeHolder: "Email")
                    .padding(.top, 10)
                    .disabled(/*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                
                VStack {
                    HStack {
                        Text("Foto KTP")
                            .font(.subheadline)
                            .foregroundColor(Color(hex: "#232175"))
                            .fontWeight(.bold)
                        Spacer()
                        
                        VStack {
                            self.registerData.fotoKTP
                                .resizable()
                                .frame(maxWidth: 80, maxHeight: 50)
                                .cornerRadius(8)
                        }
                        .frame(maxWidth: 80, minHeight: 50, maxHeight: 50)
                    }
                    
                    Divider()
                }
                .padding(.top, 20)
                .padding(.horizontal, 20)
                
                VStack {
                    HStack {
                        Text("Selfie")
                            .font(.subheadline)
                            .foregroundColor(Color(hex: "#232175"))
                            .fontWeight(.bold)
                        Spacer()
                        
                        VStack {
                            self.registerData.fotoSelfie
                                .resizable()
                                .frame(maxWidth: 80, maxHeight: 50)
                                .cornerRadius(8)
                        }
                        .frame(maxWidth: 80, minHeight: 50, maxHeight: 50)
                    }
                    Divider()
                }
                .padding(.top, 20)
                .padding(.horizontal, 20)
                
                VStack {
                    HStack {
                        Text("Tanda Tangan")
                            .font(.subheadline)
                            .foregroundColor(Color(hex: "#232175"))
                            .fontWeight(.bold)
                        Spacer()
                        
                        VStack {
                            self.registerData.fotoTandaTangan
                                .resizable()
                                .frame(maxWidth: 80, maxHeight: 50)
                                .cornerRadius(8)
                        }
                        .frame(maxWidth: 80, minHeight: 50, maxHeight: 50)
                    }
                    Divider()
                }
                .padding(.top, 20)
                .padding(.horizontal, 20)
                
                VStack {
                    HStack {
                        Text("NPWP")
                            .font(.subheadline)
                            .foregroundColor(Color(hex: "#232175"))
                            .fontWeight(.bold)
                        Spacer()
                        
                        VStack {
                            self.registerData.fotoNPWP
                                .resizable()
                                .frame(maxWidth: 80, maxHeight: 50)
                                .cornerRadius(8)
                        }
                        .frame(maxWidth: 80, minHeight: 50, maxHeight: 50)
                    }
                    Divider()
                }
                .padding([.top, .bottom], 20)
                .padding(.horizontal, 20)
                
                Group {
                    
                    Text("Tujuan Pembukaan Rekening")
                        .font(.caption)
                        .fontWeight(.semibold)
                        .foregroundColor(.gray)
                        .multilineTextAlignment(.leading)
                        .padding(.horizontal, 20)
                    
                    HStack {
                        TextField("Tujuan Pembukaan Rekening", text: $registerData.tujuanPembukaan)
                            .disabled(/*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                        
                        Divider()
                            .frame(height: 30)
                        
                        NavigationLink(destination: TujuanPembukaanRekeningView(editMode: .active).environmentObject(registerData)) {
                            Text("Edit").foregroundColor(.blue)
                        }
                    }
                    .frame(height: 20)
                    .font(.subheadline)
                    .padding()
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(15)
                    .padding(.horizontal, 20)
                    
                    Text("Sumber Dana")
                        .font(.caption)
                        .fontWeight(.semibold)
                        .foregroundColor(.gray)
                        .multilineTextAlignment(.leading)
                        .padding(.horizontal, 20)
                    
                    HStack {
                        TextField("Sumber Dana", text: $registerData.sumberDana)
                            .disabled(/*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                        
                        Divider()
                            .frame(height: 30)
                        
                        NavigationLink(destination: SumberDanaView(editMode: .active).environmentObject(registerData)) {
                            Text("Edit").foregroundColor(.blue)
                        }
                    }
                    .frame(height: 20)
                    .font(.subheadline)
                    .padding()
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(15)
                    .padding(.horizontal, 20)
                    
                    
                    Text("Perkiraan Penarikan")
                        .font(.caption)
                        .fontWeight(.semibold)
                        .foregroundColor(.gray)
                        .multilineTextAlignment(.leading)
                        .padding(.horizontal, 20)
                    
                    HStack {
                        TextField("Perkiraan Penarikan", text: $registerData.perkiraanPenarikan)
                            .disabled(/*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                        
                        Divider()
                            .frame(height: 30)
                        
                        NavigationLink(destination: PerkiraanPenarikanView(editMode: .active).environmentObject(registerData)) {
                            Text("Edit").foregroundColor(.blue)
                        }
                    }
                    .frame(height: 20)
                    .font(.subheadline)
                    .padding()
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(15)
                    .padding(.horizontal, 20)
                }
                
                Group {
                    Text("Besar Perkiraan Penarikan")
                        .font(.caption)
                        .fontWeight(.semibold)
                        .foregroundColor(.gray)
                        .multilineTextAlignment(.leading)
                        .padding(.horizontal, 20)
                    
                    HStack {
                        TextField("Besar Perkiraan Penarikan", text: $registerData.besarPerkiraanPenarikan)
                            .disabled(/*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                        
                        Divider()
                            .frame(height: 30)
                        
                        NavigationLink(destination: BesarPerkiraanPenarikanView(editMode: .active).environmentObject(registerData)) {
                            Text("Edit").foregroundColor(.blue)
                        }
                    }
                    .frame(height: 20)
                    .font(.subheadline)
                    .padding()
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(15)
                    .padding(.horizontal, 20)
                    
                    Text("Perkiraan Setoran")
                        .font(.caption)
                        .fontWeight(.semibold)
                        .foregroundColor(.gray)
                        .multilineTextAlignment(.leading)
                        .padding(.horizontal, 20)
                    
                    HStack {
                        TextField("Perkiraan Setoran", text: $registerData.perkiraanSetoran)
                            .disabled(/*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                        
                        Divider()
                            .frame(height: 30)
                        
                        NavigationLink(destination: PerkiraanSetoranView(editMode: .active).environmentObject(registerData)) {
                            Text("Edit").foregroundColor(.blue)
                        }
                    }
                    .frame(height: 20)
                    .font(.subheadline)
                    .padding()
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(15)
                    .padding(.horizontal, 20)
                    
                    Text("Besar Perkiraan Setoran")
                        .font(.caption)
                        .fontWeight(.semibold)
                        .foregroundColor(.gray)
                        .multilineTextAlignment(.leading)
                        .padding(.horizontal, 20)
                    
                    HStack {
                        TextField("Besar Perkiraan Setoran", text: $registerData.besarPerkiraanPenarikan)
                            .disabled(/*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                        
                        Divider()
                            .frame(height: 30)
                        
                        NavigationLink(destination: BesarPerkiraanSetoranView(editMode: .active).environmentObject(registerData)) {
                            Text("Edit").foregroundColor(.blue)
                        }
                    }
                    .frame(height: 20)
                    .font(.subheadline)
                    .padding()
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(15)
                    .padding(.horizontal, 20)
                    
                    Text("Pekerjaan")
                        .font(.caption)
                        .fontWeight(.semibold)
                        .foregroundColor(.gray)
                        .multilineTextAlignment(.leading)
                        .padding(.horizontal, 20)
                    
                    HStack {
                        TextField("Pekerjaan", text: $registerData.pekerjaan)
                            .disabled(/*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                        
                        Divider()
                            .frame(height: 30)
                        
                        NavigationLink(destination: PerkerjaanView(editMode: .active).environmentObject(registerData)) {
                            Text("Edit").foregroundColor(.blue)
                        }
                    }
                    .frame(height: 20)
                    .font(.subheadline)
                    .padding()
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(15)
                    .padding(.horizontal, 20)
                    .padding(.bottom, 20)
                }
            }
            Spacer()
        }
        .frame(minWidth: UIScreen.main.bounds.width - 30, maxWidth: UIScreen.main.bounds.width - 30, maxHeight: .infinity)
        .background(Color.white)
        .cornerRadius(15)
        .shadow(radius: 30)
    }
}

struct VerificationRegisterDataView_Previews: PreviewProvider {
    static var previews: some View {
        VerificationRegisterDataView()
    }
}
