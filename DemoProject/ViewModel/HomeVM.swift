//
//  HomeVM.swift
//  DemoProject
//
//  Created by SIDDHARTH KOSHIYAR on 08/08/24.
//

import Foundation


class HomeVM: ObservableObject{
    
    @Published var homeList = [CarouselModel]()
    
    init() {
    }
    
    func getData(){
        self.homeList = DataModel.carouselData
    }
    
}
