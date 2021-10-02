//
//  ViewController.swift
//  29th-week01-seminar
//
//  Created by 김혜수 on 2021/10/02.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var testLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Button IBAction
    @IBAction func touchUpToChangeLabel(_ sender: Any) {
        testLabel.text = "WE SOPT 1차 세미나"
        testLabel.sizeToFit() // 라벨 크기를 글자에 맞게 변경해주는 메서드
    }
    
    // MARK: - 화면전환
    @IBAction func touchUpToSecondVC(_ sender: Any) {
        guard let secondVC = self.storyboard?.instantiateViewController(withIdentifier: "SecondModalVC") else { return }
        // MARK: Modal
//        secondVC.modalPresentationStyle = .fullScreen
//        secondVC.modalTransitionStyle = .crossDissolve
//        self.present(secondVC, animated: true, completion: nil)
        
        // MARK: Navigation Controller
        self.navigationController?.pushViewController(secondVC, animated: true)
        
    }
}
