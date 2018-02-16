//
//  SettingsCollectionViewCell.swift
//  SOS
//
//  Created by Ga Wai Lau on 09/02/2018.
//  Copyright © 2018 Ga Wai Lau. All rights reserved.
//

import UIKit

class SettingsCollectionViewCell: UICollectionViewCell {
    
    var btnsArray = Array(repeating: UIButton(), count: 3)
    let thumbView = UIView()    // the main SOS Image
    let thumbBtn = UIButton()   // the btn to play/stop the alarm in settings
    
    private let gesturesName = ["Single Tap", "Double Taps", "Long Press"]
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .black
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        thumbView.translatesAutoresizingMaskIntoConstraints = false
        thumbBtn.translatesAutoresizingMaskIntoConstraints = false
        thumbView.backgroundColor = UIColor.cyan
        thumbBtn.backgroundColor = UIColor.yellow
        thumbView.addSubview(thumbBtn)
        contentView.addSubview(thumbView)
        
        for i in 0 ..< btnsArray.count {
            btnsArray[i] = UIButton()
            let btn = btnsArray[i]
            switch i {
            case 0:
                btn.backgroundColor = UIColor.red
                btn.setTitle(gesturesName[i], for: .normal)
            case 1:
                btn.backgroundColor = UIColor.blue
                btn.setTitle(gesturesName[i], for: .normal)
            default:
                btn.backgroundColor = UIColor.green
                btn.setTitle(gesturesName[i], for: .normal)
            }
            btn.translatesAutoresizingMaskIntoConstraints = false
            contentView.addSubview(btn)
        }
        
        setupConstraints()
    }
    
    func setupConstraints() {
        
        contentView.addConstraint(NSLayoutConstraint(item: thumbView, attribute: .width, relatedBy: .equal, toItem: contentView, attribute: .width, multiplier: 0.5, constant: 0))  //thumbview width = 0.5 contentview
        
        contentView.addConstraintsWithFormat(format: "H:|-20-[v0]-20-[v1]-20-|", views: thumbView, btnsArray[0])
        contentView.addConstraintsWithFormat(format: "V:|-20-[v0]-20-|", views: thumbView)
//        contentView.addConstraintsWithFormat(format: "V:|-30-[v0]-20-[v1]-20-[v2]", views: btnsArray[0], btnsArray[1], btnsArray[2])
        
        //MARK: - btns Constraints
        // height
        contentView.addConstraint(NSLayoutConstraint(item: btnsArray[0], attribute: .height, relatedBy: .equal, toItem: thumbView, attribute: .height, multiplier: 0.2, constant: 0))
        contentView.addConstraint(NSLayoutConstraint(item: btnsArray[1], attribute: .height, relatedBy: .equal, toItem: btnsArray[0], attribute: .height, multiplier: 1, constant: 0))
        contentView.addConstraint(NSLayoutConstraint(item: btnsArray[2], attribute: .height, relatedBy: .equal, toItem: btnsArray[0], attribute: .height, multiplier: 1, constant: 0))
        
        //width
        contentView.addConstraint(NSLayoutConstraint(item: btnsArray[1], attribute: .width, relatedBy: .equal, toItem: btnsArray[0], attribute: .width, multiplier: 1.0, constant: 0))
        contentView.addConstraint(NSLayoutConstraint(item: btnsArray[2], attribute: .width, relatedBy: .equal, toItem: btnsArray[0], attribute: .width, multiplier: 1.0, constant: 0))
        
        //x
        contentView.addConstraint(NSLayoutConstraint(item: btnsArray[1], attribute: .centerX, relatedBy: .equal, toItem: btnsArray[0], attribute: .centerX, multiplier: 1, constant: 0))
        contentView.addConstraint(NSLayoutConstraint(item: btnsArray[2], attribute: .centerX, relatedBy: .equal, toItem: btnsArray[0], attribute: .centerX, multiplier: 1, constant: 0))
        
        //y
        contentView.addConstraint(NSLayoutConstraint(item: btnsArray[1], attribute: .centerY, relatedBy: .equal, toItem: thumbView, attribute: .centerY, multiplier: 1, constant: 0))
        
        //top
        contentView.addConstraint(NSLayoutConstraint(item: btnsArray[0], attribute: .top, relatedBy: .equal, toItem: thumbView, attribute: .top, multiplier: 1, constant: 0))
        
        //bottom
        contentView.addConstraint(NSLayoutConstraint(item: btnsArray[2], attribute: .bottom, relatedBy: .equal, toItem: thumbView, attribute: .bottom, multiplier: 1, constant: 0))
        
        //MARK:- thumbView Constraint
        thumbView.addConstraint(NSLayoutConstraint(item: thumbBtn, attribute: .centerX, relatedBy: .equal, toItem: thumbView, attribute: .centerX, multiplier: 1, constant: 0))
        thumbView.addConstraint(NSLayoutConstraint(item: thumbBtn, attribute: .centerY, relatedBy: .equal, toItem: thumbView, attribute: .centerY, multiplier: 1, constant: 0))
        thumbView.addConstraint(NSLayoutConstraint(item: thumbBtn, attribute: .height, relatedBy: .equal, toItem: thumbView, attribute: .height, multiplier: 0.5, constant: 0))
        thumbView.addConstraint(NSLayoutConstraint(item: thumbBtn, attribute: .width, relatedBy: .equal, toItem: thumbView, attribute: .width, multiplier: 0.5, constant: 0))
    }
}
