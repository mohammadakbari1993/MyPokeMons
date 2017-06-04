//
//  Pokemon.swift
//  MyPokeDex
//
//  Created by MacBook Pro on 1396/3/14 ه‍.ش..
//  Copyright © 1396 ه‍.ش. mohammad. All rights reserved.
//

import Foundation

class Pokemon {
    
   private var _name : String!
   private var _PokedexID : Int!
    
    var  name : String {
        return _name
    }
    var pokedexID : Int {
        return _PokedexID
    }
    init(name : String , pokedexId : Int) {
        _name = name
        _PokedexID = pokedexId
    }
    
}
