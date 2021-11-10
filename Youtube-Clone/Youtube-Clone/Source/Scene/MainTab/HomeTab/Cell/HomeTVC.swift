//
//  HomeTVC.swift
//  Youtube-Clone
//
//  Created by 김혜수 on 2021/10/29.
//

import UIKit

class HomeTVC: UITableViewCell {
    
    public static let identifier = "HomeTVC"

    @IBOutlet weak var videoImageView: UIImageView!
    @IBOutlet weak var channelImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setData(videoImage: String,
                 channelImage: String,
                 title: String,
                 channel: String,
                 watch: Int,
                 upload: String) {
        videoImageView.image = UIImage(named: videoImage)
        channelImageView.image = UIImage(named: channelImage)
        titleLabel.text = title
        descriptionLabel.text = "\(channel) • 조회수 \(watch)회 • \(upload)"
    }
    
}
