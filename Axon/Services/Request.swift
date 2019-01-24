//
//  Request.swift
//  Axon
//
//  Created by Yaroslav Zakharchuk on 1/23/19.
//  Copyright © 2019 Yaroslav Zakharchuk. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class NetworkManager {
    
    func getUsers(completion: @escaping (Any?, Error?) -> Void) {
        guard let url = URL(string: "https://randomuser.me/api/?results=50") else { return }

        Alamofire.request(url).responseJSON { response in
            self.checkingForResponse(response: response, completion: completion)
        }
    }
    
    private func checkingForResponse(response: DataResponse<Any>, completion: @escaping (Any?, Error?) -> Void) {
        switch response.result {
        case .success:
            print("Success from NetworkManager")
            if let result = response.result.value {
                completion(result, nil)
            }
        case .failure(let error):
            print(error)
        }
    }

}
