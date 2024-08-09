//
//  DataModel.swift
//  DemoProject
//
//  Created by SIDDHARTH KOSHIYAR on 08/08/24.
//

import Foundation


struct CarouselModel: Identifiable{
    var id = UUID().uuidString
    var imageName = String()
    var list = [ListModel]()
}

struct ListModel: Identifiable {
    var id = UUID().uuidString
    var imageName = String()
    var titleText = String()
    var subtitleText = String()
}


struct DataModel {
    static let carouselData: [CarouselModel] = [
        CarouselModel(imageName: "fruitesImg", list: [
            ListModel(imageName: "banana", titleText: "Banana", subtitleText: "Fruites"),
            ListModel(imageName: "cherry", titleText: "Cherry", subtitleText: "Fruites"),
            ListModel(imageName: "mango", titleText: "Mango", subtitleText: "Fruites"),
            ListModel(imageName: "orange", titleText: "Orange", subtitleText: "Fruites"),
            ListModel(imageName: "pineapple", titleText: "PineApple", subtitleText: "Fruites")
        ]),
        
        CarouselModel(imageName: "grocery", list: [
            ListModel(imageName: "foodOil", titleText: "FoodOil", subtitleText: "Grocery"),
            ListModel(imageName: "millets", titleText: "Millets", subtitleText: "Grocery"),
            ListModel(imageName: "shampoo", titleText: "Shampoo", subtitleText: "Grocery"),
            ListModel(imageName: "soap", titleText: "Soap", subtitleText: "Grocery")
        ]),
        
        CarouselModel(imageName: "milkProducts", list: [
            ListModel(imageName: "butter", titleText: "Butter", subtitleText: "MilkProduct"),
            ListModel(imageName: "cheese", titleText: "Cheese", subtitleText: "MilkProduct"),
            ListModel(imageName: "milk", titleText: "Milk", subtitleText: "MilkProduct"),
            ListModel(imageName: "paneer", titleText: "Paneer", subtitleText: "MilkProduct")
        ]),
        
        CarouselModel(imageName: "vegitables", list: [
            ListModel(imageName: "eggPlant", titleText: "", subtitleText: "Vegitables"),
            ListModel(imageName: "ladyFingers", titleText: "", subtitleText: "Vegitables"),
            ListModel(imageName: "potato", titleText: "", subtitleText: "Vegitables"),
            ListModel(imageName: "tomato", titleText: "", subtitleText: "Vegitables")
        ])
    ]
}
