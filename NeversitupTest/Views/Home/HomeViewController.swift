//
//  HomeViewController.swift
//  NeversitupTest
//
//  Created by Piyathida Buathad on 15/5/2567 BE.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet var depastmentLabel: UILabel!
    @IBOutlet var depastmentCollectionView: UICollectionView!
    
    @IBOutlet var productLabel: UILabel!
    @IBOutlet var productCollectionView: UICollectionView!
    @IBOutlet var NotFoundView: UIView!

    let homeViewModel = HomeViewModel()
    private var spacing: CGFloat = 4
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.registerCell()
        self.loadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    private func registerCell() {
        self.depastmentCollectionView.dataSource = self
        self.depastmentCollectionView.delegate = self
        self.depastmentCollectionView.register(UINib(nibName: "HomeDepartmentCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "HomeDepartmentCollectionViewCell")
        
        self.productCollectionView.dataSource = self
        self.productCollectionView.delegate = self
        self.productCollectionView.register(UINib(nibName: "HomeProductCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "HomeProductCollectionViewCell")
        
    }
    
    private func loadData() {
        self.homeViewModel.loadDepartmentsWidgets {
            guard let firstData = self.homeViewModel.firstDepartment else {
                return
            }
            self.loadProductList(departmentName: firstData.name, departmentId: firstData.id)
            self.depastmentCollectionView.reloadData()
        }
    }
    
    private func loadProductList(departmentName: String, departmentId: String) {
        self.productLabel.text = "Product listing: \(departmentName)"
        self.homeViewModel.fetchProductListWidgets(departmentId: departmentId) {
            if self.homeViewModel.numberOfDepartments == 0 {
                // TODO: - หน้าเปล่า
                self.NotFoundView.isHidden = false
                self.productCollectionView.isHidden = true
            } else {
                self.NotFoundView.isHidden = true
                self.productCollectionView.isHidden = false
                self.productCollectionView.reloadData()
            }
        }
    }
    
}

extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == depastmentCollectionView {
            return homeViewModel.numberOfDepartments
        } else if collectionView == productCollectionView {
            return homeViewModel.numberOfProducts
        } else {
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == depastmentCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeDepartmentCollectionViewCell", for: indexPath) as! HomeDepartmentCollectionViewCell
            let domain = homeViewModel.department(at: indexPath.row)
            cell.setupCell(name: domain.name, imageUrl: "\(domain.imageUrl)/\(domain.id)")
            return cell
        } else if collectionView == productCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeProductCollectionViewCell", for: indexPath) as! HomeProductCollectionViewCell
            let domain = homeViewModel.product(at: indexPath.row)
            cell.setupCell(name: domain.name, imageUrl: "\(domain.imageUrl)/\(domain.departmentId)\(domain.id)", desc: domain.desc, price: domain.price)
            return cell
        } else {
            return UICollectionViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == depastmentCollectionView {
            let domain = homeViewModel.department(at: indexPath.row)
            self.loadProductList(departmentName: domain.name, departmentId: domain.id)
        } else if collectionView == productCollectionView {
            let detailVC = self.homeViewModel.initDetailViewController(product: self.homeViewModel.product(at: indexPath.row))
            
            let navigationController = UINavigationController(rootViewController: detailVC)
            navigationController.navigationBar.isHidden = true
            navigationController.modalPresentationStyle = .overFullScreen
            self.present(navigationController, animated: false)
            
        } else {
            
        }
    }
    
}

extension HomeViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    
        if collectionView == productCollectionView {
            let productCVC = HomeProductCollectionViewCell.self
            let width = productCVC.collectionItemWidth(collectionViewWidth: collectionView.bounds.width, numberOfColumn: productCVC.numberOfColumn)
            let height = productCVC.collectionItemHeigth(collectionItemWidth: width)

            return CGSize(width: width, height: height)
                    
        } 
//        else if collectionView == depastmentCollectionView {
//            let departmentCVC = HomeDepartmentCollectionViewCell.self
//            let width = departmentCVC.collectionItemWidth(collectionViewWidth: collectionView.bounds.width, numberOfColumn: departmentCVC.numberOfColumn)
//            let height = departmentCVC.collectionItemHeigth(collectionItemWidth: width)
//
//            return CGSize(width: width, height: height)
//                    
//        } 
        else {
            return CGSize(width: collectionView.bounds.height, height: collectionView.bounds.height)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return self.spacing
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        let sectionInset = UIEdgeInsets(top: 4, left: 0, bottom: 4, right: 0)
        return sectionInset
    }
}
