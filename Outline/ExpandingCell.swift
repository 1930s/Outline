//
//  ExpandingCell.swift
//  Outline
//
//  Created by Ash Zade on 2017-12-26.
//  Copyright © 2017 Ash Zade. All rights reserved.
//

import UIKit

class ExpandingCell: UITableViewCell {
    @IBOutlet weak var textView: UITextView!
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.frame = UIEdgeInsetsInsetRect(contentView.frame, UIEdgeInsetsMake(0, 20, 0, 16))
    }
}