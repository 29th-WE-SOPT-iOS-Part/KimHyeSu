//
//  HomeTabVC.swift
//  Youtube-Clone
//
//  Created by κΉνμ on 2021/10/19.
//

import UIKit

class HomeTabVC: UIViewController {
    
    // MARK: - Property
    var videoList: [VideoData] = []
    var storyList: [Channel] = []
    
    // MARK: - IBOutlet
    @IBOutlet weak var videoTableView: UITableView!
    @IBOutlet weak var storyCollectionView: UICollectionView!
    
    // MARK: - VC LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setDummyData()
        registerXib()
        setTableView()
        setCollectionView()
    }
    
    // MARK: - Set TableView, CollectionView
    func registerXib(){
        let homeNib = UINib(nibName: HomeTVC.identifier, bundle: nil)
        videoTableView.register(homeNib, forCellReuseIdentifier: HomeTVC.identifier)
    }
    
    func setTableView() {
        videoTableView.delegate = self
        videoTableView.dataSource = self
    }
    
    func setCollectionView() {
        storyCollectionView.delegate = self
        storyCollectionView.dataSource = self
    }
    
    // MARK: - IBAction
    @IBAction func loginButtonClicked(_ sender: Any) {
        guard let loginVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LoginFristVC") as? LoginVC else { return }
        let loginNVC = UINavigationController(rootViewController: loginVC)
        loginNVC.modalPresentationStyle = .fullScreen
        self.present(loginNVC, animated: true, completion: nil)
    }
    
}

// MARK: - TableView Delegate
extension HomeTabVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UIScreen.main.bounds.width * (306/375)
    }
}

extension HomeTabVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videoList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: HomeTVC.identifier, for: indexPath) as? HomeTVC else {
            return UITableViewCell()
        }
        let data = videoList[indexPath.row]
        cell.setData(videoImage: data.thumnail,
                     channelImage: data.channel.image,
                     title: data.title,
                     channel: data.channel.name,
                     watch: data.watch,
                     upload: data.upload)
        return cell
    }
}

// MARK: - CollectionView Delegate
extension HomeTabVC: UICollectionViewDelegate {

}

extension HomeTabVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return storyList.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeStoryCVC.identifier, for: indexPath) as? HomeStoryCVC else {
            return UICollectionViewCell()
        }
        cell.setData(image: storyList[indexPath.row].image,
                     name: storyList[indexPath.row].name)
        return cell
    }


}

extension HomeTabVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            return CGSize(width: 72, height: 104)
        }
        
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
            return UIEdgeInsets.zero
        }
        
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
            return 0
        }
        
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
            return 0
        }
}

extension HomeTabVC {
    func setDummyData() {
        videoList.append(contentsOf:
                            [VideoData(thumnail: "wesoptiOSPart", title: "1μ°¨ iOS μΈλ―Έλ : iOS μ»΄ν¬λνΈ μ΄ν΄, Xcode κΈ°λ³Έ μ¬μ©λ², View νλ©΄μ ν", channel: Channel(image: "wesoptProfile", name: "WE SOPT"), watch: 130, upload: "3μ£Ό μ "),
                             VideoData(thumnail: "wesoptiOSPart", title: "2μ°¨ iOS μΈλ―Έλ : AutoLayout, StackView, TabBarController", channel: Channel(image: "wesoptProfile", name: "WE SOPT"), watch: 130, upload: "3μ£Ό μ "),
                             VideoData(thumnail: "wesoptiOSPart", title: "μμννΈ", channel: Channel(image: "wesoptProfile", name: "WE SOPT"), watch: 130, upload: "3μ£Ό μ "),
                             VideoData(thumnail: "wesoptiOSPart", title: "3μ°¨ iOS μΈλ―Έλ : ScrollView, Delegate Pattern, TableView, CollectionView", channel: Channel(image: "wesoptProfile", name: "WE SOPT"), watch: 130, upload: "3μ£Ό μ "),
                             VideoData(thumnail: "wesoptiOSPart", title: "4μ°¨ iOS μΈλ―Έλ : Cocoapods & Networking, REST API", channel: Channel(image: "wesoptProfile", name: "WE SOPT"), watch: 130, upload: "3μ£Ό μ "),
                             VideoData(thumnail: "wesoptiOSPart", title: "7μ°¨ iOS μΈλ―Έλ : Animationκ³Ό μ μ€μ³, λ°μ΄ν° μ λ¬ μ¬ν ", channel: Channel(image: "wesoptProfile", name: "WE SOPT"), watch: 130, upload: "3μ£Ό μ "),
                             VideoData(thumnail: "wesoptiOSPart", title: "μμννΈ", channel: Channel(image: "wesoptProfile", name: "WE SOPT"), watch: 130, upload: "3μ£Ό μ ")
                            ])
        
        storyList.append(contentsOf:
                            [Channel(image: "ggamju1", name: "κΉμ£Ό"),
                             Channel(image: "ggamju2", name: "κΉμ£Ό"),
                             Channel(image: "ggamju3", name: "κΉμ£Ό"),
                             Channel(image: "ggamju4", name: "κΉμ£Ό"),
                             Channel(image: "ggamju5", name: "κΉμ£Ό"),
                             Channel(image: "ggamju6", name: "κΉμ£Ό"),
                             Channel(image: "ggamju7", name: "κΉμ£Ό")
                            ])
    }
}
