//
//  ViewController.swift
//  BitMug
//
//  Created by BS901 on 5/30/22.
//

import UIKit

class HomeViewController: UIViewController {
    
    private var headerView: DashboardUIView?
    
    private var userButton: UIButton = {
        let button = UIButton()
        button.setTitle("nemes1s\nUSR4421", for: .normal)
        button.layer.borderWidth = 1
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.borderColor = UIColor.clear.cgColor
        button.titleLabel?.lineBreakMode = .byWordWrapping

        return button
    }()
    
    private let homeFeedTable: UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        table.register(CollectionViewTableViewCell.self, forCellReuseIdentifier: "CollectionViewTableViewCell")
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        view.addSubview(homeFeedTable)
        
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.backgroundColor = .systemRed
        navigationItem.rightBarButtonItem = UIBarButtonItem.navBarButtonItem(self, imageName: "bitcoinsign.circle.fill")
        navigationItem.leftBarButtonItem = UIBarButtonItem.navBarButtonItem(self, imageName: "person.circle.fill")

        
        homeFeedTable.delegate = self
        homeFeedTable.dataSource = self
        
        let headerView = DashboardUIView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: 300))
        homeFeedTable.tableHeaderView = headerView
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        homeFeedTable.frame = view.bounds
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CollectionViewTableViewCell.identifier, for: indexPath) as? CollectionViewTableViewCell else {
            return UITableViewCell()
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
}
