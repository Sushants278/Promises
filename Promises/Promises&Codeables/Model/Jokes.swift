//
//  Jokes.swift
//  Promises&Codeables
//
//  Created by Sushant on 7/18/18.
//  Copyright © 2018 Sushant. All rights reserved.
//

import Foundation

struct Joke : Decodable {
    var type : String
    var value : [Jokes]
}

struct Jokes : Decodable{
    var id : Int
    var joke : String
}
