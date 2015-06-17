//
//  EpisodeViewController.swift
//  Tapas
//
//  Created by Jamie White on 16/06/2015.
//  Copyright © 2015 Jamie White. All rights reserved.
//

import Cocoa
import AVKit
import AVFoundation
import WebKit

class EpisodeViewController: NSViewController {
    
    @IBOutlet weak var playerView: AVPlayerView!
    @IBOutlet weak var webView: WebView!

    var episode: Episode? {
        didSet {
            self.update()
        }
    }
    var email: String? {
        didSet {
            self.update()
        }
    }
    var password: String? {
        didSet {
            self.update()
        }
    }

    override func viewDidLoad() {
        self.update()
    }

    func update() {
        self.displayHTML()
        self.displayVideo()
    }

    func displayHTML() {
        if let html = self.episode?.description {
            self.webView.mainFrame.loadHTMLString(html, baseURL: NSURL(string: "http://www.rubytapas.com/")!)
        }
    }

    func displayVideo() {
        if let url = self.episode?.url, let email = self.email, let password = self.password {
            let token = base64Encode("\(email):\(password)")
            let headers = ["Authorization": "Basic \(token!)"]
            let asset = AVURLAsset(URL: NSURL(string: url)!, options: ["AVURLAssetHTTPHeaderFieldsKey": headers])
            let item = AVPlayerItem(asset: asset)
            let player = AVPlayer(playerItem: item)

            self.playerView.player = player

            player.play()
        }
    }

    func base64Encode(string: String) -> String? {
        if let data = string.dataUsingEncoding(NSUTF8StringEncoding) {
            return data.base64EncodedStringWithOptions(NSDataBase64EncodingOptions(rawValue: 0))
        } else {
            return nil
        }
    }
}
