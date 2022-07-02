//
//  MoviewListVM.swift
//  Assignment
//
//  Created by Nitin on 2/7/2022.
//

import UIKit

protocol MovieListModelDelegate: NSObjectProtocol {
    func fetchSuccess()
    func fetchError(error:Error?)
}

class NewsListVM: NSObject {
    
    weak var delegate:MovieListModelDelegate?

    func callFuncToGetMoviewList(_ url:String, completionBlock: ((NewsData?, Error?) -> Void)?) {
        
        ServiceHelper.request(params: nil, method: .get, apiURL: url) { responseObj, error, status in
            if error == nil {
                let res = responseObj as? [String:Any]
                if let mov = res {
                    let newsList = NewsData.init(fromDictionary: mov as NSDictionary)
                    completionBlock!(newsList,nil)
                }
            } else {
                completionBlock!(nil,error)
            }
        }
    }
}
