//
//  FormInformasiPerusahaanView.swift
//  Bank Mestika
//
//  Created by Abdul R. Arraisi on 28/09/20.
//

import SwiftUI

struct InformasiPerusahaanView: View {
    
    @EnvironmentObject var registerData: RegistrasiModel
    
    @State var namaPerusahaan: String = ""
    @State var alamatPerusahaan: String = ""
    @State var kelurahan: String = ""
    @State var noTlpPerusahaan: String = ""
    @State var kodePos : String = ""
    @State var kecamatan : String = ""
    @State var location : String = ""
    
    let cities:[String] = ["Jakarta", "Bogor", "Depok", "Bandung"]
    
    /*
     Boolean for Show Modal
     */
    @State var showingModal = false
    
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
                                Text("Masukan Informasi Perusahaan")
                                    .font(Font.system(size: 18))
                                    .foregroundColor(Color(hex: "#232175"))
                                    .fontWeight(.semibold)
                                    .padding(.horizontal, 20)
                                    .padding(.vertical, 30)
                                
                                // Forms input
                                ZStack {
                                    cardForm
                                        .padding(.vertical, 20)
                                    
                                }
                                .frame(width: UIScreen.main.bounds.width - 70)
                                .background(Color.white)
                                .cornerRadius(15)
                                .shadow(color: Color.gray, radius: 1, x: 0, y: 0)
                                
                                
                                NavigationLink(destination: PenghasilanKotorView().environmentObject(registerData), label:{
                                    
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
                    .padding(.bottom, 25)
                    
                }
                .padding(.bottom, 0.1)
                .KeyboardAwarePadding()
                
                
            }
            
            // Background Color When Modal Showing
            if self.showingModal {
                ModalOverlay(tapAction: { withAnimation { self.showingModal = false } })
            }
        }
        .popup(isPresented: $showingModal, type: .default, position: .bottom, animation: Animation.spring(), closeOnTap: false, closeOnTapOutside: true) {
            createBottomFloater()
        }
        .edgesIgnoringSafeArea(.all)
        .navigationBarTitle("BANK MESTIKA", displayMode: .inline)
        
    }
    
    // MARK: - Form Group
    
    var cardForm: some View {
        
        VStack(alignment: .leading) {
            
            LabelTextField(value: $namaPerusahaan, label: "Nama Perusahaan", placeHolder: "Nama Perusahaan")
                .padding(.horizontal, 20)
            
            Group {
                
                Text("Alamat Perusahaan")
                    .font(Font.system(size: 10))
                    .fontWeight(.semibold)
                    .foregroundColor(Color(hex: "#707070"))
                    .multilineTextAlignment(.leading)
                
                HStack {
                    
                    TextField("Alamat Perusahaan", text: $alamatPerusahaan)
                        .font(Font.system(size: 14))
                        .frame(height: 36)
                    
                    Button(action:{
                        showingModal.toggle()
                    }, label: {
                        Image(systemName: "location.viewfinder")
                            .font(Font.system(size: 20))
                            .foregroundColor(Color(hex: "#707070"))
                    })
                    
                }
                .padding(.horizontal)
                .background(Color.gray.opacity(0.1))
                .cornerRadius(10)
                
            }
            .padding(.horizontal, 20)
            
            LabelTextField(value: $kodePos, label: "Kode Pos", placeHolder: "Kode Pos")
                .padding(.horizontal, 20)
            
            LabelTextField(value: $kecamatan, label: "Kecamatan", placeHolder: "Kecamatan")
                .padding(.horizontal, 20)
            
            Group {
                
                Text("No. Telepon Perusahaan")
                    .font(Font.system(size: 10))
                    .fontWeight(.semibold)
                    .foregroundColor(Color(hex: "#707070"))
                    .multilineTextAlignment(.leading)
                
                HStack {
                    
                    Text("+62 ")
                        .font(Font.system(size: 14))
                        .fontWeight(.semibold)
                        .foregroundColor(Color(hex: "#707070"))
                    
                    Divider()
                        .frame(height: 30)
                    
                    TextField("No. Telepon", text: $noTlpPerusahaan)
                        .keyboardType(.numberPad)
                        .font(Font.system(size: 14))
                        .frame(height: 36)
                }
                .padding(.horizontal)
                .background(Color.gray.opacity(0.1))
                .cornerRadius(10)
                
            }
            .padding(.horizontal, 20)
            
        }
    }
    
    // MARK: -Fuction for Create Bottom Floater (Modal)
    
    func createBottomFloater() -> some View {
        VStack {
            HStack {
                Text("Alamat")
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .font(.system(size: 19))
                    .foregroundColor(Color(hex: "#232175"))
                Spacer()
            }
            
            HStack {
                
                TextField("Alamat Perusahaan", text: $location)
                    .font(Font.system(size: 14))
                    .frame(height: 36)
                
                Button(action:{
                    print("find location")
                }, label: {
                    Image(systemName: "location.viewfinder")
                        .font(Font.system(size: 20))
                        .foregroundColor(Color(hex: "#707070"))
                })
                
            }
            .padding(.horizontal)
            .background(Color.gray.opacity(0.1))
            .cornerRadius(10)
            
            List(0...cities.count-1, id: \.self) {index in
                
                HStack {
                    Text(cities[index])
                        .font(Font.system(size: 14))
                    
                    Spacer()
                }
                .contentShape(Rectangle())
                .onTapGesture(perform: {
                    print(cities[index])
                    alamatPerusahaan = cities[index]
                    registerData.alamatPerusahaan = alamatPerusahaan
                    self.showingModal.toggle()
                })
                
            }
            .background(Color.white)
            .padding(.vertical)
            .frame(height: 150)
            
        }
        .frame(width: UIScreen.main.bounds.width - 60)
        .padding()
        .background(Color.white)
        .cornerRadius(20)
    }
}

struct FormInformasiPerusahaanView_Previews: PreviewProvider {
    static var previews: some View {
        InformasiPerusahaanView().environmentObject(RegistrasiModel())
    }
}
