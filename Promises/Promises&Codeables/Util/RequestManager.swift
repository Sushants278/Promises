//
//  RequestManager.swift
//  Promises&Codeables
//
//  Created by Sushant on 7/18/18.
//  Copyright © 2018 Sushant. All rights reserved.
//

import Foundation
import Alamofire
import PromiseKit

class RequestManager {
    
    private static var requestManager : RequestManager {
        return RequestManager()
    }
    
    class func shared() -> RequestManager {
        return requestManager
    }
    
    
    func getJokes() -> Promise<Joke> {
        return Promise {  result in  firstly {
            Alamofire
                .request("http://api.icndb.com/jokes/random/15", method: .get)
                .responseDecodable(Joke.self)
            }.done { joke in
                result.fulfill(joke)
            }.catch { error in
                result.reject(error)
            }
        }
    }
    
}

