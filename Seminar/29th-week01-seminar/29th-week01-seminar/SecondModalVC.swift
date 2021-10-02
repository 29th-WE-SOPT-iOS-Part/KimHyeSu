//
//  SecondModalVC.swift
//  29th-week01-seminar
//
//  Created by 김혜수 on 2021/10/02.
//

import UIKit

class SecondModalVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - 뒤로가기
    @IBAction func touchUpGoBack(_ sender: Any) {
        //self.dismiss(animated: true, completion: nil)
        self.navigationController?.popViewController(animated: true)
    }
}
