//
//  RegisterView.swift
//  Bank Mestika
//
//  Created by Prima Jatnika on 23/09/20.
//

import SwiftUI
import ExytePopupView
import SDWebImageSwiftUI

class AppState: ObservableObject {
    @Published var moveToRegister: Bool = false
}

struct RegisterView: View {
    
    @ObservedObject var viewModel: AssetsViewModel
    
    var registerData = RegistrasiModel()
    
    @FetchRequest(entity: User.entity(), sortDescriptors: []) var user: FetchedResults<User>
    @EnvironmentObject var appState: AppState
    @State var isViewActivity: Bool = false
    
    /*
     Boolean for Show Modal
     */
    @State var showingModal = false
    
    /*
     Variable for Image Carousel
     */
    @State var menu = 0
    @State var page = 0
    
    var body: some View {
        NavigationView {
            ZStack {
                Color(hex: "#232175")
                
                VStack(alignment: .leading) {
                    header
                        .padding(.top, 20)
                        .padding(.horizontal, 30)
                    LoadingView(isShowing: .constant(viewModel.isLoading)) {
                        NavigationLink(destination: IncomingVideoCallView()) {
                            imageSlider
                        }
                    }
                    footerBtn
                        .padding(.top, 20)
                        .padding(.bottom, 35)
                        .padding(.horizontal, 30)
                }
                .frame(
                    minWidth: 0,
                    maxWidth: .infinity,
                    minHeight: 0,
                    maxHeight: .infinity,
                    alignment: .leading
                )
                
                if self.showingModal {
                    ModalOverlay(tapAction: { withAnimation { self.showingModal = false } })
                }
            }
            .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            .popup(isPresented: $showingModal, type: .floater(), position: .bottom, animation: Animation.spring(), closeOnTapOutside: true) {
                createBottomFloater()
            }
        }
        .navigationBarHidden(true)
        .onAppear(perform: {
            print("ON APPEAR")
            
            viewModel.getAssets()
            
            UINavigationBar.appearance().barTintColor = UIColor(Color(hex: "#232175"))
            UINavigationBar.appearance().tintColor = .white
            UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        })
    }
    
    var header: some View {
        VStack(alignment: .leading) {
            Text("Welcome to")
                .fontWeight(.semibold)
                .font(.system(size: 17))
                .foregroundColor(.white)
            HStack(alignment: .center, spacing: .none) {
                Image("Logo M")
                    .resizable()
                    .frame(width: 35, height: 35)
                Text("BANK MESTIKA")
                    .foregroundColor(.white)
                    .font(.system(size: 30))
                    .bold()
            }.padding(.top, -5)
        }.padding(.top, 30)
    }
    
    var imageSlider: some View {
        GeometryReader{g in
            Carousel(width: UIScreen.main.bounds.width, page: self.$page, height: UIScreen.main.bounds.height - 300, data: viewModel.assetsList)
        }
    }
    
    var footerBtn: some View {
        VStack {
            Button(action : {
                showingModal.toggle()
            }) {
                Text("DAFTAR")
                    .foregroundColor(.white)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .font(.system(size: 13))
                    .frame(maxWidth: .infinity, maxHeight: 40)
            }
            .padding(.bottom, 2)
            .background(Color(hex: "#2334D0"))
            .cornerRadius(12)
            
            NavigationLink(destination: FirstLoginView()) {
                Text("LOGIN")
                    .foregroundColor(.white)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .font(.system(size: 12))
                    .frame(maxWidth: .infinity, maxHeight: 40)
            }
            .cornerRadius(12)
            .onReceive(self.appState.$moveToRegister) { moveToRegister in
                if moveToRegister {
                    print("Move to Register: \(moveToRegister)")
                    self.isViewActivity = false
                    self.appState.moveToRegister = false
                }
            }
        }
    }
    
    /*
     Fuction for Create Bottom Floater (Modal)
     */
    func createBottomFloater() -> some View {
        VStack(alignment: .leading) {
            Image("ic_bell")
                .resizable()
                .frame(width: 95, height: 95)
                .padding(.top, 20)
            Text("Sebelum Memulai..!!")
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                .font(.system(size: 16))
                .foregroundColor(Color(hex: "#232175"))
                .padding(.bottom, 20)
            Text("Apakah Anda Merupakan Nasabah Bank Mestika?")
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                .font(.system(size: 22))
                .foregroundColor(Color(hex: "#232175"))
                .padding(.bottom, 30)
            
            NavigationLink(destination: RegisterProvisionView().environmentObject(registerData)) {
                Text("Tidak, Saya Bukan")
                    .foregroundColor(.white)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .font(.system(size: 13))
                    .frame(maxWidth: .infinity, maxHeight: 40)
            }
            .padding(.bottom, 2)
            .background(Color(hex: "#2334D0"))
            .cornerRadius(12)
            
            NavigationLink(destination: RegisterRekeningCardView().environmentObject(registerData)) {
                Text("Ya, saya Nasabah Bank Mestika")
                    .foregroundColor(.black)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .font(.system(size: 12))
                    .frame(maxWidth: .infinity, maxHeight: 40)
            }
            .padding(.bottom, 30)
            .cornerRadius(12)
        }
        .frame(width: UIScreen.main.bounds.width - 60)
        .padding(.horizontal, 15)
        .background(Color.white)
        .cornerRadius(20)
    }
}

private struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView(viewModel: AssetsViewModel()).environmentObject(RegistrasiModel())
    }
}

private struct ListCard : View {
    
    @Binding var page : Int
    var data: [AssetsResponse]
    
    var body: some View{
        HStack(spacing: 0){
            ForEach(data){ i in
                Card(page: self.$page, width: UIScreen.main.bounds.width, data: i, responseData: data, height: UIScreen.main.bounds.height)
            }
        }
    }
}

private struct Card : View {
    
    @Binding var page : Int
    var width : CGFloat
    var data : AssetsResponse
    var responseData : [AssetsResponse]
    var height : CGFloat
    
    var body: some View{
        VStack{
            VStack{
                AnimatedImage(url: URL(string: self.data.imageUrl)!)
                    .resizable()
                
                PageControl(page: self.$page, data: responseData)
                    .padding([.top], 10)
            }
            .background(Color(hex: "#2334D0"))
            .cornerRadius(50)
            .padding(.top, 25)
        }
        .padding(.horizontal, 30)
        .frame(width: self.width)
        .animation(.default)
    }
}

private struct Carousel : UIViewRepresentable {
    
    func makeCoordinator() -> Coordinator {
        return Carousel.Coordinator(parent1: self)
    }
    
    var width : CGFloat
    @Binding var page : Int
    var height : CGFloat
    var data: [AssetsResponse]
    
    func makeUIView(context: Context) -> UIScrollView{
        let total = width * CGFloat(data.count)
        let view = UIScrollView()
        view.isPagingEnabled = true
        //1.0  For Disabling Vertical Scroll....
        view.contentSize = CGSize(width: total, height: 1.0)
        view.bounces = true
        view.showsVerticalScrollIndicator = false
        view.showsHorizontalScrollIndicator = false
        view.delegate = context.coordinator
        
        let view1 = UIHostingController(rootView: ListCard(page: self.$page, data: self.data))
        view1.view.frame = CGRect(x: 0, y: 0, width: total, height: self.height)
        view1.view.backgroundColor = .clear
        
        view.addSubview(view1.view)
        
        return view
        
    }
    
    func updateUIView(_ uiView: UIScrollView, context: Context) {}
    
    class Coordinator : NSObject,UIScrollViewDelegate{
        var parent : Carousel
        init(parent1: Carousel) {
            parent = parent1
        }
        
        func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
            let page = Int(scrollView.contentOffset.x / UIScreen.main.bounds.width)
            self.parent.page = page
        }
    }
}

private struct PageControl : UIViewRepresentable {
    
    @Binding var page : Int
    var data: [AssetsResponse]
    func makeUIView(context: Context) -> UIPageControl {
        
        let view = UIPageControl()
        view.currentPageIndicatorTintColor = .black
        view.pageIndicatorTintColor = UIColor.black.withAlphaComponent(0.2)
        view.numberOfPages = data.count
        return view
    }
    
    func updateUIView(_ uiView: UIPageControl, context: Context) {
        DispatchQueue.main.async {
            uiView.currentPage = self.page
        }
    }
}
