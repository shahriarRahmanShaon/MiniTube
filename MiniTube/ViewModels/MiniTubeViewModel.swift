//
//  MiniTubeViewModel.swift
//  MiniTube
//
//  Created by sergio shaon on 19/2/22.
//

import SwiftUI
import Combine

class MiniTubeViewModel: ObservableObject{
    
    @Published private(set) var videos: [Video] = []
    @Published var selectedQuery: QueryTag = QueryTag.nature{
        didSet{
            fetchVideos(genre: selectedQuery )
        }
    }
    
    init(){
        fetchVideos(genre: QueryTag.nature)
    }
    
    //MARK: - Intents
    
    func fetchVideos(genre: QueryTag){
        if let url = URL(string: "https://api.pexels.com/videos/search?query=\(genre)&per_page=10"){
            var urlRequestBuilder = URLRequest(url: url)
            urlRequestBuilder.setValue("563492ad6f91700001000001e8a8bedd7c954664be608f4868e30dc5", forHTTPHeaderField: "Authorization")
            
            URLSession.shared.dataTask(with: urlRequestBuilder) { data, response, error in
                if let data = data {
                    let decoder = JSONDecoder()
                    decoder.keyDecodingStrategy = .convertFromSnakeCase
                    do{
                        let decodedData = try decoder.decode(MiniTubeModel.self, from: data)
                        DispatchQueue.main.async {
                            self.videos = []
                            self.videos = decodedData.videos
                        }
                    }catch{
                        print("can't do this shit")
                    }
                }
            }
            .resume()
        }
    }
    
}
