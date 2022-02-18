//
//  VideoView.swift
//  MiniTube
//
//  Created by sergio shaon on 19/2/22.
//

import SwiftUI
import AVKit

struct VideoView: View {
    var video: Video
    @State var videoPlayer = AVPlayer()
    
    var body: some View {
        VideoPlayer(player: videoPlayer)
            .ignoresSafeArea()
            .onAppear {
                if let link = video.videoFiles.first?.link{
                    print(link)
                    videoPlayer = AVPlayer(url: URL(string: link)!)
                    videoPlayer.play()
                }
            }
    }
}
