//
//  PersonalIdentityView.swift
//  Bank Mestika
//
//  Created by Prima Jatnika on 28/09/20.
//

import SwiftUI
import UIKit

struct PersonalIdentityView: View {
    
    @ObservedObject var recognizedText: RecognizedText = RecognizedText()
    
    @State var nik: String = ""
    @State var imageKTP: Image? = nil
    @State var imageSelfie: Image? = nil
    @State var imageSignature: Image? = nil
    @State var imageNPWP: Image? = nil
    
    @State var showCaptureKTP: Bool = false
    @State var showCaptureSelfie: Bool = false
    @State var showCaptureSignature: Bool = false
    @State var showCaptureNPWP: Bool = false
    
    @State private var collapsedFormKTP: Bool = false
    @State private var collapsedFormPersonal: Bool = true
    @State private var collapsedFormSignature: Bool = true
    @State private var collapsedFormNPWP: Bool = true
    
    @State var isEditNik: Bool = false
    @State var hasNoNpwp: Bool = false
    
    /*
     Fungsi untuk Toggle CheckBox NIK
     */
    func toggleEditNik() {
        isEditNik = !isEditNik
    }
    
    /*
     Fungsi untuk Toggle Mempunyai NPWP
     */
    func toggleHasNpwp() {
        hasNoNpwp = !hasNoNpwp
        
        if (!hasNoNpwp) {
            self.registerData.hasNoNpwp = hasNoNpwp
        }
    }
    
    /*
     Fungsi untuk Simpan Gambar ke Local Storage
     */
    private func store(imgStore: Image, forKey key: String) {
        let image: UIImage = imgStore.asUIImage()
        
        if let pngRepresentation = image.pngData() {
            UserDefaults.standard.set(pngRepresentation, forKey: key)
        }
    }
    
    /*
     Fungsi untuk ambil Gambar dari Local Storage
     */
    private func retrieveImage(forKey key: String) -> UIImage? {
        if let imageData = UserDefaults.standard.object(forKey: key) as? Data,
           let image = UIImage(data: imageData) {
            print(image)
            
            imageKTP = Image(uiImage: image)
            return image
        }
        
        return nil
    }
    
    /*
     Fungsi Regex NIK
     */
    func matches(for regex: String, in text: String) -> [String] {
        do {
            let regex = try NSRegularExpression(pattern: regex)
            let results = regex.matches(in: text,
                                        range: NSRange(text.startIndex..., in: text))
            return results.map {
                String(text[Range($0.range, in: text)!])
            }
        } catch let error {
            print("invalid regex: \(error.localizedDescription)")
            return []
        }
    }
    
    @EnvironmentObject var registerData: RegistrasiModel
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var body: some View {
        ZStack(alignment: .top) {
            VStack {
                ScrollView(showsIndicators: false) {
                    ZStack {
                        VStack {
                            Color(hex: "#232175")
                                .frame(height: 300)
                            Color(hex: "#F6F8FB")
                        }
                        
                        VStack {
                            Text("Identitas Diri")
                                .font(.title2)
                                .foregroundColor(Color(hex: "#F6F8FB"))
                                .fontWeight(.bold)
                                .padding(.horizontal, 20)
                            Text("Silihkan isi dan lengkapi data identitas Anda")
                                .font(.caption)
                                .multilineTextAlignment(.center)
                                .foregroundColor(Color(hex: "#F6F8FB"))
                                .padding(.top, 5)
                                .padding(.bottom, 70)
                                .padding(.horizontal, 20)
                            
                            photoKTPForm
                                .padding(.bottom, 20)
                            photoPersonalForm
                                .padding(.bottom, 20)
                            photoSignatureForm
                                .padding(.bottom, 20)
                            photoNPWPForm
                            
                            NavigationLink(destination: EmailVerificationView().environmentObject(registerData)) {
                                Text("Lanjut Pembukaan Rekening Baru")
                                    .foregroundColor(.white)
                                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                    .font(.system(size: 13))
                                    .frame(maxWidth: .infinity, minHeight: 40, maxHeight: 40)
                            }
                            .background(Color(hex: "#232175"))
                            .cornerRadius(12)
                            .padding(.horizontal, 10)
                            .padding(.top, 60)
                            .padding(.bottom, 20)
                        }
                        .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                        .navigationBarTitle("BANK MESTIKA", displayMode: .inline)
                        .padding(.horizontal, 30)
                        .padding(.top, 30)
                        .padding(.bottom, 35)
                    }
                }
            }
            .KeyboardAwarePadding()
            
            if (showCaptureKTP) {
                CaptureImageView(isShown: $showCaptureKTP, image: $imageKTP)
            }
            
            if (showCaptureSelfie) {
                CaptureImageView(isShown: $showCaptureSelfie, image: $imageSelfie)
            }
            
            if (showCaptureSignature) {
                CaptureImageView(isShown: $showCaptureSignature, image: $imageSignature)
            }
            
            if (showCaptureNPWP) {
                CaptureImageView(isShown: $showCaptureNPWP, image: $imageNPWP)
            }
        }
        .onAppear {
            print(recognizedText.value)
            
            if (recognizedText.value != "-") {
                let matched = matches(for: "(\\d{13,16})", in: recognizedText.value)
                print(matched)
                
                self.nik = matched[0]
                retrieveImage(forKey: "ktp")
                
            }
        }
    }
    
    var photoKTPForm: some View {
        VStack {
            Button(
                action: { self.collapsedFormKTP.toggle() },
                label: {
                    HStack {
                        Text("Foto KTP dan No. Induk Penduduk")
                            .font(.body)
                            .foregroundColor(collapsedFormKTP ? Color(hex: "#2334D0") : .white)
                            .fontWeight(.semibold)
                        
                        Spacer()
                        
                        if (imageKTP != nil) {
                            Image(systemName: "checkmark.circle")
                                .resizable()
                                .frame(width: 20, height: 20)
                                .foregroundColor(collapsedFormKTP ? Color(hex: "#2334D0") : .white)
                        } else { EmptyView() }
                    }
                    .frame(maxWidth: .infinity, minHeight: 50, maxHeight: 50)
                    .padding(.horizontal, 10)
                    .background(collapsedFormKTP ? Color(hex: "#F6F8FB") : Color(hex: "#2334D0"))
                }
            )
            .buttonStyle(PlainButtonStyle())
            
            VStack(alignment: .center) {
                Text("")
                Text("Mohon siapkan terlebih dahulu Kartu Tanda Penduduk (KTP) Anda")
                    .multilineTextAlignment(.center)
                    .font(.caption)
                    .frame(maxWidth: .infinity)
                    .padding([.bottom], 15)
                    .padding(.horizontal, 20)
                
                ZStack {
                    Image("ic_camera")
                    VStack {
                        imageKTP?
                            .resizable()
                            .frame(maxWidth: 350, maxHeight: 200)
                            .cornerRadius(10)
                    }
                    .frame(maxWidth: 350, minHeight: 200, maxHeight: 200)
                }
                .frame(minWidth: 0, maxWidth: 350, minHeight: 200, maxHeight: 200)
                .background(Color(hex: "#F5F5F5"))
                .cornerRadius(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 10).stroke(Color(.gray).opacity(0.2))
                )
                .padding(.horizontal, 15)
                
                NavigationLink(destination: ScanningView(recognizedText: $recognizedText.value)) {
                    Text(imageKTP == nil ? "Ambil Foto KTP" : "Ganti Foto Lain")
                        .foregroundColor(imageKTP == nil ? .white : Color(hex: "#2334D0"))
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .font(.system(size: 13))
                        .frame(maxWidth: .infinity, minHeight: 40, maxHeight: 40)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10).stroke(Color(.gray).opacity(0.4))
                        )
                }
                .background(Color(hex: imageKTP == nil ? "#2334D0" : "#FFFFFF"))
                .cornerRadius(12)
                .padding(.horizontal, 20)
                .padding([.top, .bottom], 15)
                
                VStack(alignment: .leading) {
                    Text("Nomor Kartu Tanda Penduduk")
                        .multilineTextAlignment(.leading)
                        .font(.caption)
                        .padding(.horizontal, 20)
                    
                    TextField("No. KTP (Otomatis terisi)", text: $nik)
                        .frame(height: 10)
                        .font(.subheadline)
                        .padding()
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(15)
                        .padding(.horizontal, 20)
                        .disabled(!isEditNik)
                    
                    Button(action: toggleEditNik) {
                        HStack(alignment: .top) {
                            Image(systemName: isEditNik ? "checkmark.square": "square")
                            Text("* Periksa kembali dan pastikan Nomor Kartu Tanda Penduduk (KTP) Anda telah sesuai")
                                .font(.caption)
                                .foregroundColor(Color(hex: "#707070"))
                        }
                        .padding(.horizontal, 20)
                        .padding(.bottom, 20)
                        .fixedSize(horizontal: false, vertical: true)
                    }
                    
                    if (imageKTP != nil) {
                        Button(action: {
                            self.collapsedFormKTP.toggle()
                            self.collapsedFormPersonal.toggle()
                            self.registerData.fotoKTP = self.imageKTP!
                            self.registerData.nik = self.nik
                        }) {
                            Text("Simpan")
                                .foregroundColor(.white)
                                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                .font(.system(size: 13))
                                .frame(maxWidth: .infinity, minHeight: 40, maxHeight: 40)
                        }
                        .background(Color(hex: "#2334D0"))
                        .cornerRadius(12)
                        .padding(.horizontal, 20)
                        .padding([.top, .bottom], 15)
                    } else { EmptyView() }
                }
            }
            .frame(minWidth: UIScreen.main.bounds.width - 30, maxWidth: UIScreen.main.bounds.width - 30, minHeight: 0, maxHeight: collapsedFormKTP ? 0 : .none)
            .clipped()
            .animation(.easeOut)
            .transition(.slide)
        }
        .background(Color.white)
        .cornerRadius(15)
        .shadow(radius: 4)
    }
    
    var photoPersonalForm: some View {
        VStack {
            Button(
                action: { self.collapsedFormPersonal.toggle() },
                label: {
                    HStack {
                        Text("Ambil Foto Sendiri atau Selfie")
                            .font(.body)
                            .foregroundColor(collapsedFormPersonal ? Color(hex: "#2334D0") : .white)
                            .fontWeight(.semibold)
                        
                        Spacer()
                        
                        if (imageSelfie != nil) {
                            Image(systemName: "checkmark.circle")
                                .resizable()
                                .frame(width: 20, height: 20)
                                .foregroundColor(collapsedFormPersonal ? Color(hex: "#2334D0") : .white)
                        } else { EmptyView() }
                    }
                    .frame(maxWidth: .infinity, minHeight: 50, maxHeight: 50)
                    .padding(.horizontal, 10)
                    .background(collapsedFormPersonal ? Color(hex: "#F6F8FB") : Color(hex: "#2334D0"))
                }
            )
            .buttonStyle(PlainButtonStyle())
            
            VStack(alignment: .center) {
                Text("")
                Text("Silahkan Lakukan Selfie")
                    .multilineTextAlignment(.center)
                    .font(.caption)
                    .frame(maxWidth: .infinity)
                    .padding([.bottom], 15)
                    .padding(.horizontal, 20)
                
                ZStack {
                    Image("ic_camera")
                    VStack {
                        imageSelfie?
                            .resizable()
                            .frame(maxWidth: 350, maxHeight: 200)
                            .cornerRadius(10)
                    }
                    .frame(maxWidth: 350, minHeight: 200, maxHeight: 200)
                }
                .frame(minWidth: 0, maxWidth: 350, minHeight: 200, maxHeight: 200)
                .background(Color(hex: "#F5F5F5"))
                .cornerRadius(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 10).stroke(Color(.gray).opacity(0.2))
                )
                .padding(.horizontal, 15)
                
                Button(action: {
                    self.showCaptureSelfie.toggle()
                }) {
                    Text(imageSelfie == nil ? "Ambil Gambar Selfie" : "Ganti Foto Lain")
                        .foregroundColor(imageSelfie == nil ? .white : Color(hex: "#2334D0"))
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .font(.system(size: 13))
                        .frame(maxWidth: .infinity, minHeight: 40, maxHeight: 40)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10).stroke(Color(.gray).opacity(0.4))
                        )
                }
                .background(Color(hex: imageSelfie == nil ? "#2334D0" : "#FFFFFF"))
                .cornerRadius(12)
                .padding(.horizontal, 20)
                .padding([.top, .bottom], 15)
                
                if (imageSelfie != nil) {
                    Button(action: {
                        self.collapsedFormPersonal.toggle()
                        self.collapsedFormSignature.toggle()
                        
                        self.registerData.fotoSelfie = self.imageSelfie!
                    }) {
                        Text("Simpan")
                            .foregroundColor(.white)
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                            .font(.system(size: 13))
                            .frame(maxWidth: .infinity, minHeight: 40, maxHeight: 40)
                    }
                    .background(Color(hex: "#2334D0"))
                    .cornerRadius(12)
                    .padding(.horizontal, 20)
                    .padding(.bottom, 15)
                } else { EmptyView() }
            }
            .frame(minWidth: UIScreen.main.bounds.width - 30, maxWidth: UIScreen.main.bounds.width - 30, minHeight: 0, maxHeight: collapsedFormPersonal ? 0 : .none)
            .clipped()
            .animation(.easeOut)
            .transition(.slide)
        }
        .background(Color.white)
        .cornerRadius(15)
        .shadow(radius: 4)
    }
    
    var photoSignatureForm: some View {
        VStack {
            Button(
                action: { self.collapsedFormSignature.toggle() },
                label: {
                    HStack {
                        Text("Silahkan Foto Tanda Tangan Anda")
                            .font(.body)
                            .foregroundColor(collapsedFormSignature ? Color(hex: "#2334D0") : .white)
                            .fontWeight(.semibold)
                        
                        Spacer()
                        
                        if (imageSignature != nil) {
                            Image(systemName: "checkmark.circle")
                                .resizable()
                                .frame(width: 20, height: 20)
                                .foregroundColor(collapsedFormSignature ? Color(hex: "#2334D0") : .white)
                        } else { EmptyView() }
                    }
                    .frame(maxWidth: .infinity, minHeight: 50, maxHeight: 50)
                    .padding(.horizontal, 10)
                    .background(collapsedFormSignature ? Color(hex: "#F6F8FB") : Color(hex: "#2334D0"))
                }
            )
            .buttonStyle(PlainButtonStyle())
            
            VStack(alignment: .center) {
                Text("")
                Text("Ambil foto atau gambar tanda tangan Anda")
                    .multilineTextAlignment(.center)
                    .font(.caption)
                    .frame(maxWidth: .infinity)
                    .padding([.bottom], 15)
                    .padding(.horizontal, 20)
                
                ZStack {
                    Image("ic_camera")
                    VStack {
                        imageSignature?
                            .resizable()
                            .frame(maxWidth: 350, maxHeight: 200)
                            .cornerRadius(10)
                    }
                    .frame(maxWidth: 350, minHeight: 200, maxHeight: 200)
                }
                .frame(minWidth: 0, maxWidth: 350, minHeight: 200, maxHeight: 200)
                .background(Color(hex: "#F5F5F5"))
                .cornerRadius(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 10).stroke(Color(.gray).opacity(0.2))
                )
                .padding(.horizontal, 15)
                
                Button(action: {
                    self.showCaptureSignature.toggle()
                }) {
                    Text(imageSignature == nil ? "Ambil Gambar Tanda Tangan" : "Ganti Foto Lain")
                        .foregroundColor(imageSignature == nil ? .white : Color(hex: "#2334D0"))
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .font(.system(size: 13))
                        .frame(maxWidth: .infinity, minHeight: 40, maxHeight: 40)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10).stroke(Color(.gray).opacity(0.4))
                        )
                }
                .background(Color(hex: imageSignature == nil ? "#2334D0" : "#FFFFFF"))
                .cornerRadius(12)
                .padding(.horizontal, 20)
                .padding([.top, .bottom], 15)
                
                if (imageSignature != nil) {
                    Button(action: {
                        self.collapsedFormSignature.toggle()
                        self.collapsedFormNPWP.toggle()
                        
                        self.registerData.fotoTandaTangan = self.imageSignature!
                    }) {
                        Text("Simpan")
                            .foregroundColor(.white)
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                            .font(.system(size: 13))
                            .frame(maxWidth: .infinity, minHeight: 40, maxHeight: 40)
                    }
                    .background(Color(hex: "#2334D0"))
                    .cornerRadius(12)
                    .padding(.horizontal, 20)
                    .padding(.bottom, 15)
                } else { EmptyView() }
            }
            .frame(minWidth: UIScreen.main.bounds.width - 30, maxWidth: UIScreen.main.bounds.width - 30, minHeight: 0, maxHeight: collapsedFormSignature ? 0 : .none)
            .clipped()
            .animation(.easeOut)
            .transition(.slide)
        }
        .background(Color.white)
        .cornerRadius(15)
        .shadow(radius: 4)
    }
    
    var photoNPWPForm: some View {
        VStack {
            Button(
                action: { self.collapsedFormNPWP.toggle() },
                label: {
                    HStack {
                        Text("Kartu NPWP Anda")
                            .font(.body)
                            .foregroundColor(collapsedFormNPWP ? Color(hex: "#2334D0") : .white)
                            .fontWeight(.semibold)
                        
                        Spacer()
                        
                        if (imageNPWP != nil) {
                            Image(systemName: "checkmark.circle")
                                .resizable()
                                .frame(width: 20, height: 20)
                                .foregroundColor(collapsedFormNPWP ? Color(hex: "#2334D0") : .white)
                        } else { EmptyView() }
                    }
                    .frame(maxWidth: .infinity, minHeight: 50, maxHeight: 50)
                    .padding(.horizontal, 10)
                    .background(collapsedFormNPWP ? Color(hex: "#F6F8FB") : Color(hex: "#2334D0"))
                }
            )
            .buttonStyle(PlainButtonStyle())
            
            VStack(alignment: .center) {
                Text("")
                Text("Silahkan masukan Foto kartu NPWP Anda")
                    .multilineTextAlignment(.center)
                    .font(.caption)
                    .frame(maxWidth: .infinity)
                    .padding([.bottom], 15)
                    .padding(.horizontal, 20)
                
                ZStack {
                    Image("ic_camera")
                    VStack {
                        imageNPWP?
                            .resizable()
                            .frame(maxWidth: 350, maxHeight: 200)
                            .cornerRadius(10)
                    }
                    .frame(maxWidth: 350, minHeight: 200, maxHeight: 200)
                }
                .frame(minWidth: 0, maxWidth: 350, minHeight: 200, maxHeight: 200)
                .background(Color(hex: "#F5F5F5"))
                .cornerRadius(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 10).stroke(Color(.gray).opacity(0.2))
                )
                .padding(.horizontal, 15)
                
                Button(action: {
                    self.showCaptureNPWP.toggle()
                }) {
                    Text(imageKTP == nil ? "Ambil Foto NPWP" : "Ganti Foto Lain")
                        .foregroundColor(imageNPWP == nil ? .white : Color(hex: "#2334D0"))
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .font(.system(size: 13))
                        .frame(maxWidth: .infinity, minHeight: 40, maxHeight: 40)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10).stroke(Color(.gray).opacity(0.4))
                        )
                }
                .background(Color(hex: imageNPWP == nil ? "#2334D0" : "#FFFFFF"))
                .cornerRadius(12)
                .padding(.horizontal, 20)
                .padding([.top, .bottom], 15)
                
                VStack(alignment: .leading) {
                    Text("Nomor NPWP")
                        .multilineTextAlignment(.leading)
                        .font(.caption)
                        .padding(.horizontal, 20)
                    
                    TextField("No. NPWP", text: $nik)
                        .frame(height: 10)
                        .font(.subheadline)
                        .padding()
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(15)
                        .padding(.horizontal, 20)
                    
                    Button(action: toggleHasNpwp) {
                        HStack(alignment: .top) {
                            Image(systemName: hasNoNpwp ? "checkmark.square": "square")
                            Text("* Saya Menyatakan belum memiliki kartu NPWP.\n Lewati tahapan ini")
                                .font(.caption)
                                .foregroundColor(Color(hex: "#707070"))
                        }
                        .padding(.horizontal, 20)
                        .padding(.bottom, 20)
                        .fixedSize(horizontal: false, vertical: true)
                    }
                }
                
                if (imageNPWP != nil) {
                    Button(action: {
                        self.collapsedFormNPWP.toggle()
                        
                        self.registerData.fotoNPWP = self.imageNPWP!
                    }) {
                        Text("Simpan")
                            .foregroundColor(.white)
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                            .font(.system(size: 13))
                            .frame(maxWidth: .infinity, minHeight: 40, maxHeight: 40)
                    }
                    .background(Color(hex: "#2334D0"))
                    .cornerRadius(12)
                    .padding(.horizontal, 20)
                    .padding(.bottom, 15)
                } else { EmptyView() }
            }
            .frame(minWidth: UIScreen.main.bounds.width - 30, maxWidth: UIScreen.main.bounds.width - 30, minHeight: 0, maxHeight: collapsedFormNPWP ? 0 : .none)
            .clipped()
            .animation(.easeOut)
            .transition(.slide)
        }
        .background(Color.white)
        .cornerRadius(15)
        .shadow(radius: 4)
    }
}

struct PersonalIdentityView_Previews: PreviewProvider {
    static var previews: some View {
        PersonalIdentityView().environmentObject(RegistrasiModel())
    }
}

struct CaptureImageView {
    /// MARK: - Properties
    @Binding var isShown: Bool
    @Binding var image: Image?
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(isShown: $isShown, image: $image)
    }
}

extension CaptureImageView: UIViewControllerRepresentable {
    func makeUIViewController(context: UIViewControllerRepresentableContext<CaptureImageView>) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        
        if UIImagePickerController.isSourceTypeAvailable(.camera){
            picker.sourceType = .camera
        }
        
        return picker
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController,
                                context: UIViewControllerRepresentableContext<CaptureImageView>) {
        
    }
}
