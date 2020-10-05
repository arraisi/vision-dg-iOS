//
//  FormInformasiPerusahaanView.swift
//  Bank Mestika
//
//  Created by Abdul R. Arraisi on 28/09/20.
//

import SwiftUI

struct FormInformasiPerusahaanView: View {
    
    @State var namaPerusahaan: String = ""
    @State var alamatPerusahaan: String = ""
    @State var kelurahan: String = ""
    @State var noTlpPerusahaan: String = ""
    
    
    @State var kodePos : String? = nil
    @State var arrkodePos = ["140256","140216","140216","140216","140216","140216"]
    @State var selectionkodePosIndex = 0
    
    @State var kecamatan : String? = nil
    @State var arrKecamatan = ["Rancasari","Antapani","Gede Bage","Cililin","Batujajar","Cimahi"]
    @State var selectionKecamatanIndex = 0
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
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
                
                Spacer()
                
                CustomNavigationBarView(presentationMode: _presentationMode)
                    .padding(.top, 45)
                    .padding(.horizontal, 30)
                
                ScrollView {
                    
                    // Title
                    Text("DATA PEMBUKAAN REKENING")
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
                                    
                                    Text("08")
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
                                Text("Masukan Informasi Perusahaan")
                                    .font(Font.system(size: 18))
                                    .foregroundColor(Color(hex: "#232175"))
                                    .fontWeight(.semibold)
                                    .padding(.horizontal, 20)
                                    .padding(.vertical, 20)
                                
                                // Forms input
                                ZStack {
                                    cardForm
                                        .padding(.vertical, 20)
                                    
                                }
                                .frame(width: UIScreen.main.bounds.width - 70)
                                .background(Color.white)
                                .cornerRadius(15)
                                .shadow(color: Color.gray, radius: 1, x: 0, y: 0)
                                
                               
                                NavigationLink(destination: VerificationAddressView(), label:{
                                    
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
        
    }
    
    var cardForm: some View {
        
        VStack(alignment: .leading) {
            
            LabelTextField(value: $namaPerusahaan, label: "Nama Perusahaan", placeHolder: "Nama Perusahaan")
            
            LabelTextField(value: $alamatPerusahaan, label: "Alamat Perusahaan", placeHolder: "Alamat Perusahaan")
            
            Group {
                
                Text("Kode Pos")
                    .font(.caption)
                    .fontWeight(.semibold)
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.leading)
                    .padding(.horizontal, 20)
                
                TextFieldWithPickerAsInputView(data: self.arrkodePos, placeholder: "Pilih Kode Pos", selectionIndex: self.$selectionkodePosIndex, text: self.$kodePos)
                    .frame(height: 10)
                    .font(.subheadline)
                    .padding()
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(15)
                    .padding(.horizontal, 20)
                
            }
            
            Group {
                
                Text("Kecamatan")
                    .font(.caption)
                    .fontWeight(.semibold)
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.leading)
                    .padding(.horizontal, 20)
                
                TextFieldWithPickerAsInputView(data: self.arrKecamatan, placeholder: "Pilih Kecamatan", selectionIndex: self.$selectionKecamatanIndex, text: self.$kecamatan)
                    .frame(height: 10)
                    .font(.subheadline)
                    .padding()
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(15)
                    .padding(.horizontal, 20)
                
            }
            
            Group {
                
                Text("No. Telepon Perusahaan")
                    .font(.caption)
                    .fontWeight(.semibold)
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.leading)
                    .padding(.horizontal, 20)
                
                HStack {
                    
                    Text("+62 ").foregroundColor(.gray)
                    
                    Divider()
                        .frame(height: 30)
                    
                    TextField("No. Telepon", text: $noTlpPerusahaan)
                        .keyboardType(.numberPad)
                    
                }
                .frame(height: 10)
                .font(.subheadline)
                .padding()
                .background(Color.gray.opacity(0.1))
                .cornerRadius(15)
                .padding(.horizontal, 20)
                
            }
            
        }
    }
    
}

struct FormInformasiPerusahaanView_Previews: PreviewProvider {
    static var previews: some View {
        FormInformasiPerusahaanView()
    }
}
