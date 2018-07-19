//
//  Jokes.swift
//  Promises&Codeables
//
//  Created by 1042834 on 7/18/18.
//  Copyright © 2018 1042834. All rights reserved.
//

import Foundation

struct Joke : Decodable {
    var type : String
    var value : [value]
}

struct value : Decodable{
    var id : Int
    var joke : String
}
