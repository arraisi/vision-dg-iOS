//
//  FormTujuanPembukaanRekeningView.swift
//  Bank Mestika
//
//  Created by Abdul R. Arraisi on 01/10/20.
//

import SwiftUI

struct FormTujuanPembukaanRekeningView: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @State var tujuanPembukaanRekeningId: String?
    
    @State var isChecked:Bool = false
    
    @State var selectedOptions: [Int] = []
    
    var body: some View {
        
        ZStack(alignment: .top) {
            
            Color(hex: "#232175")
            
            VStack {
                Spacer()
                Rectangle()
                    .fill(Color.white)
                    .frame(height: UIScreen.main.bounds.height / 2)
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
                        .fontWeight(.black)
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .padding(.vertical, 30)
                        .padding(.horizontal, 30)
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
                                    
                                    Text("01")
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
                                Text("Tujuan Pembukaan Rekening")
                                    .font(Font.system(size: 18))
                                    .foregroundColor(Color(hex: "#232175"))
                                    .fontWeight(.semibold)
                                    .padding(.horizontal, 20)
                                    .padding(.vertical, 20)
                                
                                // Forms input
                                ZStack {
                                    
                                    CheckBoxGroup(id: [1, 2, 3, 4], markedId: $selectedOptions, labels: [
                                        "Pinjaman / Angsuran Kredit",
                                        "Keperluan Usaha", "Keperluan Sehari - hari", "Simpanan"
                                    ]) { data, marked  in
                                        
                                        print(data)
                                        print(marked)
                                    }
                                    .padding()
                                    
                                }
                                .frame(width: UIScreen.main.bounds.width - 70)
                                .background(Color.white)
                                .cornerRadius(15)
                                .shadow(color: Color.gray, radius: 1, x: 0, y: 0)
                                
                                // Button
                                NavigationLink(destination: FormSumberDanaView()) {
                                    
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
                    .padding(.bottom, 0.1)
                    .padding(.bottom, 25)
                    
                }
                .KeyboardAwarePadding()
                
            }
            
        }
        .edgesIgnoringSafeArea(.all)
        .navigationBarHidden(true)
        
    }
}

struct FormTujuanPembukaanRekeningView_Previews: PreviewProvider {
    static var previews: some View {
        FormTujuanPembukaanRekeningView()
    }
}
