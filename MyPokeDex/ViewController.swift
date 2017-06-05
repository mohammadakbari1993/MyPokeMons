//
//  ViewController.swift
//  MyPokeDex
//
//  Created by MacBook Pro on 1396/3/14 ه‍.ش..
//  Copyright © 1396 ه‍.ش. mohammad. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController , UICollectionViewDelegate,UICollectionViewDataSource, UICollectionViewDelegateFlowLayout,UISearchBarDelegate {
    
    
    @IBOutlet weak var collectionview: UICollectionView!
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    
    
    var pokemon = [Pokemon]()
    var filtered = [Pokemon]()
    var insearchmode = false
    
    var musicPlayr : AVAudioPlayer!
    

    override func viewDidLoad() {
        super.viewDidLoad()
       
        collectionview.delegate = self
        collectionview.dataSource = self
        searchBar.delegate = self
        searchBar.returnKeyType = UIReturnKeyType.done
        parsePokemonCSV()
        initAudio()
    }
    
    func initAudio() {
        let path = Bundle.main.path(forResource: "music", ofType: "mp3")!
        do {
            musicPlayr = try AVAudioPlayer(contentsOf: NSURL(string: path)! as URL)
            musicPlayr.prepareToPlay()
            musicPlayr.numberOfLoops = -1
            musicPlayr.play()
            
        } catch let err as NSError {
            print(err.debugDescription)
        }
        
    }
    
    
    
    func parsePokemonCSV() {
        
        let path = Bundle.main.path(forResource: "pokemon", ofType: "csv")!
        
        do {
            let csv = try CSV(contentsOfURL: path)
            
            let rows = csv.rows
            for row in rows {
                let pokeID = Int(row["id"]!)!
                let name = row["identifier"]!
                let poke = Pokemon(name: name, pokedexId: pokeID)
                pokemon.append(poke)
            }
            
        } catch let err as NSError {
            print(err.debugDescription)
        }
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PokeCell", for: indexPath) as? PokeCell{
            
            var poke : Pokemon!
            if insearchmode {
                poke = filtered[indexPath.row]
            }else {
                poke = pokemon[indexPath.row]
            }
            
            
            cell.configurecell(pokemon: poke)
            
        return cell
        }else {
            return UICollectionViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        return
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if !insearchmode {
            return pokemon.count
        }
        return filtered.count
        
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    override func size(forChildContentContainer container: UIContentContainer, withParentContainerSize parentSize: CGSize) -> CGSize {
        return CGSize(width: 150, height: 150)
    }
    
    @IBAction func musicbutton(_ sender: UIButton) {
        
        if musicPlayr.isPlaying {
            musicPlayr.stop()
            sender.alpha = 0.2
        }else {
            musicPlayr.play()
            sender.alpha = 1.0
        }
        
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        view.endEditing(true)
    }
    
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        if searchBar.text == nil || searchBar.text == "" {
            insearchmode = false
            view.endEditing(true)
            collectionview.reloadData()
        }else {
            insearchmode = true
            let lower = searchBar.text!.lowercased()
            filtered = pokemon.filter({$0.name.range(of: lower) != nil})
            
            collectionview.reloadData()
            
            
        }
        
    }

}

