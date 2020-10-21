//
//  DetailKartuATMView.swift
//  Bank Mestika
//
//  Created by Abdul R. Arraisi on 21/10/20.
//

import SwiftUI

struct DetailKartuATMView: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        VStack {
            AppBar
                .padding(.top, 45)
                .padding(.horizontal, 30)
            
            ScrollView {
                VStack(spacing: 25){
                    HStack {
                        Text("KARTU ATM ANDA \nAKAN SEGERA DIKIRIM")
                            .fontWeight(.bold)
                            .font(.system(size: 24))
                            .foregroundColor(Color(hex: "#2334D0"))
                            .kerning(2)
                            .fixedSize(horizontal: false, vertical: true)
                        Spacer()
                    }
                    
                    Image("atm_bromo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                    
                    HStack {
                        Text("Selamat data kartu ATM baru Anda telah berhasil disimpan.")
                            .foregroundColor(Color(hex: "#1D2238"))
                            .fontWeight(.regular)
                            .font(.system(size: 16))
                        Spacer()
                    }
                    
                    VStack {
                        HStack{
                            Text("Nama")
                                .foregroundColor(Color(hex: "#707070"))
                                .fontWeight(.regular)
                                .font(.system(size: 16))
                            
                            Spacer()
                            
                            TextField("Nama", text: Binding.constant("")) { (isChanged) in
                                
                            } onCommit: {
                                
                            }
                            .font(Font.system(size: 14))
                            .frame(width: 200, height: 36)
                            .padding(.horizontal)
                            .background(Color.gray.opacity(0.1))
                            .cornerRadius(10)
                        }
                        HStack{
                            Text("No. Kartu")
                                .foregroundColor(Color(hex: "#707070"))
                                .fontWeight(.regular)
                                .font(.system(size: 16))
                            
                            Spacer()
                            
                            TextField("No. Kartu", text: Binding.constant("")) { (isChanged) in
                                
                            } onCommit: {
                                
                            }
                            .font(Font.system(size: 14))
                            .frame(width: 200, height: 36)
                            .padding(.horizontal)
                            .background(Color.gray.opacity(0.1))
                            .cornerRadius(10)
                        }
                        HStack{
                            Text("Expired")
                                .foregroundColor(Color(hex: "#707070"))
                                .fontWeight(.regular)
                                .font(.system(size: 16))
                            
                            Spacer()
                            
                            TextField("Expired", text: Binding.constant("")) { (isChanged) in
                                
                            } onCommit: {
                                
                            }
                            .font(Font.system(size: 14))
                            .frame(width: 200, height: 36)
                            .padding(.horizontal)
                            .background(Color.gray.opacity(0.1))
                            .cornerRadius(10)
                        }
                    }
                    
                    HStack {
                        Text("Silahkan tunggu beberapa saat sampai kartu ATM Anda diterima.")
                            .foregroundColor(Color(hex: "#1D2238"))
                            .fontWeight(.regular)
                            .font(.system(size: 16))
                        Spacer()
                    }
                    
                    Spacer()
                    Button(action: {
                        
                    }, label: {
                        Text("KEMBALI KE HALAMAN UTAMA")
                            .foregroundColor(.white)
                            .fontWeight(.bold)
                            .font(.system(size: 14))
                            .frame(maxWidth: .infinity, maxHeight: 40)
                    })
                    .frame(height: 50)
                    .background(Color(hex: "#2334D0"))
                    .cornerRadius(12)
                }
                .padding(.horizontal, 25)
                .padding(.vertical, 25)
            }
        }
        .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
        .navigationBarHidden(true)
    }
    
    // MARK: - APP BAR
    var AppBar: some View {
        HStack {
            Button(action: {
                presentationMode.wrappedValue.dismiss()
            }) {
                Image(systemName: "arrow.left")
                    .foregroundColor(Color(hex: "#232175"))
            }
            Spacer()
            logo
            Spacer()
        }
    }
    
    // MARK: - LOGO
    var logo: some View {
        HStack(alignment: .center, spacing: .none) {
            Image("Logo M")
                .resizable()
                .frame(width: 25, height: 25)
            Text("BANK MESTIKA")
                .foregroundColor(Color(hex: "#232175"))
                .font(.system(size: 20))
                .bold()
        }
    }
}

struct DetailKartuATMView_Previews: PreviewProvider {
    static var previews: some View {
        DetailKartuATMView()
    }
}
