//
//  MusicControlViewController.swift
//  Quantum Meditations
//
//  Created by Shahid on 11/28/20.
//

import UIKit
import Parse
import AVKit
import AVFoundation

class MusicControlViewController: UIViewController {
    
    @IBOutlet weak var photoView: UIImageView!
    @IBOutlet weak var musicnameLabel: UILabel!
    @IBOutlet weak var musicButton: UIButton!
    
    var musicplaying = false
    var selectedmusic: URL?
    var player: AVPlayer?
    
    @IBAction func buttonMusic(_ sender: Any) {
        if musicplaying {
            musicplaying = false
            musicButton.setImage(UIImage(systemName: "play.circle"), for: .normal)
//            musicButton.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
            self.player?.pause()
        }
        
        else{
            musicplaying = true
            musicButton.setImage(UIImage(systemName: "pause.circle"), for: .normal)
//            musicButton.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
            do {
                let playeriteam = AVPlayerItem(url: selectedmusic!)
                self.player = try AVPlayer(playerItem: playeriteam)
                self.player!.play()
            } catch let error as NSError {
                print(error.localizedDescription)
            } catch {
                print("AVaudioPlayer Failed!")
            }
        }
    }
    
    
    var music : PFObject!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        musicnameLabel.text = music["music_name"] as? string
        
        var selectedmusic = music["music_file"] as! PFFileObject
        var urlString = selectedmusic.url!
        var url = URL(string: urlString)!
        selectedmusic = url

        //print(music["music_name"])

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
