//
//  ContentView.swift
//  DemoProject
//
//  Created by SIDDHARTH KOSHIYAR on 08/08/24.
//

import SwiftUI

struct HomeView: View {
    
    @ObservedObject var vm: HomeVM
    @State private var searchText = ""
    @State private var currentIndex: Int = 0
    @GestureState private var dragOffset: CGFloat = 0.0
    @State private var list: [ListModel] = []
    private var searchResults: [ListModel] {
           if searchText.isEmpty {
               return list
           } else {
               return list.filter { $0.titleText.contains(searchText) }
           }
       }

    var body: some View {
        VStack {
            ScrollView(.vertical){
                VStack{
                    ScrollView(.horizontal){
                        LazyHStack{
                            ForEach(Array(vm.homeList.enumerated()), id: \.element.id) { index, element in
                                Image(element.imageName)
                                    .resizable()
                                    .scaledToFill()
                                    .clipShape(RoundedRectangle(cornerRadius: 20.0))
                                    .onTapGesture {
                                        list = element.list
                                    }
                            }
                        }
                    }
                    
                    VStack{
                        HStack {
                            Image(systemName: "magnifyingglass")
                                .padding(.leading, CGFloat(10.0))
                            TextField("Search", text: $searchText)
                            .padding(.vertical, CGFloat(4.0))
                            .padding(.trailing, CGFloat(10.0))
                        }
                        .overlay(
                            RoundedRectangle(cornerRadius: 5.0)
                                .stroke(Color.secondary, lineWidth: 1.0)
                        )
                        .padding()
                        
                        List{
                            ForEach(searchResults) {element in
                                HStack{
                                    Image(element.imageName)
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 90, height: 90)
                                        .clipShape(RoundedRectangle(cornerRadius: 20.0))
                                    VStack(alignment: .leading){
                                        Text(element.titleText)
                                            .font(.title)
                                            .foregroundStyle(.secondary)
                                            .multilineTextAlignment(.leading)
                                        Text(element.subtitleText)
                                            .font(.footnote)
                                            .foregroundStyle(.primary)
                                            .multilineTextAlignment(.leading)
                                    }
                                }
                            }
                        }.frame(height: 500)
                    }
                }
            }
        }
        .padding()
        .onAppear{
            vm.getData()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(vm: HomeVM())
    }
}
