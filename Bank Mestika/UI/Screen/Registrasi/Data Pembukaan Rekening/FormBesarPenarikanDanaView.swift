//
//  FormBesarPenarikanDanaView.swift
//  Bank Mestika
//
//  Created by Abdul R. Arraisi on 01/10/20.
//

import SwiftUI

struct FormBesarPerkiraanPenarikanView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        
        ZStack(alignment: .top) {
            
            Color(hex: "#232175")
            
            VStack {
                Spacer()
                RoundedRectangle(cornerRadius: 25, style: .continuous)
                    .fill(Color.white)
                    .frame(height: 450)
            }
            
            VStack {
                
                CustomNavigationBarView(presentationMode: _presentationMode)
                    .padding(.top, 45)
                    .padding(.horizontal, 30)
                
                ScrollView {
                    
                    // Title
                    Text("DATA PEMBUKAAN REKENEING")
                        .font(.title)
                        .bold()
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .padding(.vertical, 40)
                        .padding(.horizontal, 20)
                        .fixedSize(horizontal: false, vertical: true)
                    
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
                                
                                // Pages
                                HStack {
                                    
                                    Text("04")
                                        .font(Font.system(size: 15))
                                        .foregroundColor(Color(hex: "#232175"))
                                        .fontWeight(.semibold)
                                    
                                    Text(" / of 13 Forms")
                                        .font(Font.system(size: 15))
                                        .foregroundColor(Color(hex: "#232175"))
                                        .fontWeight(.regular)
                                    
                                    Spacer()
                                    
                                }
                                .padding(.leading, 20)
                                .padding(.top, 25)
                                
                                // Sub title
                                Text("Berapa Besar Perkiraan Penarikan Dana Anda Setiap Bulannya")
                                    .font(Font.system(size: 18))
                                    .foregroundColor(Color(hex: "#232175"))
                                    .fontWeight(.semibold)
                                    .multilineTextAlignment(.center)
                                    .padding(.horizontal, 40)
                                    .padding(.vertical, 20)
                                    .fixedSize(horizontal: false, vertical: true)
                                
                                // Forms input
                                ZStack {

                                    RadioButtonGroup(
                                        items: ["1", "2", "3"],
                                        labels: ["<= 30 Juta", "> 30 - 60 Juta", "> 60 Juta"],
                                        selectedId: "Besar Penarikan Dana") { selected in
                                        print("Selected is: \(selected)")
                                    }
                                    .padding()
                                    
                                }
                                .frame(width: UIScreen.main.bounds.width - 70)
                                .background(Color.white)
                                .cornerRadius(15)
                                .shadow(color: Color.gray, radius: 1, x: 0, y: 0)
                                
                                // Button
                                NavigationLink(destination: FormInformasiPerusahaanView()) {
                                    
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
                            .background(LinearGradient(gradient: Gradient(colors: [.white, Color(hex: "#D6DAF0")]), startPoint: .top, endPoint: .bottom))
                            .cornerRadius(25.0)
                            .shadow(color: Color(hex: "#D6DAF0"), radius: 5)
                            .padding(.horizontal, 20)
                            .padding(.top, 40)
                            
                        }
                        
                    }
                    
                }
                .padding(.bottom, 25)
                .KeyboardAwarePadding()
                
            }
            
        }
        .edgesIgnoringSafeArea(.all)
        .navigationBarHidden(true)
        
    }
}

struct FormBesarPenarikanDanaView_Previews: PreviewProvider {
    static var previews: some View {
        FormBesarPerkiraanPenarikanView()
    }
}
