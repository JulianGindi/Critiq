//
//  APIHelper.swift
//  Critiq
//
//  Created by Thomas Degry and Julian Gindi on 3/8/15.
//  Copyright (c) 2015 Thomas Degry and Julian Gindi. All rights reserved.
//

import Cocoa
import Alamofire

protocol APIHelperDelegate {
    func didReceiveUrl(url:String)
}

class APIHelper: NSObject {
    
    var delegate:APIHelperDelegate?

    func makeRequest(content:String) {
        Alamofire.request(.POST, "https://dpaste.de/api/", parameters: ["content": content])
            .responseJSON { (request, response, data, error) in
                if let url: AnyObject = data {
                    let urlString = url as String
                    self.didReceiveUrl(urlString)
                }
        }
    }
    
    func didReceiveUrl(url:String) {
        self.delegate?.didReceiveUrl(url)
    }
}
