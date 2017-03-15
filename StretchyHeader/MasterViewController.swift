//
//  MasterViewController.swift
//  StretchyHeader
//
//  Created by Callum Davies on 2017-03-14.
//  Copyright © 2017 Callum Davies. All rights reserved.
//

import UIKit
import CoreData

private let kTableHeaderHeight: CGFloat = 267.0

class MasterViewController: UITableViewController {
    
    @IBOutlet weak var header: UIView!
    @IBOutlet weak var dateLabel: UILabel!
    var headerView: UIView!
    
    let items = [
        NewsItem(category: .World, summary: "Kim Jong-un threatens ‘MERCILESS’ attack on America in retaliation for South Korea drills."),
        NewsItem(category: .Europe, summary: "Pilot dies after Irish coastguard crash"),
        NewsItem(category: .MiddleEast, summary: "Syria jets deliberately bombed spring - UN"),
        NewsItem(category: .Africa, summary: "Kenya doctors end 100-day strike"),
        NewsItem(category: .AsiaPacific, summary: "Rhino horns worth $5m seized in Thailand"),
        NewsItem(category: .Americas, summary: "Top US Marine vows action on nude photos"),
        NewsItem(category: .World, summary: "Google balloon mistaken for UFO as it crashes in Colombia"),
        NewsItem(category: .Europe, summary: "Poland says Minnesota man was Nazi commander")
    ]
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 65
        
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM"
        let dateString = formatter.string(from: date)
        self.dateLabel.text = dateString
        
        headerView = tableView .tableHeaderView
        tableView.tableHeaderView = nil
        tableView.addSubview(headerView)
        
        tableView.contentInset = UIEdgeInsets(top:kTableHeaderHeight, left: 0, bottom: 0, right: 0)
        tableView.contentOffset = CGPoint(x: 0, y: -kTableHeaderHeight)
        updateHeaderView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Segues

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }

    // MARK: - Table View

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "newsCell", for: indexPath) as! NewsItemCell
        let item = items[indexPath.row]
        cell.newsItem = item
        cell.headlineLabel.numberOfLines = 0
        return cell
    }

    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
    }
    
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        updateHeaderView()
    }
    
    func updateHeaderView() -> Void {
        
        //set the frame of our headerview as the table view scrolls
        var headerRect = CGRect(x: 0, y: -kTableHeaderHeight, width: tableView.bounds.width, height: kTableHeaderHeight)
        if tableView.contentOffset.y < -kTableHeaderHeight {
            headerRect.origin.y = tableView.contentOffset.y
            headerRect.size.height = -tableView.contentOffset.y
        }
        header.frame = headerRect
    }

}

