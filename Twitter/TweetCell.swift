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
        // remember status
        favoried = isFavorited
        
        // change color
        if (isFavorited) {
            // change color to red
            favButton.setImage(UIImage(named: "favor-icon-red"), for: UIControl.State.normal)
        } else {
            // grey
            favButton.setImage(UIImage(named: "favor-icon"), for: UIControl.State.normal)
        }
        
    }
    
    var tweetId: Int = -1
    
    // when user taps on like button, Twitter API is called to change favorite status of tweet
    @IBAction func favoriteTweet(_ sender: Any) {
        let toBeFavorited = !favoried
        
        // user wants to favorite tweet
        if (toBeFavorited) {
            TwitterAPICaller.client?.favoriteTweet(tweetId: tweetId, success: {
                self.setFavorite(true)
            }, failure: { (error) in
                print("favorite not successful \(error)")
            })
        }
        
        // user wants to unfavorite
        else {
            TwitterAPICaller.client?.unfavoriteTweet(tweetId: tweetId, success: {
                self.setFavorite(false)
            }, failure: { (error) in
                print("unfavorite not successful \(error)")
            })
        }
        
    }
    
    // send retweet status to Twitter & mark as tweet as retweeted 
    @IBAction func retweet(_ sender: Any) {
        TwitterAPICaller.client?.retweet(tweetId: tweetId, success: {
            
            self.setRetweeted(true)
            
        }, failure: { (error) in
            print("retweet failed \(error)")
        })
    }
    
    // change view of retweet button
    func setRetweeted(_ isRetweeted:Bool) {
        // change icon
        if (isRetweeted) {
            retweetButton.setImage(UIImage(named: "retweet-icon-green"), for: UIControl.State.normal)
            
            retweetButton.isEnabled = false
        }
        
        else {
            retweetButton.setImage(UIImage(named: "retweet-icon"), for: UIControl.State.normal)
            
            retweetButton.isEnabled = true
        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
