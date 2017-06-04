//
//  ViewController.swift
//  MyPokeDex
//
//  Created by MacBook Pro on 1396/3/14 ه‍.ش..
//  Copyright © 1396 ه‍.ش. mohammad. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UICollectionViewDelegate,UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    
    @IBOutlet weak var collectionview: UICollectionView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
       
        collectionview.delegate = self
        collectionview.dataSource = self
        

    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PokeCell", for: indexPath) as? PokeCell{
            
            let pokemon = Pokemon(name: "test", pokedexId: indexPath.row)
            cell.configurecell(pokemon: pokemon)
            
        return cell
        }else {
            return UICollectionViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        return
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
         return 718
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    override func size(forChildContentContainer container: UIContentContainer, withParentContainerSize parentSize: CGSize) -> CGSize {
        return CGSize(width: 150, height: 150)
    }


}

