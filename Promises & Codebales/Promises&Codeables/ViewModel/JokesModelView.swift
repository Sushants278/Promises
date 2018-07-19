//
//  JokesModelView.swift
//  Promises&Codeables
//
//  Created by 1042834 on 7/18/18.
//  Copyright © 2018 1042834. All rights reserved.
//

import Foundation

class JokesViewModel {
    
    private static var jokesModel : JokesViewModel {
        return JokesViewModel()
    }
    
    class func shared() -> JokesViewModel {
        return jokesModel
    }
    
   /* func getJokes() -> [Joke] {
        RequestManager.shared().getInfo().done { json -> Void in
            
            }.catch { error in
            print(error.localizedDescription)
        }
        //return [Joke()]
    }*/
}
