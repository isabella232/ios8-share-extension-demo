//
//  ENEXItemSource.swift
//  ShareExtensionDemo
//
//  Created by Eric Cheng on 1/21/15.
//  Copyright (c) 2015 Evernote Corporation. All rights reserved.
//

import UIKit

class ENEXItemSource: NSObject, UIActivityItemSource {
    var path : String?
    
    init(path: String){
        self.path = path
    }
    
    func activityViewControllerPlaceholderItem(activityViewController: UIActivityViewController) -> AnyObject {
        return "sample enex file"
    }
    
    func activityViewController(activityViewController: UIActivityViewController, itemForActivityType activityType: String) -> AnyObject? {
        var filePath = NSBundle.mainBundle().pathForResource(path, ofType: "enex")
        println("sharing path is \(filePath)")
        return NSData(contentsOfFile: filePath!)
    }
    
    func activityViewController(activityViewController: UIActivityViewController, dataTypeIdentifierForActivityType activityType: String?) -> String {
        return "com.evernote.note.export"
    }
}
