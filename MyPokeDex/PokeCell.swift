//
//  PokeCell.swift
//  MyPokeDex
//
//  Created by MacBook Pro on 1396/3/14 ه‍.ش..
//  Copyright © 1396 ه‍.ش. mohammad. All rights reserved.
//

import UIKit

class PokeCell: UICollectionViewCell {
    
    @IBOutlet weak var pokeimg: UIImageView!
    
    @IBOutlet weak var pokeLblName: UILabel!
    
    
    var pokemon : Pokemon!
    
    

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        layer.cornerRadius =  5.0
        
    }
    
    
    func configurecell (pokemon : Pokemon)  {
        self.pokemon = pokemon
        pokeLblName.text = self.pokemon.name.capitalized
        pokeimg.image = UIImage (named : "\(self.pokemon.pokedexID)")
        
    }
    
    
}
