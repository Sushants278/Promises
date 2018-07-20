//
//  JokesModelView.swift
//  Promises&Codeables
//
//  Created by Sushant on 7/18/18.
//  Copyright © 2018 Sushant. All rights reserved.
//

import Foundation
import PromiseKit

class JokesViewModel {
    
    private static var jokesModel : JokesViewModel {
        return JokesViewModel()
    }
    
    class func shared() -> JokesViewModel {
        return jokesModel
    }
    
    func getJokes() -> Promise<[Jokes]> {
        return  Promise {  result in  firstly {
              RequestManager.shared().getJokes()
            } . done { jokes in
                result.fulfill(jokes.value)
            }.catch{ error in
                result.reject(error)
            }
        }
    }
}
