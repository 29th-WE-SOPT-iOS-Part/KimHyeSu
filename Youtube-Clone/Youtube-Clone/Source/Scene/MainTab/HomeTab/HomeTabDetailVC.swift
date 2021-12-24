//
//  HomeTabDetailVC.swift
//  Youtube-Clone
//
//  Created by 김혜수 on 2021/12/24.
//

import UIKit

class HomeTabDetailVC: UIViewController {
    
    var videoData: VideoData?
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!
    
    // MARK: - VC LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setData()
    }
    
    func setData() {
        guard let data = videoData else { return }
        imageView.image = UIImage(named: data.thumnail)!
        titleLabel.text = data.title
        detailLabel.text = "조회수 \(data.watch)회 • \(data.upload)"
    }
    
    @IBAction func closeButtonClicked(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
}

