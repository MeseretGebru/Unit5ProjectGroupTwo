//
//  MenuCellTableViewCell.swift
//  Unit5GroupProjectTwo
//
//  Created by C4Q on 2/8/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import UIKit
import SnapKit

class MenuCell: UITableViewCell {

    lazy var menuImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        return iv
    }()
    lazy var menuLabel: UILabel = {
       let lab = UILabel()
        lab.font = UIFont.boldSystemFont(ofSize: 18)
        return lab
    }()
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: "menuCell")
        commonInit()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        setupViews()
    }
    private func setupViews() {
       setupMenuImageView()
       setupMenuLabel()
        
    }
    private func setupMenuImageView() {
        addSubview(menuImageView)
        menuImageView.snp.makeConstraints { (make) in
            make.leading.equalToSuperview().offset(8)
            make.top.equalToSuperview().offset(8)
            make.bottom.equalToSuperview().offset(-8)
            make.width.equalTo(menuImageView.snp.height)
        }
    }
    private func setupMenuLabel() {
        addSubview(menuLabel)
        menuLabel.snp.makeConstraints { (make) in
            make.leading.equalTo(menuImageView.snp.trailing).offset(18)
            make.height.equalTo(menuImageView.snp.height)
            make.centerY.equalToSuperview()
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
