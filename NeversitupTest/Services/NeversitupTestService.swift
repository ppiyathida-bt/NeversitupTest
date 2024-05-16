//
//  NeversitupTestService.swift
//  NeversitupTest
//
//  Created by Piyathida Buathad on 15/5/2567 BE.
//

import Foundation
import Moya
import RxSwift
import Moya_ObjectMapper

class NeversitupTestService {
    
    private var provider: MoyaProvider<NeversitupTestAPI>!
    
    init() {
        provider = MoyaProvider<NeversitupTestAPI>(plugins: [NetworkLoggerPlugin()])
    }

}

extension NeversitupTestService {
    
    func getDepartmentsObservable() -> Observable<[Department]> {

        return provider.rx.request(NeversitupTestAPI.getDepartments)
            .asObservable()
            .filterSuccessfulStatusAndRedirectCodes()
            .mapArray(Department.self)
            .flatMapLatest { (response) -> Observable<[Department]> in
                return Observable.just(response)
            }
    }
    
    func fetchProductListObservable(departmentId: String) -> Observable<[Product]> {

        return provider.rx.request(NeversitupTestAPI.fetchProductList(departmentId: departmentId))
            .asObservable()
            .filterSuccessfulStatusAndRedirectCodes()
            .mapArray(Product.self)
            .flatMapLatest { (response) -> Observable<[Product]> in
                return Observable.just(response)
            }
    }
    
}
