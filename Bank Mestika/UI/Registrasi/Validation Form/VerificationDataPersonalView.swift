//
//  VerificationDataPersonalView.swift
//  Bank Mestika
//
//  Created by Prima Jatnika on 30/09/20.
//

import SwiftUI

struct VerificationDataPersonalView: View {
    
    @State var jenisTabungan: String = ""
    @State var tujuanPembukaanRekening: String = ""
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var body: some View {
        ZStack(alignment: .top) {
            VStack {
                Color(hex: "#232175")
                    .frame(height: 300)
                Color(hex: "#F6F8FB")
            }
            
            ScrollView {
                VStack {
                    cardForm
                    Spacer()
                }
                .padding(.horizontal, 30)
                .padding(.top, 85)
                .padding(.bottom, 35)
            }
        }
        .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
        .navigationBarTitle("BANK MESTIKA", displayMode: .inline)
    }
    
    var cardForm: some View {
        VStack(alignment: .leading) {
            Image("ic_highfive")
                .resizable()
                .frame(width: 95, height: 95)
                .padding(.top, 40)
                .padding(.horizontal, 20)
        
            HStack {
                Text("Hi, ")
                    .font(.title)
                    .foregroundColor(Color(hex: "#232175"))
                    .fontWeight(.bold)
                    .padding([.top, .bottom], 20)
                    .padding(.leading, 20)
                    .fixedSize(horizontal: false, vertical: true)
                
                Text("Template")
                    .font(.title)
                    .foregroundColor(Color(hex: "#2334D0"))
                    .fontWeight(.bold)
                    .padding([.top, .bottom], 20)
                    .padding(.trailing, 20)
                    .fixedSize(horizontal: false, vertical: true)
            }
            
            VStack(alignment: .leading) {
                Text("Anda telah memilih mendaftar jenis tabungan")
                    .font(.subheadline)
                    .foregroundColor(Color(hex: "#707070"))
                    .multilineTextAlignment(.leading)
                    .padding(.top, 5)
                    .padding(.horizontal, 20)
                
                Text("Deposit Tabungan.")
                    .font(.subheadline)
                    .bold()
                    .foregroundColor(Color(hex: "#2334D0"))
                    .multilineTextAlignment(.leading)
                    .padding(.horizontal, 20)
            }
            
            Text("Sebelum melanjutkan proses pendaftaran, silahkan terlebih dahulu memverifikasi data yang telah Anda Isi.")
                .font(.subheadline)
                .foregroundColor(Color(hex: "#707070"))
                .multilineTextAlignment(.leading)
                .padding(.top, 15)
                .padding(.horizontal, 20)
            
            Divider()
                .padding(.horizontal, 20)
                .padding(.bottom, 10)
            
            Group {
                LabelTextField(value: $jenisTabungan, label: "Jenis Tabungan", placeHolder: "Jenis Tabungan")
                
                LabelTextField(value: $tujuanPembukaanRekening, label: "Tujuan Pembukaan Rekening", placeHolder: "Tujuan Pembukaan Rekening")
                
                LabelTextField(value: $tujuanPembukaanRekening, label: "Sumber Dana", placeHolder: "Sumber Dana")
                
                LabelTextField(value: $tujuanPembukaanRekening, label: "Pekerjaan", placeHolder: "Pekerjaan")
                
                LabelTextField(value: $tujuanPembukaanRekening, label: "Jabatan", placeHolder: "Jabatan")
                
                LabelTextField(value: $tujuanPembukaanRekening, label: "Nama Perusahaan", placeHolder: "Nama Perusahaan")
                
                LabelTextField(value: $tujuanPembukaanRekening, label: "Alamat Perusahaan", placeHolder: "Alamat Perusahaan")
                
                LabelTextField(value: $tujuanPembukaanRekening, label: "Kecamatan Perusahaan", placeHolder: "Kecamatan Perusahaan")
                
                LabelTextField(value: $tujuanPembukaanRekening, label: "Kelurahan Perusahaan", placeHolder: "Kelurahan Perusahaan")
                
                LabelTextField(value: $tujuanPembukaanRekening, label: "Kode Pos Perusahaan", placeHolder: "Kode Pos Perusahaan")
            }
            
            Group {
                LabelTextField(value: $tujuanPembukaanRekening, label: "No. Perusahaan", placeHolder: "No. Perusahaan")
                
                LabelTextField(value: $tujuanPembukaanRekening, label: "Bidang Usaha", placeHolder: "Bidang Usaha")
                
                LabelTextField(value: $tujuanPembukaanRekening, label: "Penghasilan", placeHolder: "Penghasilan")
            }
            
            HStack {
                NavigationLink(destination : VerificationAddressView()) {
                    Text("Data Valid")
                        .foregroundColor(.white)
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .font(.system(size: 13))
                        .frame(maxWidth: .infinity, maxHeight: 40)
                    
                }
                .frame(height: 40)
                .background(Color(hex: "#2334D0"))
                .cornerRadius(12)
                .padding(.leading, 20)
                .padding(.trailing, 5)
                .padding(.vertical, 20)
                
                Button(action : {}) {
                    Text("Tidak Valid")
                        .foregroundColor(.white)
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .font(.system(size: 13))
                        .frame(maxWidth: .infinity, maxHeight: 40)
                    
                }
                .frame(height: 40)
                .background(Color(hex: "#707070"))
                .cornerRadius(12)
                .padding(.trailing, 20)
                .padding(.leading, 5)
                .padding(.vertical, 20)
            }
            
            Spacer()
        }
        .frame(minWidth: UIScreen.main.bounds.width - 30, maxWidth: UIScreen.main.bounds.width - 30, maxHeight: .infinity)
        .background(Color.white)
        .cornerRadius(15)
        .shadow(radius: 30)
    }
}

struct VerificationDataPersonalView_Previews: PreviewProvider {
    static var previews: some View {
        VerificationDataPersonalView()
    }
}
