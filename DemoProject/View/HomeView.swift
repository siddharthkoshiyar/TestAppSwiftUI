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
    @State private var keyboardHeight: CGFloat = 0

    private var searchResults: [ListModel] {
           if searchText.isEmpty {
               return list
           } else {
               return list.filter { $0.titleText.contains(searchText) }
           }
       }

    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            VStack {
                GeometryReader{ geoMetry in
                    ScrollView(.vertical){
                        VStack{
                            TabView(selection:$currentIndex){
                                if vm.homeList.isEmpty {
                                    Spacer()
                                } else {
                                ForEach(Array(vm.homeList.enumerated()), id: \.element.id) { index, element in
                                        Image(element.imageName)
                                            .resizable()
                                            .scaledToFill()
                                            .aspectRatio(contentMode: .fill)
                                            .background(.red)
                                            .tag(index)
                                    }
                                }
                            }
                            .frame(height: 260)
                            .clipShape(RoundedRectangle(cornerRadius: 30.0))
                            .onChange(of: currentIndex) { newValue in
                                list = vm.homeList[newValue].list
                            }
                            .tabViewStyle(.page(indexDisplayMode: .always))
                            .indexViewStyle(.page(backgroundDisplayMode: .never))

                            // Search Textbox
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
                            .padding(.vertical)

                            
                            // List View
                            List{
                                ForEach(searchResults) {element in
                                    HStack{
                                        Image(element.imageName)
                                            .resizable()
                                            .scaledToFit()
                                            .aspectRatio(contentMode: .fit)
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
                                    }.background(.clear)
                                }
                            }
                            .listStyle(.plain)
                            .frame(height: geoMetry.size.height, alignment: .center)

                        }
                        .offset(y: -keyboardHeight / 2)
                        .animation(.easeOut(duration: 0.16))
                    }
                    .padding(.top, -keyboardHeight / 2)
                    .animation(.easeOut(duration: 0.16))
                }
            }
            .padding(20)
            
            Button {
            } label: {
                Text("\(searchResults.count)")
                    .frame(width: 50, height: 50)
            }
            .font(.title.weight(.semibold))
            .background(Color.blue)
            .foregroundColor(.white)
            .clipShape(Circle())
            .padding([.bottom,.trailing], 20)
        }

        .background(Color.teal.opacity(0.2))
        .onAppear{
            vm.getData()
            self.addKeyboardObservers()
            if !vm.homeList.isEmpty{
                list = vm.homeList[0].list
            }
        }
        .onDisappear(perform: {
            self.removeKeyboardObservers()
        })
    }
    
    private func addKeyboardObservers() {
        NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillShowNotification, object: nil, queue: .main) { notification in
            if let keyboardFrame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect {
                self.keyboardHeight = keyboardFrame.height - 40.0
            }
        }
        NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillHideNotification, object: nil, queue: .main) { _ in
            self.keyboardHeight = 0
        }
    }
    
    private func removeKeyboardObservers() {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(vm: HomeVM())
    }
}
