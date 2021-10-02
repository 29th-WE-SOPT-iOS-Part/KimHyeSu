//
//  DataSecondVC.swift
//  29th-week01-seminar
//
//  Created by 김혜수 on 2021/10/02.
//

import UIKit

class DataSecondVC: UIViewController {

    @IBOutlet weak var dataLabel: UILabel!
    var message: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setMessageInLabel()
    }
    
    func setMessageInLabel(){
        if let msg = message {
            dataLabel.text = msg
            dataLabel.sizeToFit()
        }
    }
    
    @IBAction func touchUpToGoBack(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }

}
