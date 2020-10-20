//
//  RegisterSliderView.swift
//  Bank Mestika
//
//  Created by Prima Jatnika on 20/10/20.
//

import SwiftUI
import SDWebImageSwiftUI

struct RegisterSliderCarousel: UIViewRepresentable {
    
    func makeCoordinator() -> Coordinator {
        return RegisterSliderCarousel.Coordinator(parent1: self)
    }
    
    var width : CGFloat
    @Binding var page : Int
    var height : CGFloat
    var data: [SliderAssetsViewModel]
    
    func makeUIView(context: Context) -> UIScrollView{
        let total = width * CGFloat(data.count)
        let view = UIScrollView()
        view.isPagingEnabled = true
        view.contentSize = CGSize(width: total, height: 1.0)
        view.bounces = true
        view.showsVerticalScrollIndicator = false
        view.showsHorizontalScrollIndicator = false
        view.delegate = context.coordinator
        
        let view1 = UIHostingController(rootView: RegisterSliderView(page: self.$page, assets: data))
        view1.view.frame = CGRect(x: 0, y: 0, width: total, height: self.height)
        view1.view.backgroundColor = .clear
        
        view.addSubview(view1.view)
        
        return view
        
    }
    
    func updateUIView(_ uiView: UIScrollView, context: Context) {}
    
    class Coordinator : NSObject,UIScrollViewDelegate{
        var parent : RegisterSliderCarousel
        init(parent1: RegisterSliderCarousel) {
            parent = parent1
        }
        
        func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
            let page = Int(scrollView.contentOffset.x / UIScreen.main.bounds.width)
            self.parent.page = page
        }
    }
}

struct RegisterSliderView: View {

    @Binding var page : Int
    let assets: [SliderAssetsViewModel]
    
    var body: some View {
        HStack(spacing: 0){
            ForEach(assets){ i in
                RegisterSliderCell(page: self.$page, assets: i, assetsIndicator: assets, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
            }
        }
    }
}

struct RegisterSliderCell: View {
    
    @Binding var page : Int
    let assets: SliderAssetsViewModel
    var assetsIndicator : [SliderAssetsViewModel]
    
    var width : CGFloat
    var height : CGFloat
    
    var body: some View {
        VStack{
            VStack{
                AnimatedImage(url: URL(string: assets.imageUrl)!)
                    .resizable()
                
                RegisterSliderControl(page: self.$page, data: assetsIndicator)
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

private struct RegisterSliderControl : UIViewRepresentable {
    
    @Binding var page : Int
    var data: [SliderAssetsViewModel]
    
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
