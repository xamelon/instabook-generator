//
//  PageCreator.swift
//  instabook
//
//  Created by Stanislav Buldakov on 07.12.2018.
//  Copyright © 2018 Stanislav Buldakov. All rights reserved.
//

import UIKit

class PageCreator: NSObject {

    static let multiplicator: CGFloat = 2.834645669291339
    static let padding = 5 * multiplicator
    static let width: CGFloat = 150 * multiplicator;
    static let imageSize: CGFloat = (width - (padding * 2)) * 0.6
    static let offset: CGFloat = (width - imageSize) / 2.0
    static let offset1MM: CGFloat = multiplicator
    
    class func createPage(withText text: String, imageURL: String, likes: Int, timestamp: Int) {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineBreakMode = .byTruncatingTail
        
        
        let str = NSAttributedString(string: text, attributes: [
            .font: UIFont(name: "MuseoSansCyrl-300", size: 10.0)!,
            .foregroundColor: UIColor.black,
            ])
        
        let timestamp: TimeInterval = TimeInterval(timestamp)
        let likesCount = likes
        UIGraphicsBeginPDFPage()
        let context = UIGraphicsGetCurrentContext()
        // delete this lines
        context?.setFillColor(UIColor.purple.withAlphaComponent(0.3).cgColor)
        //context?.fill(CGRect(x: padding, y: padding, width: width-padding*2, height: width))
        
        // MARK: - Draw caption
        UIGraphicsPushContext(context!)
        str.draw(in: CGRect(x: offset, y: padding+offset + imageSize + 5, width: imageSize, height: offset-20))
        UIGraphicsPopContext()
        
        // MARK: - Draw date
        let date = Date(timeIntervalSince1970: timestamp)
        let df = DateFormatter()
        df.locale = Locale(identifier: "ru_RU")
        df.dateFormat = "dd MMMM yyyy";
        let dateStr = df.string(from: date) as NSString
        UIGraphicsPushContext(context!)
        dateStr.draw(in: CGRect(x: offset, y: padding+offset-14-5, width: 200, height: 14),
                     withAttributes: [
                        .font: UIFont(name: "MuseoSansCyrl-100", size: 10.0)!,
                        .foregroundColor: UIColor(red: 149.0/255.0, green: 149.0/255.0, blue: 149.0/255.0, alpha: 1.0),
                        ])
        UIGraphicsPopContext()
        
        // MARK: - Draw likes count
        let likesStr = NSAttributedString(string: String(format: "❤️ %d", likesCount),
                                         attributes: [
                                            .font: UIFont(name: "MuseoSansCyrl-100", size: 10.0)!,
                                            .foregroundColor: UIColor(red: 149.0/255.0, green: 149.0/255.0, blue: 149.0/255.0, alpha: 1.0),
            ])
        let size = likesStr.size()
        UIGraphicsPushContext(context!)
        likesStr.draw(in: CGRect(x: offset+imageSize-size.width, y: padding+offset-14-5, width: size.width, height: 14))
        UIGraphicsPopContext()
        
        // MARK: - Draw image
        context?.setFillColor(UIColor.blue.withAlphaComponent(0.1).cgColor);
        //context?.fill(CGRect(x: padding+, y: <#T##CGFloat#>, width: imageSize, height: imageSize))
        
        
        let data = try! Data.init(contentsOf: URL(string: imageURL)!)
        let image = UIImage(data: data);
        let hfactor = image!.size.width / imageSize;
        let vfactor = image!.size.height / imageSize;
        
        let factor = fmax(hfactor, vfactor);
        
        let newWidth = image!.size.width / factor;
        let newHeight = image!.size.height / factor;
        let hWidth = (width - padding  * 2) / 2.0
        let hHeight = width / 2.0
        
        
        let newRect = CGRect(x: padding + (hWidth - newWidth/2.0), y: padding + (hHeight - newHeight/2), width: newWidth, height: newHeight)
        print("Factor: ", hfactor, vfactor)
        print("Image size: ", image?.size)
        UIGraphicsPushContext(context!)
        
        image?.draw(in: newRect)
        UIGraphicsPopContext()
        
        /* context?.move(to: CGPoint(x: 0, y: (padding + width/2)));
        context?.addLine(to: CGPoint(x: (padding*4 + width), y: (padding+width/2)))
        context?.move(to: CGPoint(x: (width/2), y: 0.0));
        context?.addLine(to: CGPoint(x: (width/2), y: (padding * 2 + width)))
        context?.strokePath() */
        
        
    }
    
    class func createLargeFirstPage(_ posts: [[String:Any]]) {
        let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true);
        let path = paths.first!
        var outURL = URL(fileURLWithPath: path)
        outURL = outURL.appendingPathComponent("firstPage.pdf")
        let firstPageWidth = 350 * multiplicator;
        let firstPageHeight = 190 * multiplicator;
        let rect = CGRect(x: 0, y: 0, width: firstPageWidth, height: firstPageHeight);
        
        UIGraphicsBeginPDFContextToFile(outURL.path, rect, nil)
        
        UIGraphicsBeginPDFPageWithInfo(CGRect(x: 0, y: 0, width: firstPageWidth, height: firstPageHeight), nil);
        let context = UIGraphicsGetCurrentContext()
        var colors = [
            UIColor(red: 79.0/255.0, green: 91.0/255.0, blue: 213.0/255.0, alpha: 0.8).cgColor,
            UIColor(red: 150.0/255.0, green: 47.0/255.0, blue: 191.0/255.0, alpha: 0.8).cgColor,
            UIColor(red: 214.0/255.0, green: 41.0/255.0, blue: 118.0/255.0, alpha: 0.8).cgColor,
            UIColor(red: 250.0/255.0, green: 126.0/255.0, blue: 30.0/255.0, alpha: 0.8).cgColor,
            UIColor(red: 254.0/255.0, green: 218.0/255.0, blue: 117.0/255.0, alpha: 0.8).cgColor
        ]
        //colors.reverse()
        let locations: [CGFloat] = [0.2, 0.4, 0.6, 0.8, 1.0]
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        let gradient = CGGradient(colorsSpace: colorSpace,
                                  colors: colors as CFArray,
                                  locations: locations)
        let startPoint = CGPoint(x: 0, y: 0);
        let endPoint = CGPoint(x: firstPageWidth, y: firstPageHeight);
        context?.drawLinearGradient(gradient!, start: startPoint, end: endPoint, options: []);
        var leftOffset = 12 * multiplicator;
        var topOffset = 16 * multiplicator;
        let tileSize = (158 * multiplicator) / 5
        let _tileSize = (158 * multiplicator) / 9
        var j: CGFloat = 0.0;
        var i: CGFloat = 0.0;
        for d in posts {
            
            let imageURL = d["ImageURL"] as! String
            let data = try? Data.init(contentsOf: URL(string: imageURL)!)
            if(data == nil) {
                continue;
            }
            let image = UIImage(data: data!);
            let newImage = PageCreator.imageScaledToSize(CGSize(width: tileSize, height: tileSize), image: image!)
            UIGraphicsPushContext(context!)
            if(i >= 5) {
                leftOffset = 12 * multiplicator + 10 * multiplicator;
            } else {
                leftOffset = 12 * multiplicator
            }
            //context?.draw(image!.cgImage!, in: );
            newImage.draw(in: CGRect(x: tileSize*i + leftOffset, y: tileSize*j+topOffset, width: tileSize, height: tileSize),
                          blendMode: CGBlendMode.screen, alpha: 1.0)
            
            
            UIGraphicsPopContext()
            print("First page: ", i, j);
            i = i+1
            
            if i > 9 {
                j = j+1
                i = 0
            }
            if j > 8 {
                break;
            }
        }
        
        let nt = Bundle.main.path(forResource: "instabook_title", ofType: "png")
        let image = UIImage(contentsOfFile: nt!);
        image?.draw(in: CGRect(x: leftOffset + 10 * multiplicator + _tileSize * 9.5, y: _tileSize * 2 + topOffset, width: _tileSize * 7, height: _tileSize * 5),
                    blendMode: .screen,
                    alpha: 1.0);
        
        UIGraphicsEndPDFContext()
    }
    
    class func createFirstPage(_ posts: [[String:Any]]) {
        
        UIGraphicsBeginPDFPage()
        let context = UIGraphicsGetCurrentContext()
        var colors = [
            UIColor(red: 79.0/255.0, green: 91.0/255.0, blue: 213.0/255.0, alpha: 0.8).cgColor,
            UIColor(red: 150.0/255.0, green: 47.0/255.0, blue: 191.0/255.0, alpha: 0.8).cgColor,
            UIColor(red: 214.0/255.0, green: 41.0/255.0, blue: 118.0/255.0, alpha: 0.8).cgColor,
            UIColor(red: 250.0/255.0, green: 126.0/255.0, blue: 30.0/255.0, alpha: 0.8).cgColor,
            UIColor(red: 254.0/255.0, green: 218.0/255.0, blue: 117.0/255.0, alpha: 0.8).cgColor
        ]
        //colors.reverse()
        let locations: [CGFloat] = [0.2, 0.4, 0.6, 0.8, 1.0]
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        let gradient = CGGradient(colorsSpace: colorSpace,
                                  colors: colors as CFArray,
                                  locations: locations)
        let startPoint = CGPoint(x: offset1MM, y: offset1MM);
        let endPoint = CGPoint(x: width-offset1MM, y: width-offset1MM);
        context?.drawLinearGradient(gradient!, start: startPoint, end: endPoint, options: []);
        
        let tileSize = (width - offset1MM * 2) / 9
        var i: CGFloat = 0
        var j: CGFloat = 0
        print("Last color alpha: ", colors.last?.alpha)
        print("Posts count: ", posts.count)
        for d in posts {
            let imageURL = d["ImageURL"] as! String
            let data = try! Data.init(contentsOf: URL(string: imageURL)!)
            let image = UIImage(data: data);
            let newImage = PageCreator.imageScaledToSize(CGSize(width: tileSize, height: tileSize), image: image!)
            UIGraphicsPushContext(context!)
            
            //context?.draw(image!.cgImage!, in: );
            newImage.draw(in: CGRect(x: tileSize*i + offset1MM, y: tileSize*j+offset1MM, width: tileSize, height: tileSize),
                        blendMode: CGBlendMode.screen, alpha: 1.0)
            
            
            UIGraphicsPopContext()
            print("First page: ", i, j);
            i = i+1
            if i == 8 && j == 8 {
                break
            }
            if i > 8 {
                j = j+1
                i = 0
            }
            
        }
        let nt = Bundle.main.path(forResource: "instabook_title", ofType: "png")
        let image = UIImage(contentsOfFile: nt!);
        image?.draw(in: CGRect(x: tileSize * 1 + offset1MM, y: tileSize * 2 + offset1MM, width: tileSize * 7, height: tileSize * 5),
                    blendMode: .screen,
                    alpha: 1.0);
        
        
        
    }
    
    class func createLastPage(_ posts: [[String:Any]]) {
        
        UIGraphicsBeginPDFPage()
        let context = UIGraphicsGetCurrentContext()
        var colors = [
            UIColor(red: 79.0/255.0, green: 91.0/255.0, blue: 213.0/255.0, alpha: 0.8).cgColor,
            UIColor(red: 150.0/255.0, green: 47.0/255.0, blue: 191.0/255.0, alpha: 0.8).cgColor,
            UIColor(red: 214.0/255.0, green: 41.0/255.0, blue: 118.0/255.0, alpha: 0.8).cgColor,
            UIColor(red: 250.0/255.0, green: 126.0/255.0, blue: 30.0/255.0, alpha: 0.8).cgColor,
            UIColor(red: 254.0/255.0, green: 218.0/255.0, blue: 117.0/255.0, alpha: 0.8).cgColor
        ]
        //colors.reverse()
        let locations: [CGFloat] = [0.2, 0.4, 0.6, 0.8, 1.0]
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        let gradient = CGGradient(colorsSpace: colorSpace,
                                  colors: colors as CFArray,
                                  locations: locations)
        let startPoint = CGPoint(x: offset1MM, y: offset1MM);
        let endPoint = CGPoint(x: width-offset1MM, y: width-offset1MM);
        context?.drawLinearGradient(gradient!, start: startPoint, end: endPoint, options: []);
        
        let tileSize = (width - offset1MM * 2) / 9
        var i: CGFloat = 0
        var j: CGFloat = 0
        print("Last color alpha: ", colors.last?.alpha)
        print("Posts count: ", posts.count)
        for d in posts {
            let imageURL = d["ImageURL"] as! String
            let data = try! Data.init(contentsOf: URL(string: imageURL)!)
            let image = UIImage(data: data);
            let newImage = PageCreator.imageScaledToSize(CGSize(width: tileSize, height: tileSize), image: image!)
            UIGraphicsPushContext(context!)
            
            //context?.draw(image!.cgImage!, in: );
            newImage.draw(in: CGRect(x: tileSize*i + offset1MM, y: tileSize*j+offset1MM, width: tileSize, height: tileSize),
                          blendMode: CGBlendMode.screen, alpha: 1.0)
            
            
            UIGraphicsPopContext()
            print("Last page: ", i, j);
            i = i+1
            if i == 8 && j == 8 {
                break
            }
            if i > 8 {
                j = j+1
                i = 0
            }
            
        }
        
    }
    
    class func createDocument() {
        let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true);
        let path = paths.first!
        var outURL = URL(fileURLWithPath: path)
        outURL = outURL.appendingPathComponent("output.pdf")
        var rect = CGRect(x: 0, y: 0, width: width+padding*2, height: width+padding*2)
        
        UIGraphicsBeginPDFContextToFile(outURL.path, rect, nil)
        let context = UIGraphicsGetCurrentContext()
       
    }
    
    class func closeDocument() {
        UIGraphicsEndPDFContext()
    }
    
    class func imageScaledToSize(_ size: CGSize, image: UIImage) -> UIImage {
        var newSize: CGSize! = CGSize.zero
        let aspectRatio = image.size.width / image.size.height
        if aspectRatio > 1.0 {
            newSize.width = image.size.height
            newSize.height = image.size.height
        } else {
            newSize.width = image.size.width
            newSize.height = image.size.width
        }
        
        let cgImage = image.cgImage!
        let newImage = cgImage.cropping(to: CGRect(x: (image.size.width - newSize.width) / 2.0,
                                                   y: (image.size.height - newSize.height) / 2.0,
                                                   width: newSize.width,
                                                   height: newSize.height))
        
        /* UIGraphicsBeginImageContext(newSize)
        let context = UIGraphicsGetCurrentContext()
        image.draw(in: CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height));
        
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext() */
        let img = UIImage(cgImage: newImage!);
        return img
    }
}
