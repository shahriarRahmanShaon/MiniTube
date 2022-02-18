//
//  ContentView.swift
//  MiniTube
//
//  Created by sergio shaon on 18/2/22.
//

import SwiftUI

struct ContentView: View {
    @StateObject var MiniTubeVM = MiniTubeViewModel()
    
    var colums = [GridItem(.adaptive(minimum: 150))]
    var body: some View {
        NavigationView {
            ZStack{
                Color("ColorBackground")
                    .ignoresSafeArea()
                VStack(spacing: 20){
                    HStack {
                        ForEach(QueryTag.allCases, id: \.self){ tag in
                            QueryView(query: tag.rawValue, isSelected: MiniTubeVM.selectedQuery == tag)
                                .onTapGesture {
                                    MiniTubeVM.selectedQuery = tag
                                }
                        }
                    }
                    ScrollView(showsIndicators: false) {
                        if MiniTubeVM.videos.isEmpty{
                            ProgressView()
                        }else{
                            LazyVGrid(columns: colums){
                                ForEach(MiniTubeVM.videos, id: \.id){ item in
                                    NavigationLink {
                                        VideoView(video: item)
                                    } label: {
                                        VideoCard(video: item)
                                    }

                                }
                            }

                        }
                    }.frame(maxWidth: .infinity)
                }.padding()
            }.edgesIgnoringSafeArea(.bottom)
                .navigationBarHidden(true)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
