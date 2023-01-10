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
            //背景
                 Color.indigo
            VStack(spacing: 20){
                HStack(spacing: 20){
                    Text("M高へ")
                        .fontWeight(.black)
                        .kerning(10)
                        .font(.largeTitle)
                        .foregroundColor(.white)
                        .shadow(color: .black,radius: 2,
                                x :4,
                                y:3)
                    Text(" ようこそ")
                        .fontWeight(.black)
                        .kerning(10)
                        .font(.largeTitle)
                        .foregroundColor(.white)
                        .shadow(color: .black,radius: 2,
                                x :4,
                                y:3)
                }
                
                NavigationLink(destination: MView()){
                    Text("あなたは番目の訪問者です！")
                        .foregroundColor(.black)
                        
                }
                NavigationLink(destination: SchoolingView()){
                    Text("スクーリングの予約をキャンセルしたい")
                        .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.black, lineWidth: 2))
                        .foregroundColor(.red)
                        .bold()
                }
                NavigationLink(destination: TestView()){
                    Text("自分のスクーリング日程を確認する")
                        .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.black, lineWidth:2))
                        .foregroundColor(.yellow)
                        .scaleEffect(angle)
                        .bold()
                }
              }
            }
        }
    }
}

struct MView: View {
    var body: some View {
        Text("スクーリング").font(.title)
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
