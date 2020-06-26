//
//  DesignDataManager.swift
//  TestAssetLibrary
//
//  Created by Jayakrishnan u on 6/25/20.
//  Copyright © 2020 Jayakrishnan u. All rights reserved.
//

import UIKit

struct ResponseData: Decodable {
    var button: ButtonDesign
}

struct ButtonDesign : Decodable {
    var titleColor: String
    var backgroundColor: String
    var titleFontSize: Int
    var buttonWidth: Int
    var buttonHeight: Int
}

class DesignDataManager {
    func designDataAttributes() -> ButtonDesign? {
        
        //Use Button from the asset library
        do {
            let asset = NSDataAsset(name: "Buttons", bundle: Bundle.main)
            let decoder = JSONDecoder()
            let jsonData = try decoder.decode(ResponseData.self, from: asset!.data)
            return jsonData.button
        }catch {
            print("Error!! Unable to parse json")
        }

        //         Use the Theme.json to decode a file
        //         if let url = Bundle.main.url(forResource: "Theme", withExtension: "json") {
        //            do {
        //                let data = try Data(contentsOf: url)
        //                let decoder = JSONDecoder()
        //                let jsonData = try decoder.decode(ResponseData.self, from: data)
        //                //print(jsonData.button)
        //                return jsonData.button
        //            } catch {
        //                 print("Error!! Unable to parse json")
        //            }
        //        }
        //
        return nil
    }
}
