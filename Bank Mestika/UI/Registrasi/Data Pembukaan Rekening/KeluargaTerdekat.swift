//
//  KeluargaTerdekat.swift
//  Bank Mestika
//
//  Created by Abdul R. Arraisi on 12/10/20.
//

import SwiftUI

struct KeluargaTerdekat: View {
    
    @EnvironmentObject var registerData: RegistrasiModel
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @State var namaKeluarga: String = ""
    @State var alamatKeluarga: String = ""
    @State var kelurahanKeluarga: String = ""
    @State var kodePosKeluarga : String = ""
    @State var kecamatanKeluarga : String = ""
    @State var noTlpKeluarga : String = ""
    @State var hubunganKekerabatan : String? = ""
    @State var selectionID : Int = 0
    @State var location : String = ""
    @State var showingModal = false
    
    let cities:[Address] = [
        .init(city: "Jakarta Selatan", kodePos: "14012", kecamatan: "Jakarta Selatan", kelurahan: "Selatan"),
        .init(city: "Jakarta Barat", kodePos: "14012", kecamatan: "Jakarta Barat", kelurahan: "Barat"),
        .init(city: "Jakarta Timur", kodePos: "14012", kecamatan: "Jakarta Timur", kelurahan: "Timur"),
        .init(city: "Jakarta Utara", kodePos: "14012", kecamatan: "Jakarta Utara", kelurahan: "Utara")
    ]
    
    
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
                                Text("Data Keluarga Terdekat Anda")
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
                                
                                
                                NavigationLink(destination: PasswordView().environmentObject(registerData), label:{
                                    
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
        .edgesIgnoringSafeArea(.all)
        .navigationBarHidden(true)
        .popup(isPresented: $showingModal, type: .default, position: .bottom, animation: Animation.spring(), closeOnTap: false, closeOnTapOutside: true) {
            createBottomFloater()
        }
    }
    
    // MARK: - Form Group
    
    var cardForm: some View {
        
        VStack(alignment: .leading) {
            Group {
                
                Text("Hubungan Kekerabatan")
                    .font(Font.system(size: 10))
                    .fontWeight(.semibold)
                    .foregroundColor(Color(hex: "#707070"))
                    .multilineTextAlignment(.leading)
                
                TextFieldWithPickerAsInputView(data: ["Ayah", "Ibu", "Kaka", "Adik", "Saudara", "Teman"], placeholder: "Hubungan kekerabatan", selectionIndex: $selectionID, text: $hubunganKekerabatan)
                    .frame(height: 36)
                    .font(Font.system(size: 14))
                    .padding(.horizontal)
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(10)
                
            }
            
            LabelTextField(value: $namaKeluarga, label: "Nama", placeHolder: "Nama") { (change) in
                
            } onCommit: {
                
            }
            
            Group {
                
                Text("Alamat")
                    .font(Font.system(size: 10))
                    .fontWeight(.semibold)
                    .foregroundColor(Color(hex: "#707070"))
                    .multilineTextAlignment(.leading)
                
                HStack {
                    
                    TextField("Alamat", text: $alamatKeluarga) { changed in
                        registerData.alamatKeluarga = alamatKeluarga
                    } onCommit: {
                        registerData.alamatKeluarga = alamatKeluarga
                    }
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
            
            LabelTextField(value: $kodePosKeluarga, label: "Kode Pos", placeHolder: "Kode Pos") { (change) in
                
            } onCommit: {
                
            }
            
            LabelTextField(value: $kecamatanKeluarga, label: "Kecamatan", placeHolder: "Kecamatan") { (change) in
                
            } onCommit: {
                
            }
            
            LabelTextField(value: $kelurahanKeluarga, label: "Kelurahan", placeHolder: "Kelurahan") { (change) in
                
            } onCommit: {
                
            }

            Group {
                
                Text("No. Telepon")
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
                    
                    TextField("No. Telepon", text: $noTlpKeluarga) {change in
                        registerData.noTlpKeluarga = noTlpKeluarga
                    } onCommit: {
                        registerData.noTlpKeluarga = noTlpKeluarga
                    }
                    .keyboardType(.numberPad)
                    .font(Font.system(size: 14))
                    .frame(height: 36)
                }
                .padding(.horizontal)
                .background(Color.gray.opacity(0.1))
                .cornerRadius(10)
                
            }

        }
        .padding(.horizontal, 20)
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
                    Text(cities[index].city)
                        .font(Font.system(size: 14))
                    
                    Spacer()
                }
                .contentShape(Rectangle())
                .onTapGesture(perform: {
                    print(cities[index])
                    alamatKeluarga = cities[index].city
                    kodePosKeluarga = cities[index].kodePos
                    kecamatanKeluarga = cities[index].kecamatan
                    kelurahanKeluarga = cities[index].kelurahan
                    
//                    registerData.alamatKeluarga = alamatKeluarga
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

struct KeluargaTerdekat_Previews: PreviewProvider {
    static var previews: some View {
        KeluargaTerdekat().environmentObject(RegistrasiModel())
    }
}
