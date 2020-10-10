//
//  FormPerkerjaan.swift
//  Bank Mestika
//
//  Created by Abdul R. Arraisi on 01/10/20.
//

import SwiftUI

struct PerkerjaanView: View {
    @EnvironmentObject var registerData: RegistrasiModel
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @State var pekerjaanId: Int?
    @State var editMode: EditMode = .inactive
    
    var pekerjaan = [
        1: "Pejabat Pemerintah",
        2: "Parpol",
        3: "Pegawai Swasta",
        4: "Wirausaha",
        5: "Pegawai Negeri",
        6: "Pegawai BUMN / BUMD",
        7: "Polisi",
        8: "Militer",
        9: "Pensiunan"]
    
    var body: some View {
        
        ZStack(alignment: .top) {
            
            Color(hex: "#232175")
            
            VStack {
                Spacer()
                Rectangle()
                    .fill(Color.white)
                    .frame(height: 42 / 100 * UIScreen.main.bounds.height)
                    .cornerRadius(radius: 25.0, corners: .topLeft)
                    .cornerRadius(radius: 25.0, corners: .topRight)
            }
            
            VStack {
                ScrollView {
                    
                    // Title
                    Text("DATA PEMBUKAAN REKENING")
                        .font(Font.system(size: 24))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .padding(.top, 85)
                        .padding(.bottom, 30)
                        .padding(.horizontal, 30)
                    
                    // Content
                    ZStack {
                        
                        // Forms
                        ZStack {
                            
                            VStack{
                                LinearGradient(gradient: Gradient(colors: [.white, Color(hex: "#D6DAF0")]), startPoint: .top, endPoint: .bottom)
                            }
                            .cornerRadius(25.0)
                            .padding(.horizontal, 60)
                            
                            VStack{
                                LinearGradient(gradient: Gradient(colors: [.white, Color(hex: "#D6DAF0")]), startPoint: .top, endPoint: .bottom)
                            }
                            .cornerRadius(25.0)
                            .shadow(color: Color(hex: "#2334D0").opacity(0.2), radius: 5, y: -2)
                            .padding(.horizontal, 40)
                            .padding(.top, 10)
                            
                            VStack {
                                
                                Spacer()
                                
                                // Sub title
                                Text("Apa Pekerjaan Anda")
                                    .font(Font.system(size: 18))
                                    .foregroundColor(Color(hex: "#232175"))
                                    .fontWeight(.semibold)
                                    .multilineTextAlignment(.center)
                                    .padding(.horizontal, 40)
                                    .padding(.vertical, 30)
                                
                                // Forms input
                                ZStack {
                                    
                                    RadioButtonGroup(
                                        items: Array(pekerjaan.keys),
                                        labels:Array(pekerjaan.values),
                                        selectedId: $pekerjaanId) { selected in
                                        
                                        registerData.pekerjaan = pekerjaan[pekerjaanId ?? 0] ?? ""
                                        
                                    }
                                    .padding()
                                    
                                }
                                .frame(width: UIScreen.main.bounds.width - 70)
                                .background(Color.white)
                                .cornerRadius(15)
                                .shadow(color: Color.gray, radius: 1, x: 0, y: 0)
                                
                                // Button
                                if (editMode == .inactive) {
                                    if pekerjaanId == 9 {
                                        NavigationLink(destination: SumberPenyandangDanaView().environmentObject(registerData)) {
                                            
                                            Text("Berikutnya")
                                                .foregroundColor(.white)
                                                .fontWeight(.bold)
                                                .font(.system(size: 14))
                                                .frame(maxWidth: .infinity, maxHeight: 40)
                                            
                                        }
                                        .frame(height: 50)
                                        .background(Color(hex: "#2334D0"))
                                        .cornerRadius(12)
                                        .padding(.horizontal, 35)
                                        .padding(.vertical, 20)
                                    } else {
                                        NavigationLink(destination: InformasiPerusahaanView().environmentObject(registerData)) {
                                            
                                            Text("Berikutnya")
                                                .foregroundColor(.white)
                                                .fontWeight(.bold)
                                                .font(.system(size: 14))
                                                .frame(maxWidth: .infinity, maxHeight: 40)
                                            
                                        }
                                        .frame(height: 50)
                                        .background(Color(hex: "#2334D0"))
                                        .cornerRadius(12)
                                        .padding(.horizontal, 35)
                                        .padding(.vertical, 20)
                                    }
                                    
                                } else {
                                    NavigationLink(destination: VerificationRegisterDataView().environmentObject(registerData)) {
                                        
                                        Text("Simpan")
                                            .foregroundColor(.white)
                                            .fontWeight(.bold)
                                            .font(.system(size: 14))
                                            .frame(maxWidth: .infinity, maxHeight: 40)
                                        
                                    }
                                    .frame(height: 50)
                                    .background(Color(hex: "#2334D0"))
                                    .cornerRadius(12)
                                    .padding(.horizontal, 35)
                                    .padding(.vertical, 20)
                                }
                                
                            }
                            .background(LinearGradient(gradient: Gradient(colors: [.white, Color(hex: "#D6DAF0")]), startPoint: .top, endPoint: .bottom))
                            .cornerRadius(25.0)
                            .shadow(color: Color(hex: "#2334D0").opacity(0.2), radius: 10, y: -2)
                            .padding(.horizontal, 20)
                            .padding(.top, 25)
                            
                        }
                        
                    }
                    .padding(.bottom, 25)
                    
                }
                .padding(.bottom, 0.1)
                .KeyboardAwarePadding()
                
            }
            
        }
        .edgesIgnoringSafeArea(.all)
        .navigationBarTitle("BANK MESTIKA", displayMode: .inline)
        
    }
}

struct FormPerkerjaan_Previews: PreviewProvider {
    static var previews: some View {
        PerkerjaanView()
    }
}
