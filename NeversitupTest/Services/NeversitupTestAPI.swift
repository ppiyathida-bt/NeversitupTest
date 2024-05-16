//
//  NeversitupTestAPI.swift
//  NeversitupTest
//
//  Created by Piyathida Buathad on 15/5/2567 BE.
//

import Moya
import RxSwift

public enum NeversitupTestAPI {
    case getDepartments
    case fetchProductList(departmentId: String)
}

extension NeversitupTestAPI: TargetType {
    public var baseURL: URL {
        return URL(string: "https://659f86b15023b02bfe89c737.mockapi.io")!
    }

    public var path: String {
        switch self {
        case .getDepartments:
            return "/api/v1/departments"
        case .fetchProductList(let departmentId):
            return "/api/v1/departments/\(departmentId)/products"
        }
    }

    public var method: Moya.Method {
        switch self {
        case .getDepartments:
            return .get
        case .fetchProductList(let departmentId):
            return .get
        }
    }

    public var sampleData: Data {
        switch self {
        default:
            return "{}".data(using: String.Encoding.utf8)!
        }
    }
    
    public var task: Task {
        return .requestPlain
    }

    public var headers: [String: String]? {
        return nil
    }
}



