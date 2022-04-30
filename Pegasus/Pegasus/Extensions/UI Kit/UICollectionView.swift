//
//  UICollectionView.swift
//  Pegasus
//
//  Created by Tiago on 20/03/2022.
//

import UIKit

extension UICollectionView: CellDequeuable {}
extension UICollectionView: CellRegistable {}

extension UICollectionView {
    func deselectItem(at indexPath: IndexPath) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.01) {
            self.deselectItem(at: indexPath, animated: true)
        }
    }
}
