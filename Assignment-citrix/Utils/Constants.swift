//
//  Constants.swift
//  Assignment
//
//  Created by Nitin on 2/7/2022.
//

import Foundation


struct APIUrl {
    static let baseUrl = "https://api.nytimes.com/svc/mostpopular/v2/viewed/1.json"
}

var newsListUrl: String {
    let query = "\(APIUrl.baseUrl)?api-key=\(AppKeys.key)"
    return query
}
