//
//  MusicCell.swift
//  Quantum Meditations
//
//  Created by Shahid on 11/28/20.
//

import UIKit
import AVKit
import AVFoundation

class MusicCell: UITableViewCell {

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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
