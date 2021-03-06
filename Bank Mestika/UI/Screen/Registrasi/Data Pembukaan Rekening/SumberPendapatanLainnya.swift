//
//  SumberPendapatanLainnya.swift
//  Bank Mestika
//
//  Created by Abdul R. Arraisi on 06/10/20.
//

import SwiftUI

struct SumberPendapatanLainnyaView: View {
    
    @EnvironmentObject var registerData: RegistrasiModel
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @State var sumberPendapatanLainnyaId: Int?
    
    var sumberPendapatanLainnya = [1:"Ya, Saya memiliki", 2:"Tidak, Saya tidak memiliki"]
    
    var body: some View {
        ZStack {
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
                                Text("Apakah Anda Memiliki Sumber Pendapatan Lainnya")
                                    .font(Font.system(size: 18))
                                    .foregroundColor(Color(hex: "#232175"))
                                    .fontWeight(.semibold)
                                    .multilineTextAlignment(.center)
                                    .padding(.horizontal, 20)
                                    .padding(.vertical, 30)
                                
                                //                                // Forms input
                                ZStack {
                                    
                                    RadioButtonGroup(
                                        items: Array(sumberPendapatanLainnya.keys),
                                        labels: Array(sumberPendapatanLainnya.values),
                                        selectedId: $sumberPendapatanLainnyaId) { selected in
                                        print("Selected is: \(selected)")
                                        
                                        registerData.sumberPendapatanLainnya = sumberPendapatanLainnya[sumberPendapatanLainnyaId ?? 0] ?? ""
                                    }
                                    .padding()
                                    
                                }
                                .frame(width: UIScreen.main.bounds.width - 70)
                                .background(Color.white)
                                .cornerRadius(15)
                                .shadow(color: Color.gray, radius: 1, x: 0, y: 0)
                                
                                // Button
                                NavigationLink(destination: VerificationAddressView().environmentObject(registerData), label:{
                                    
                                    Text("Berikutnya")
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
                            .shadow(color: Color(hex: "#2334D0").opacity(0.2), radius: 10, y: -2)
                            .padding(.horizontal, 20)
                            .padding(.top, 25)
                        }
                    }
                }
            }
        }
        .edgesIgnoringSafeArea(.all)
        .navigationBarHidden(true)
    }
}

struct SumberPendapatanLainnya_Previews: PreviewProvider {
    static var previews: some View {
        SumberPendapatanLainnyaView()
    }
}
