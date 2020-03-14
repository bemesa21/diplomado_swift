//
//  ViewController.swift
//  TestFeedKit
//
//  Created by Berenice Medel on 06/03/20.
//  Copyright © 2020 Berenice Medel. All rights reserved.
//

import UIKit
import FeedKit

let url = "https://www.npr.org/rss/podcast.php?id=500005"
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        guard let urlFeed = URL(string: url) else {
            print("no es valido")
            return
        }
        
        let parser = FeedParser(URL: urlFeed)
        parser.parseAsync{ (result) in
            switch result{
                case .success(let feed):
                    let item = feed.rssFeed?.items?.first
                    
                    if let url = item?.enclosure?.attributes?.url{
                        print("Este es el url: \(url)")
                    }else{
                        return
                    }
                break
                case .failure(let error):
                print(error)
            }
        }
    }


}

