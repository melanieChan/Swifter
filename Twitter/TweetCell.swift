//
//  TweetCell.swift
//  Twitter
//
//  Created by Melanie Chan on 2/20/21.
//  Copyright © 2021 Dan. All rights reserved.
//

import UIKit

class TweetCell: UITableViewCell {

    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var tweetContent: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBOutlet weak var favButton: UIButton!
    
    @IBOutlet weak var retweetButton: UIButton!
    
    
    var favoried:Bool = false
    
    // display color of fav button depending on favorited state
    func setFavorite(_ isFavorited: Bool){
        if (isFavorited) {
            // change color to red
            favButton.setImage(UIImage(named: "favor-icon-red"), for: UIControl.State.normal)
        } else {
            // grey
            favButton.setImage(UIImage(named: "favor-icon"), for: UIControl.State.normal)
        }
        
    }
    
    var tweetId: Int = -1
    
    // allows user to favorite tweet through app
    @IBAction func favoriteTweet(_ sender: Any) {
        if (favoried) {
            
            
        } else {
            
        }
        
    }
    
    @IBAction func retweet(_ sender: Any) {
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
