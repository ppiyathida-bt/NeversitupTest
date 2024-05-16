//
//  DetailViewModel.swift
//  NeversitupTest
//
//  Created by Piyathida Buathad on 16/5/2567 BE.
//

import Foundation

class DetailViewModel {
    
    private var product: Product?
    
    init(product: Product?) {
        self.product = product
    }
    
    func createDetailViewController(with product: Product) -> DetailViewController {
        let viewController = DetailViewController.instantiateFromStoryboard() as DetailViewController
        viewController.product = product
        return viewController
    }
}
