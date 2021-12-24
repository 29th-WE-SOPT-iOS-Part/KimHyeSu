//
//  HomeTVC.swift
//  Youtube-Clone
//
//  Created by 김혜수 on 2021/10/29.
//

import UIKit

protocol videoInfoDelegate {
    func sendVideoInfo(video: VideoData)
}

class HomeTVC: UITableViewCell {
    
    public static let identifier = "HomeTVC"
    var nowVideo: VideoData?
    var delegate: videoInfoDelegate?

    @IBOutlet weak var videoImageView: UIImageView!
    @IBOutlet weak var channelImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setGesture()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setData(video: VideoData) {
        nowVideo = video
        videoImageView.image = UIImage(named: video.thumnail)
        channelImageView.image = UIImage(named: video.channel.image)
        titleLabel.text = video.title
        descriptionLabel.text = "\(video.channel.name) • 조회수 \(video.watch)회 • \(video.upload)"
    }
    
    func setGesture() {
        let gesture = UITapGestureRecognizer(target: self,
                                             action: #selector(tapImage))
        videoImageView.addGestureRecognizer(gesture)
        videoImageView.isUserInteractionEnabled = true
    }
    
    @objc func tapImage() {
        delegate?.sendVideoInfo(video: nowVideo!)
    }
}
