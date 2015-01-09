//
//  ViewController.swift
//  ShareExtensionDemo
//
//  Created by Eric Cheng on 10/23/14.
//  Copyright (c) 2014 Evernote Corporation. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let cellIdentifier = "cellIdentifier"
    
    var tableView:UITableView!
    
    var itemsToShare = [AnyObject]()
    
    var sampleString1 = "Evernote is awesome"
    var sampleString2 = "Scannable is easy and intuitive to use"
    var sampleString3 = "I use Skitch everyday"
    var sampleURL1 = NSURL(string: "https://evernote.com/products/scannable/")
    var sampleURL2 = NSURL(string: "https://developer.apple.com/xcode/")
    var sampleURL3 = NSURL(string: "https://blog.evernote.com/blog/2015/01/08/scannable-new-mobile-scanning-app-evernote/")
    var sampleImage1 = UIImage(named: "swift")
    var sampleImage2 = UIImage(named: "scannable")
    var sampleImage3 = UIImage(named: "wsj")
    
    var actionArray: [String] = ["Share text", "Share URL", "Share text + URL", "Share multiple texts", "Share multiple URLs", "Share image", "Share image + text", "Share image + URL", "Share image + text + URL", "Share multiple images"]
    
    override func loadView() {
        super.loadView()
        self.tableView = UITableView(frame: self.view.bounds, style: UITableViewStyle.Plain)
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.view.addSubview(self.tableView)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.title = NSString(string: "Evernote Share Extension Demo")
        
        // Register the UITableViewCell class with the tableView
        self.tableView?.registerClass(UITableViewCell.self, forCellReuseIdentifier: self.cellIdentifier)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // UITableViewDataSource methods
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return actionArray.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier(self.cellIdentifier) as UITableViewCell
        
        cell.textLabel?.text = self.actionArray[indexPath.row]
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.itemsToShare = [AnyObject]()
        switch (indexPath.row) {
        case 0:
            self.itemsToShare.append(sampleString1)
        case 1:
            self.itemsToShare.append(sampleURL3!)
        case 2:
            self.itemsToShare.append(sampleString2)
            self.itemsToShare.append(sampleURL2!)
        case 3:
            self.itemsToShare.append(sampleString1)
            self.itemsToShare.append(sampleString2)
            self.itemsToShare.append(sampleString3)
        case 4:
            self.itemsToShare.append(sampleURL1!)
            self.itemsToShare.append(sampleURL2!)
            self.itemsToShare.append(sampleURL3!)
        case 5:
            self.itemsToShare.append(sampleImage1!)
        case 6:
            self.itemsToShare.append(sampleImage2!)
            self.itemsToShare.append(sampleString1)
        case 7:
            self.itemsToShare.append(sampleImage3!)
            self.itemsToShare.append(sampleURL2!)
        case 8:
            self.itemsToShare.append(sampleImage1!)
            self.itemsToShare.append(sampleString2)
            self.itemsToShare.append(sampleURL3!)
        case 9:
            self.itemsToShare.append(sampleImage1!)
            self.itemsToShare.append(sampleImage2!)
            self.itemsToShare.append(sampleImage3!)
        default:
            assertionFailure("unexpected indexPath.row")
        }
        
        let activityViewController = UIActivityViewController(activityItems: itemsToShare, applicationActivities: nil)
        presentViewController(activityViewController, animated: true, completion: nil)
    }
}

