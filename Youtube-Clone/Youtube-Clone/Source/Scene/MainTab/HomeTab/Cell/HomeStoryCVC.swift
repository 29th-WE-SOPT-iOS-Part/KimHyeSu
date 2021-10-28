//
//  HomeStoryCVC.swift
//  Youtube-Clone
//
//  Created by 김혜수 on 2021/10/29.
//

import UIKit

class HomeStoryCVC: UICollectionViewCell {
    
    public static let identifier = "HomeStoryCVC"
    
    @IBOutlet weak var storyProfileImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    func setData(image: String, name: String) {
        storyProfileImageView.image = UIImage(named: image)
        nameLabel.text = name
    }
    
}
