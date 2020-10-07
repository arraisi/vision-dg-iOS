//
//  FormSumberDanaView.swift
//  Bank Mestika
//
//  Created by Abdul R. Arraisi on 01/10/20.
//

import SwiftUI

struct SumberDanaView: View {
    @EnvironmentObject var registerData: RegistrasiModel
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @State var sumberDanaId: String?
    @State var editMode: EditMode = .inactive
    
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
                
                CustomNavigationBarView(presentationMode: _presentationMode)
                    .padding(.top, 45)
                    .padding(.horizontal, 30)
                
                ScrollView {
                    
                    // Title
                    Text("DATA PEMBUKAAN REKENING")
                        .font(Font.system(size: 24))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .padding(.vertical, 30)
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
                                Text("Pilih Sumber Dana Kamu")
                                    .font(Font.system(size: 18))
                                    .foregroundColor(Color(hex: "#232175"))
                                    .fontWeight(.semibold)
                                    .padding(.horizontal, 20)
                                    .padding(.vertical, 30)
                                
                                // Forms input
                                ZStack {
                                    
                                    RadioButtonGroup(
                                        items: ["1", "2", "3", "4", "5"],
                                        labels: ["Gaji", "Hibah / Warisan / Orang Tua", "Jual Harta", "Hasil Usaha", "Pencarian Pinjaman"],
                                        selectedId: $sumberDanaId) { selected in
                                        print("Selected is: \(selected)")
                                    }
                                    .padding()
                                    
                                }
                                .frame(width: UIScreen.main.bounds.width - 70)
                                .background(Color.white)
                                .cornerRadius(15)
                                .shadow(color: Color.gray, radius: 1, x: 0, y: 0)
                                
                                // Button
                                if (editMode == .inactive) {
                                    NavigationLink(destination: PerkiraanPenarikanView().environmentObject(registerData)) {
                                        
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
        .navigationBarHidden(true)
        
    }
    
}

struct FormSumberDanaView_Previews: PreviewProvider {
    static var previews: some View {
        SumberDanaView()
    }
}
