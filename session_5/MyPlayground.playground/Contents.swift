import UIKit

import PlaygroundSupport


struct ResultsSearch: Codable{
    var resultCount: Int
    var results:[Track]
}


struct Track:   Codable{
    var artistName: String
}
let url  = URL(string: "https://www.unam.mx")

let jsonDecoder = JSONDecoder()
let task = URLSession.shared.dataTask(with: url!){ (data, response, error) in
    if (error != nil){
        print(error?.localizedDescription)
    }
    
    if let data = data, let tracks = try? jsonDecoder.decode(ResultsSearch.self, from: data){
        for track in tracks.results{
            print(track.artistName)
        }
    }
    
    if let data = data, let string = String(data: data, encoding: .utf8){
        print(string)
    }
}



task.resume()


PlaygroundPage.current.needsIndefiniteExecution = true
