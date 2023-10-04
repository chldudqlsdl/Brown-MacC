//
//  XMLParserDelegate.swift
//  FlightNumberAPI
//
//  Created by Youngbin Choi on 2023/10/04.
//

import Foundation

struct Item {
    var airFin: String = ""
}

class MyXMLParserDelegate: NSObject, XMLParserDelegate {
    var currentItem: Item?
    var currentElement: String = ""
    var items: [Item] = []

    // 시작 태그를 만났을 때 호출되는 메서드
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
        currentElement = elementName
        if elementName == "item" {
            currentItem = Item()
        }
    }

    // 요소 내용을 읽을 때 호출되는 메서드
    func parser(_ parser: XMLParser, foundCharacters string: String) {
        switch currentElement {
        case "addr1":
            currentItem?.airFin = string
        default:
            break
        }
    }

    // 끝 태그를 만났을 때 호출되는 메서드
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        if elementName == "item", let item = currentItem {
            items.append(item)
            currentItem = nil
        }
    }
}
