//
//  ViewController.swift
//  SOS
//
//  Created by Ga Wai Lau on 08/02/2018.
//  Copyright © 2018 Ga Wai Lau. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    private let btnImgView = UIView()
    private let rightNavBtn = UIBarButtonItem()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        view.backgroundColor = .white
        
        setupNavigationView()
        
        setupViews()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupNavigationView() {
        self.navigationItem.title = "SOS"
        self.navigationController?.navigationBar.barTintColor = .white
        
        rightNavBtn.title = "Settings"
        rightNavBtn.target = self
        rightNavBtn.action = #selector(toSettings)
        self.navigationItem.rightBarButtonItem = rightNavBtn
    }

    func setupViews() {
        let height = view.frame.height
        let width = view.frame.width
        
        btnImgView.frame = CGRect(x: 0, y: height / 7.0, width: width, height: height)
        btnImgView.backgroundColor = .red
        view.addSubview(btnImgView)
    }

    func toSettings() {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 10, left: 15, bottom: 10, right: 15)
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: view.frame.width - 50, height: view.frame.height / 3.0 - 20)
        
        let vc = SettingsCollectionViewController(collectionViewLayout: layout)
        
        self.navigationController?.pushViewController(vc, animated: false)
    }
}

