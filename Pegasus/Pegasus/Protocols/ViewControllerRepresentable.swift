//
//  ViewControllerRepresentable.swift
//  Pegasus
//
//  Created by Tiago on 27/03/2022.
//

import UIKit

protocol ViewControllerRepresentable: AnyObject {
    var viewController: UIViewController { get }
}
