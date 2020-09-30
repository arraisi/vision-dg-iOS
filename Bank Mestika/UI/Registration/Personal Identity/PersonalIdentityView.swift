//
//  PersonalIdentityView.swift
//  Bank Mestika
//
//  Created by Prima Jatnika on 28/09/20.
//

import SwiftUI

struct PersonalIdentityView: View {
    
    @State var nik: String = ""
    @State var imageKTP: Image? = nil
    
    @State var showCaptureImageView: Bool = false
    @State private var collapsedFormKTP: Bool = false
    @State private var collapsedFormPersonal: Bool = true
    @State private var collapsedFormSignature: Bool = true
    @State private var collapsedFormNPWP: Bool = true
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var body: some View {
        ZStack(alignment: .top) {
            VStack {
                Color(hex: "#232175")
                    .frame(height: 300)
                Color(hex: "#F6F8FB")
            }
            
            VStack {
                appbar
                    .padding(.top, 45)
                    .padding(.horizontal, 30)
                
                ScrollView(showsIndicators: false) {
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
                        
                        NavigationLink(destination: EmailVerificationView()) {
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
                    .padding(.horizontal, 30)
                    .padding(.top, 65)
                    .padding(.bottom, 35)
                }
            }
            
            if (showCaptureImageView) {
                CaptureImageView(isShown: $showCaptureImageView, image: $imageKTP)
            }
        }
        .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
        .navigationBarHidden(true)
    }
    
    var appbar: some View {
        HStack {
            Button(action: {
                presentationMode.wrappedValue.dismiss()
            }) {
                Image(systemName: "arrow.left")
                    .foregroundColor(.white)
            }
            Spacer()
            logo
            Spacer()
        }
    }
    
    var logo: some View {
        HStack(alignment: .center, spacing: .none) {
            Image("Logo M")
                .resizable()
                .frame(width: 25, height: 25)
            Text("BANK MESTIKA")
                .foregroundColor(.white)
                .font(.system(size: 20))
                .bold()
        }
    }
    
    var photoKTPForm: some View {
        VStack {
            Button(
                action: { self.collapsedFormKTP.toggle() },
                label: {
                    Text("Foto KTP dan No. Induk Penduduk")
                        .font(.body)
                        .foregroundColor(collapsedFormKTP ? Color(hex: "#2334D0") : .white)
                        .fontWeight(.semibold)
                        .frame(maxWidth: .infinity, minHeight: 40, maxHeight: 40)
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
                
                Button(action: {
                    self.showCaptureImageView.toggle()
                }) {
                    Text("Ambil Foto KTP")
                        .foregroundColor(.white)
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .font(.system(size: 13))
                        .frame(maxWidth: .infinity, minHeight: 40, maxHeight: 40)
                }
                .background(Color(hex: "#2334D0"))
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
                        .padding(.bottom, 20)
                        .padding(.horizontal, 20)
                }
            }
            .frame(minWidth: UIScreen.main.bounds.width - 30, maxWidth: UIScreen.main.bounds.width - 30, minHeight: 0, maxHeight: collapsedFormKTP ? 0 : .none)
            .clipped()
            .animation(.easeOut)
            .transition(.slide)
        }
        .background(Color.white)
        .shadow(color: Color(hex: "#E5E9F9"), radius: 15, x: 2, y: 25)
    }
    
    var photoPersonalForm: some View {
        VStack {
            Button(
                action: { self.collapsedFormPersonal.toggle() },
                label: {
                    Text("Ambil Foto Sendiri atau Selfie")
                        .font(.body)
                        .foregroundColor(collapsedFormPersonal ? Color(hex: "#2334D0") : .white)
                        .fontWeight(.semibold)
                        .frame(maxWidth: .infinity, minHeight: 40, maxHeight: 40)
                        .padding(.horizontal, 20)
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
                
                Button(action: {
                    self.showCaptureImageView.toggle()
                }) {
                    Text("Ambil Gambar Selfie")
                        .foregroundColor(.white)
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .font(.system(size: 13))
                        .frame(maxWidth: .infinity, minHeight: 40, maxHeight: 40)
                }
                .background(Color(hex: "#2334D0"))
                .cornerRadius(12)
                .padding(.horizontal, 20)
                .padding([.top, .bottom], 15)
            }
            .frame(minWidth: UIScreen.main.bounds.width - 30, maxWidth: UIScreen.main.bounds.width - 30, minHeight: 0, maxHeight: collapsedFormPersonal ? 0 : .none)
            .clipped()
            .animation(.easeOut)
            .transition(.slide)
        }
        .background(Color.white)
        .shadow(color: Color(hex: "#E5E9F9"), radius: 15, x: 2, y: 25)
    }
    
    var photoSignatureForm: some View {
        VStack {
            Button(
                action: { self.collapsedFormSignature.toggle() },
                label: {
                    Text("Silahkan Foto Tanda Tangan Anda")
                        .font(.body)
                        .foregroundColor(collapsedFormSignature ? Color(hex: "#2334D0") : .white)
                        .fontWeight(.semibold)
                        .frame(maxWidth: .infinity, minHeight: 40, maxHeight: 40)
                        .padding(.horizontal, 20)
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
                
                Button(action: {
                    self.showCaptureImageView.toggle()
                }) {
                    Text("Ambil Foto Tanda Tangan")
                        .foregroundColor(.white)
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .font(.system(size: 13))
                        .frame(maxWidth: .infinity, minHeight: 40, maxHeight: 40)
                }
                .background(Color(hex: "#2334D0"))
                .cornerRadius(12)
                .padding(.horizontal, 20)
                .padding([.top, .bottom], 15)
            }
            .frame(minWidth: UIScreen.main.bounds.width - 30, maxWidth: UIScreen.main.bounds.width - 30, minHeight: 0, maxHeight: collapsedFormSignature ? 0 : .none)
            .clipped()
            .animation(.easeOut)
            .transition(.slide)
        }
        .background(Color.white)
        .shadow(color: Color(hex: "#E5E9F9"), radius: 15, x: 2, y: 25)
    }
    
    var photoNPWPForm: some View {
        VStack {
            Button(
                action: { self.collapsedFormNPWP.toggle() },
                label: {
                    Text("Kartu NPWP Anda")
                        .font(.body)
                        .foregroundColor(collapsedFormNPWP ? Color(hex: "#2334D0") : .white)
                        .fontWeight(.semibold)
                        .frame(maxWidth: .infinity, minHeight: 40, maxHeight: 40)
                        .padding(.horizontal, 20)
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
                
                Button(action: {
                    self.showCaptureImageView.toggle()
                }) {
                    Text("Upload Gambar NPWP")
                        .foregroundColor(.white)
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .font(.system(size: 13))
                        .frame(maxWidth: .infinity, minHeight: 40, maxHeight: 40)
                }
                .background(Color(hex: "#2334D0"))
                .cornerRadius(12)
                .padding(.horizontal, 20)
                .padding([.top, .bottom], 15)
            }
            .frame(minWidth: UIScreen.main.bounds.width - 30, maxWidth: UIScreen.main.bounds.width - 30, minHeight: 0, maxHeight: collapsedFormNPWP ? 0 : .none)
            .clipped()
            .animation(.easeOut)
            .transition(.slide)
        }
        .background(Color.white)
        .shadow(color: Color(hex: "#E5E9F9"), radius: 15, x: 2, y: 25)
    }
}

struct PersonalIdentityView_Previews: PreviewProvider {
    static var previews: some View {
        PersonalIdentityView()
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
