//
//  KACApi.swift
//  FlightNumberAPI
//
//  Created by Youngbin Choi on 2023/10/03.
//

import Foundation

struct KACApi {
    
    let apiKey = Storage().apiKey
    let pageNo = 1
    let schLineType = "I"
    let schIOType = "I"
    
    func performRequest() {
        let urlString = "http://openapi.airport.co.kr/service/rest/FlightStatusList/getFlightStatusList?ServiceKey=\(apiKey)&schLineType=\(schLineType)&schIOType=\(schIOType)&pageNo=\(pageNo)"
        let url = URL(string: urlString)
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url!) { data, response, error in
            if error != nil {
                print(error?.localizedDescription)
                return
            }
            if let safeData = data {
                    let parser = XMLParser(data: safeData)
                    let xmlParserDelegate = MyXMLParserDelegate()
                    parser.delegate = xmlParserDelegate
                    if parser.parse() {
                            // 파싱이 성공하면 items 배열에 데이터가 저장됩니다.
                            let items = xmlParserDelegate.items
                            for item in items {
                                print("airFin: \(item.airFin)")
                                print("---")
                            }
                        } else {
                            print("XML 파싱에 실패했습니다.")
                        }
            }
        }
        task.resume()
    }
    
}
