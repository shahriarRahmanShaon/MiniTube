//
//  VideoCard.swift
//  MiniTube
//
//  Created by sergio shaon on 18/2/22.
//

import SwiftUI

struct VideoCard: View {
    var video: Video
    
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            AsyncImage(url: URL(string: video.image)) { image in
                image
                    .resizable()
                    .aspectRatio(1, contentMode: .fill)
                    .frame(width: 160, height: 250)
                    .cornerRadius(10)
            } placeholder: {
                Rectangle()
                    .frame(width: 160, height: 250)
                    .foregroundColor(.gray.opacity(0.5))
                    .cornerRadius(40)
            }
            VStack(alignment: .leading){
                Text("\(video.duration)")
                Text("\(video.user.name)")
            }
            .font(.caption)
            .padding()
            .foregroundColor(.white)
        
        }.overlay(
            Image(systemName: "play.fill")
                .foregroundColor(.white)
                .font(.system(size: 40))
                .padding()
                .background(.ultraThinMaterial)
                .cornerRadius(40)
        )
    }
}
