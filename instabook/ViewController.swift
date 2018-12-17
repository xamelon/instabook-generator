//
//  ViewController.swift
//  instabook
//
//  Created by Stanislav Buldakov on 07.12.2018.
//  Copyright © 2018 Stanislav Buldakov. All rights reserved.
//

import UIKit

struct Post : Decodable {
    let Date: Int
    let Likes: Int
    let Text: String
    let ImageURL: String
}



class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nt = Bundle.main.path(forResource: "source", ofType: "json")
        let url = URL(fileURLWithPath: nt!)
        let str = try? String(contentsOfFile: nt!)
        let data = try! Data.init(contentsOf: url)
        let dict = try! JSONSerialization.jsonObject(with: data, options: .allowFragments)
        var array = dict as! [[String:Any]]
        print(dict)
        PageCreator.createLargeFirstPage(array)
        /* PageCreator.createDocument()
        
        //PageCreator.createFirstPage(Array(array[0...82]))
        var i = 0;
        for d in array {
            
            let text = d["Text"] as! String
            let likes = d["Likes"] as! Int
            var timestamp = d["Date"] as! Int
            var time = String(format: "%lld", timestamp);
            var index = time.index(time.startIndex, offsetBy: 10);
            time = String(time[..<index]);
            timestamp = Int(time)!;
            
            let imageURL = d["ImageURL"] as! String
            PageCreator.createPage(withText: text, imageURL: imageURL, likes: likes, timestamp: timestamp)
            i = i+1;
            if(i > 49 ) {
                break
            }
        }
        //PageCreator.createLastPage(Array(array[82...164]))
        PageCreator.closeDocument() */
        
        print("End generating pdf") 
    }


}

