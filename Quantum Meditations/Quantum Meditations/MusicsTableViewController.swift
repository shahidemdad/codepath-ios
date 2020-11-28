//
//  MusicsTableViewController.swift
//  Quantum Meditations
//
//  Created by Shahid on 11/27/20.
//

import UIKit
import AVFoundation //for music
import Parse // need for database
import AlamofireImage // for the image of the musics

class MusicsTableViewController: UITableViewController {

    var meditations: [PFObject] = [] // using it as an array, not sure if its right!
    
//    @IBOutlet var button: UIButton!
    var player: AVAudioPlayer?
    
    @IBAction func playMusic(_ sender: Any) {
        if let user = user, user.isPlaying{
            //stop playback
        }
        else{
            //set up player and play
            let urlString = FILE.url
            
            do{
                try AVAudioSession.sharedInstance().setMode(.default)
                try AVAudioSession.sharedInstance().setActive(true, options: .notifyOthersOnDeactivation)
            }
            catch{
                print("Error!")
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //also the self?
        tableView.delegate = self
        tableView.dataSource = self
    }
    
//    @IBAction func didTapButton(){
//
//    }
    
    //do I need this part?
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let query = PFQuery(className: "meditations")
        query.includeKey("music_name")
        query.limit = 20
        
        query.findObjectsInBackground { (meditations, error) in
            if meditations != nil {
                self.meditations = meditations!
                self.tableView.reloadData()
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        //returning the amount of all musics in meditations
        return meditations.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MusicCell") as! MusicCell
        
        let meditation = meditations[indexPath.row]
        
        let musicname = meditations["music_name"] as! String
        
        cell.musicnameLabel.text = meditations["music_name"] as! String
        
        let image = meditations["music_pic"] as! PFFileObject
        let urlString = FILE.url!
        let url = URL(string: urlString)!
        
        cell.photoView.af_setImage(withURL: url)

        
        return cell
        
    }


//    // MARK: - Table view data source

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
