//
//  HomeViewModel.swift
//  NeversitupTest
//
//  Created by Piyathida Buathad on 15/5/2567 BE.
//

import Foundation
import UIKit


class HomeViewModel {
    
    private var departmentList: [Department] = [Department]()
    private var productList: [Product] = [Product]()
    
    var numberOfDepartments: Int {
        return departmentList.count
    }
    
    var firstDepartment: Department? {
        if let firstDeparhmant = self.departmentList.first {
            return firstDeparhmant
        } else {
            return nil
        }
    }
        
    func department(at index: Int) -> Department {
            return departmentList[index]
    }
    
    var numberOfProducts: Int {
        return productList.count
    }
        
    func product(at index: Int) -> Product {
            return productList[index]
    }
    
    private let neversitupService: NeversitupTestService = NeversitupTestService()
    
    //MARK: - Departments
    private func getDepartments(completion: @escaping (_ result: Result<[Department],Error>) -> ()) {
        _ = neversitupService.getDepartmentsObservable().subscribe{ event in
            switch event {
            case let .next(response):
                completion(.success(response))
            case let .error(error):
                completion(.failure(error))
            default:
                break
            }
        }
    }
    
    func loadDepartmentsWidgets(completion: @escaping () -> ()) {
        self.getDepartments { result in
            switch result {
            case .success(let departments) :
                self.departmentList = departments
                completion()
            case .failure(let error) :
                print(error.localizedDescription)
            }
        }
    }
    
    //MARK: Product
    private func fetchProductList(departmentId: String, completion: @escaping (_ result: Result<[Product],Error>) -> ()) {
        _ = neversitupService.fetchProductListObservable(departmentId: departmentId).subscribe{ event in
            switch event {
            case let .next(response):
                completion(.success(response))
            case let .error(error):
                completion(.failure(error))
            default:
                break
            }
        }
    }
    
    func fetchProductListWidgets(departmentId: String ,completion: @escaping () -> ()) {
        self.fetchProductList(departmentId: departmentId) { result in
            switch result {
            case .success(let products) :
                self.productList = products
                completion()
            case .failure(let error) :
                print(error.localizedDescription)
            }
        }
    }
    
    func initDetailViewController(product: Product) -> DetailViewController {
        let detailVC = DetailViewController.instantiateFromStoryboard() as DetailViewController
        detailVC.product = product
        return detailVC
    }

}
