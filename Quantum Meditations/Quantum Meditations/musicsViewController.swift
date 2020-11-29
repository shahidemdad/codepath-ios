//
//  MusicsViewController.swift
//  Quantum Meditations
//
//  Created by Shahid on 11/27/20.
//

import UIKit
import AVFoundation //for music
import Parse // need for database
import AlamofireImage // for the image of the musics

class MusicsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var musicTableView: UITableView!
    
    var meditations: [PFObject] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let query = PFQuery(className: "meditations")
        query.includeKey("music_name")
        query.limit = 20
        
        query.findObjectsInBackground { (meditations, error) in
            if meditations != nil {
                self.meditations = meditations!
                self.musicTableView.reloadData()
                print(meditations)
            }
            else{
                print(error?.localizedDescription)
            }
        }
        
        //purpose: necesarry protocals
        musicTableView.delegate = self
        musicTableView.dataSource = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        //returning the amount of all musics in meditations
        return meditations.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //initialzing the resuable musiccell
        let cell = tableView.dequeueReusableCell(withIdentifier: "MusicCell") as! MusicCell
        
        let meditation = meditations[indexPath.row]
        let musicname = meditation["music_name"] as! String
        cell.musicnameLabel.text = (meditation["music_name"] as! String)

        let image = meditation["music_pic"] as! PFFileObject
        var urlString = image.url!
        var url = URL(string: urlString)!
        cell.photoView.af.setImage(withURL: url)
        
        let selectedmusic = meditation["music_file"] as! PFFileObject
        urlString = selectedmusic.url!
        url = URL(string: urlString)!
        cell.selectedmusic = url
        
        return cell
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Find the selective music
        let cell = sender as! UITableViewCell
        let indexPath = musicTableView.indexPath(for: cell)!
        
        let music = meditations[indexPath.row]
        let controlViewController = segue.destination as! MusicControlViewController
        controlViewController.music = music
        
        musicTableView.deselectRow(at: indexPath, animated: true)
    }
}
