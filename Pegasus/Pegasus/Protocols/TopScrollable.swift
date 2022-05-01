//
//  TopScrollable.swift
//  Pegasus
//
//  Created by Tiago on 01/05/2022.
//

import UIKit

protocol TopScrollable where Self: UICollectionViewController {
    func scrollToTop()
}

extension TopScrollable {
    func scrollToTop() {
        collectionView.setContentOffset(.init(x: 0, y: -collectionView.contentInset.top), animated: true)
    }
}
