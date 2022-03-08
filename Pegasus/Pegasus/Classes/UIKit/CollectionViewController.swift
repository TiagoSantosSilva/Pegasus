//
//  CollectionViewController.swift
//  Pegasus
//
//  Created by Tiago on 08/03/2022.
//

import UIKit

open class CollectionViewController: UICollectionViewController {
    
    // MARK: - Initialization
    
    override public init(collectionViewLayout layout: UICollectionViewLayout) {
        super.init(collectionViewLayout: layout)
    }
    
    @available(*, unavailable)
    public required init?(coder aDecoder: NSCoder) {
        fatalError("Init through nib not supported.")
    }
}
