//
//  ViewController.swift
//  MovieMania
//
//  Created by Fahad Shaikh on 21/04/19.
//  Copyright © 2019 Fahad Shaikh. All rights reserved.
//

import UIKit

class PopularMoviesViewController: UIViewController {

    @IBOutlet weak var popularMoviesCollectionView: UICollectionView!{
        didSet{
            popularMoviesCollectionView?.delegate = self
            popularMoviesCollectionView?.dataSource = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        popularMoviesCollectionView.register(PopularMoviesCollectionViewCell.self, forCellWithReuseIdentifier: String(describing: PopularMoviesCollectionViewCell.self))
        // Do any additional setup after loading the view, typically from a nib.
    }
}

extension PopularMoviesViewController:UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 15
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: PopularMoviesCollectionViewCell.self), for: indexPath)
        return cell
    }
}

extension PopularMoviesViewController:UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let padding:CGFloat = 20
        let size = collectionView.frame.width - padding
        return CGSize(width: size/2, height: 150)
    }
}

extension PopularMoviesViewController:UICollectionViewDelegate{

}
