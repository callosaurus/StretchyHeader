//
//  NewsItemCell.swift
//  StretchyHeader
//
//  Created by Callum Davies on 2017-03-14.
//  Copyright © 2017 Callum Davies. All rights reserved.
//

import UIKit

class NewsItemCell: UITableViewCell {

    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var headlineLabel: UILabel!

    var newsItem: NewsItem? {
        didSet
        {
            if let item = newsItem
            {
                categoryLabel.text = item.category.toString()
                categoryLabel.textColor = item.category.toColor()
                headlineLabel.text = item.summary
            }
            else
            {
                categoryLabel.text = nil
                headlineLabel.text = nil
            }
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
