//
//  FormPINView.swift
//  Bank Mestika
//
//  Created by Prima Jatnika on 04/10/20.
//

import SwiftUI

struct PINView: View {
    @EnvironmentObject var registerData: RegistrasiModel
    @State private var numberOfCells: Int = 6
    @State private var currentlySelectedCell = 0
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
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
                        .padding(.top, 30)
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
                            .shadow(color: Color(hex: "#D6DAF0"), radius: 5)
                            .padding(.horizontal, 60)
                            
                            VStack{
                                LinearGradient(gradient: Gradient(colors: [.white, Color(hex: "#D6DAF0")]), startPoint: .top, endPoint: .bottom)
                            }
                            .cornerRadius(25.0)
                            .shadow(color: Color(hex: "#D6DAF0"), radius: 5)
                            .padding(.horizontal, 40)
                            .padding(.top, 15)
                            
                            VStack {
                                Spacer()
                                
                                // Sub title
                                Text("Masukan PIN Transaksi Baru Anda")
                                    .font(Font.system(size: 18))
                                    .foregroundColor(Color(hex: "#232175"))
                                    .fontWeight(.semibold)
                                    .multilineTextAlignment(.center)
                                    .padding(.horizontal, 20)
                                    .padding(.top, 20)
                                
                                Text("Pin ini digunakan untuk setiap kegiatan transaksi keuangan")
                                    .font(.caption2)
                                    .multilineTextAlignment(.center)
                                    .padding(.horizontal, 20)
                                    .padding(.top, 3)
                                    .padding(.bottom, 20)
                                
                                // Forms input
                                HStack {
                                    ForEach(0 ..< self.numberOfCells) { index in
                                        CharacterInputCell(currentlySelectedCell: self.$currentlySelectedCell, index: index)
                                    }
                                }
                                .lineSpacing(10)
                                .padding(.vertical, 20)
                                
                               
                                NavigationLink(destination: VerifikasiPINView().environmentObject(registerData), label:{
                                    
                                    Text("Konfirmasi PIN Transaksi")
                                        .foregroundColor(.white)
                                        .fontWeight(.bold)
                                        .font(.system(size: 14))
                                        .frame(maxWidth: .infinity, maxHeight: 40)
                                    
                                })
                                .frame(height: 50)
                                .background(Color(hex: "#2334D0"))
                                .cornerRadius(12)
                                .padding(.horizontal, 35)
                                .padding(.vertical, 20)
                                
                            }
                            .background(LinearGradient(gradient: Gradient(colors: [.white, Color(hex: "#D6DAF0")]), startPoint: .top, endPoint: .bottom))
                            .cornerRadius(25.0)
                            .shadow(color: Color(hex: "#D6DAF0"), radius: 5)
                            .padding(.horizontal, 20)
                            .padding(.top, 40)
                            
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
        .onTapGesture() {
            UIApplication.shared.endEditing()
        }
        
    }
}

#if DEBUG
struct PINView_Previews: PreviewProvider {
    static var previews: some View {
        PINView().environmentObject(RegistrasiModel())
    }
}
#endif
