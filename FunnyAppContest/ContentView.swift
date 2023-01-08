//
//  ContentView.swift
//  FunnyAppContest
//
//  Created by 松岡奈央 on 2023/01/08.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @State private var angle: CGFloat = 1
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
        animation: .default)
    private var items: FetchedResults<Item>
    
    var body: some View {
        
        NavigationView{
        //背景色設定
        let spectrum = Gradient(colors: [.red,.yellow,.blue,.green,.purple,.red])
        //12時の方向からグラデーション開始
        let conic = AngularGradient(gradient: spectrum, center: .center,angle: .degrees(-90))
        ZStack{
            //背景色指定
            (conic)
            VStack(spacing: 50){
                Text("M高等学校へようこそ！！")

                NavigationLink(destination: SchoolingView()){
                    Text("スクーリングに行こうよ！！")
                        .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.black, lineWidth: 5))
                        .foregroundColor(.black)
                }
                NavigationLink(destination: TestView()){
                    Text("テストに行こうよ！とっても楽しみだね！")
                        .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.black, lineWidth: 5))
                        .foregroundColor(.black)
                        .scaleEffect(angle)
                }
              }
            }
        }
    }
}

struct SchoolingView: View {
    var body: some View {
        Text("スクーリング").font(.title)
    }
}

struct TestView: View{
    var body: some View{
        Text("テスト")
    }
}
 

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
