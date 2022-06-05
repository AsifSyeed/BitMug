//
//  ViewController.swift
//  BitMug
//
//  Created by BS901 on 5/30/22.
//

import UIKit

class HomeViewController: UIViewController {
    
    var profileNavBar: UIView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        
        return $0
    }(UserProfileMenuView(text: "nemes1s"))
    
    lazy var homeTableView: UITableView = {
        
        $0.register(DashboardTableViewCell.self, forCellReuseIdentifier: DashboardTableViewCell.identifier)
        $0.backgroundColor = .clear
        $0.separatorStyle = .none
        $0.delegate = self
        $0.dataSource = self
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 10, right: 0)
        $0.showsVerticalScrollIndicator = false
        
        return $0
        
    }(UITableView())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        
        navigationController?.navigationBar.standardAppearance.setBackIndicatorImage(UIImage(systemName: "arrow.left")!.withAlignmentRectInsets(.init(top: 0, left: -10, bottom: 0, right: 0)), transitionMaskImage: UIImage(systemName: "arrow.left")!.withAlignmentRectInsets(.init(top: 0, left: -10, bottom: 0, right: 0)))
        navigationController?.navigationBar.tintColor = UIColor.systemGray
        navigationItem.backButtonTitle = ""
        
        DashBoardDataView.delegate = self
        
        view.addSubview(profileNavBar)
        view.addSubview(homeTableView)
        
        setBackground()
        applyHomeVCConstraints()
        
        fetchData()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    func setBackground() {
        
        let bg = UIImage(named: "background")
        
        var imageView: UIImageView!
        imageView = UIImageView(frame: view.bounds)
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = bg
        imageView.center = view.center
        
        view.addSubview(imageView)
        
        self.view.sendSubviewToBack(imageView)
    }
    
    func applyHomeVCConstraints() {
        let profileNavBarConstraints = [
            profileNavBar.topAnchor.constraint(equalTo: view.topAnchor, constant: 40),
            profileNavBar.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            profileNavBar.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            profileNavBar.heightAnchor.constraint(equalToConstant: 50)
        ]
        
        let homeTableViewConstraints = [
            homeTableView.topAnchor.constraint(equalTo: profileNavBar.bottomAnchor, constant: -5),
            homeTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            homeTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            homeTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ]
        
        NSLayoutConstraint.activate(profileNavBarConstraints)
        NSLayoutConstraint.activate(homeTableViewConstraints)
    }
    
    private func fetchData() {
        APICaller.shared.getAllCryptoData { results in
            
            switch results {
            case .success(let cryptos):
                print(cryptos)
            case .failure(let error):
                print(error)
            }
        }
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: DashboardTableViewCell.identifier) as? DashboardTableViewCell else {
            return UITableViewCell()
        }
        
        cell.configuration()
        cell.selectionStyle = .none
        
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
}

extension HomeViewController: DashboardDataViewDelegate {
    
    func homeTableViewReload() {
        DispatchQueue.main.async {
            self.homeTableView.reloadData()
        }
    }
}
