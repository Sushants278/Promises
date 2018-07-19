//
//  RequestManager.swift
//  Promises&Codeables
//
//  Created by 1042834 on 7/18/18.
//  Copyright © 2018 1042834. All rights reserved.
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
    
    
   /* func getResponse(onSuccess: @escaping ([String : Any])->(Void) , onFailure: @escaping ((Error) -> Void)) {
        Alamofire.request("https://jsonplaceholder.typicode.com/users/1").validate().responseJSON { (response) in
            
            switch  response.result  {
            case .success(let json) :
                guard let json = json as? [String : Any] else {
                    return
                }
                onSuccess(json)
            case .failure(let error) :
                 onFailure(error)
            }
        }
    }
    */
    
    
    func getJokes() {
        firstly {
            Alamofire
                .request("http://api.icndb.com/jokes/random/3", method: .get)
                .responseDecodable(Joke.self)
            }.done { foo in
                print(foo)
            }.catch { error in
                print(error.localizedDescription)
        }
    }
    
    func getInfo() -> Promise<[String:Any]> {
        return Promise {
            result in
            Alamofire.request("https://jsonplaceholder.typicode.com/users/1").validate().responseJSON(completionHandler: { (response) in
                switch  response.result  {
                    
                case .success(let json) :
                    guard let json = json as? [String : Any] else {
                        return
                    }
                    result.fulfill(json)
                case .failure(let error) :
                    result.reject(error)
                }
            })
        }
    }
}

