//
//  ViewController.swift
//  Music
//
//  Created by Berenice Medel on 29/02/20.
//  Copyright © 2020 Berenice Medel. All rights reserved.
//

import UIKit
import AVKit
class ViewController: UIViewController {
    @IBOutlet weak var portada: UIImageView!
    @IBOutlet weak var playButton: UIButton!
    let player: AVPlayer = {
        let avPlayer = AVPlayer()
        avPlayer.automaticallyWaitsToMinimizeStalling = false
        return avPlayer
    }()
    var status: String = "none"
    
    var urlImage = "https://media.npr.org/assets/img/2018/08/03/npr_freshair_podcasttile_sq-bb34139df91f7a48120ddce9865817ea11baaf32.jpg?s=1400"
    
    var urlPodcast = "https://edge2.pod.npr.org/anon.npr-podcasts/podcast/npr/fa/2020/02/20200229_fa_fawpod-ae09ae06-d2da-434a-b93e-f94f2b70843e.mp3/20200229_fa_fawpod-ae09ae06-d2da-434a-b93e-f94f2b70843e.mp3_74933e837681818cf0ad5b0aea5b6363_49001459.mp3?awCollectionId=381444908&awEpisodeId=810361242&orgId=1&d=3069&p=381444908&story=810361242&t=podcast&e=810361242&size=49001459&ft=pod&f=381444908&hash_redirect=1&x-total-bytes=49001459&x-ais-classified=download&listeningSessionID=0CD_382_59__7f63fa05388cc0c2d09b95ea9213740ad068092f"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        playButton.setImage(UIImage(named: "play"), for: .normal)
        loadImage()
    }
    
    func loadImage(){
        guard let url = URL(string: urlImage ?? "") else{ return}
        URLSession.shared.dataTask(with: url){ (data, response, error) in
            print("Descargando la imagen", data)
            guard let dataImage = data else { return }
            DispatchQueue.main.async {
                self.portada.image = UIImage(data: dataImage)
            }
        }.resume()
    }
    @IBAction func playEpisode(_ sender: UIButton){
        if status == "none"{
            guard let url = URL(string: urlPodcast) else {return}
             let playerItem = AVPlayerItem(url: url)
             player.replaceCurrentItem(with: playerItem)
             player.play()
            status = "play"
            
        }else {
            if player.timeControlStatus == .playing{
                player.pause()
                playButton.setImage(UIImage(named: "play"), for: .normal)

            }else {
                player.play()
                playButton.setImage(UIImage(named: "pause"), for: .normal)

            }
        }
 
        
    }
    
}

