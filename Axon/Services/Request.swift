//
//  Request.swift
//  Axon
//
//  Created by Yaroslav Zakharchuk on 1/23/19.
//  Copyright © 2019 Yaroslav Zakharchuk. All rights reserved.
//

import Foundation
import Alamofire

class NetworkManager {
    
    func getUsers(completion: @escaping (Users, Error?) -> Void) {
        guard let url = URL(string: "https://randomuser.me/api/?results=50") else { return }

        Alamofire.request(url).responseJSON { response in
            self.checkingForResponse(response: response, completion: completion)
        }
    }
    
    private func checkingForResponse(response: DataResponse<Any>, completion: @escaping (Users, Error?) -> Void) {
        switch response.result {
        case .success:
            print("Success from NetworkManager")
            if let result = response.data {
                do {
                    let decoder = JSONDecoder()
                    decoder.dateDecodingStrategy = .iso8601
                    let userInfo = try decoder.decode(Users.self, from: result)
                    //dump(userInfo.results[0])
                    completion(userInfo, nil)
                } catch let error {
                    print(error)
                }
            }
        case .failure(let error):
            print(error)
        }
    }

}
