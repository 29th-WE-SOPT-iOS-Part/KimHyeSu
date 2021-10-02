//
//  DataFirstVC.swift
//  29th-week01-seminar
//
//  Created by 김혜수 on 2021/10/02.
//

import UIKit

class DataFirstVC: UIViewController {
    
    @IBOutlet weak var dataTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func touchUpToSendData(_ sender: Any) {
        guard let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "DataSecondVC") as? DataSecondVC else {
            return
        }
        nextVC.message = dataTextField.text!
        nextVC.modalPresentationStyle = .fullScreen
        self.present(nextVC, animated: true, completion: nil)
    }

}
