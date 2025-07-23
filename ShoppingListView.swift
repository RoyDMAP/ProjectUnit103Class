//
//  ShoppingListView.swift
//  ProjectUnit103
//
//  Created by Roy Dimapilis on 7/21/25.
//
import SwiftUI

struct ShoppingListView: View {
    @State private var shoppingList: [String] = ["Eggs", "Apples"]
    @State private var newItem: String = ""
    var body: some View {
       
        // Allows the toolbar and the titles
        NavigationView {
            
            ZStack {
                Color.gray.opacity(0.1)
                    .ignoresSafeArea()
                
                // White Surface
                VStack {
                    Text("Shopping List")
                        .font(.largeTitle)
                        .foregroundStyle(.blue)
                        .padding()
                    
                    List {
                        // List of items
                        ForEach (shoppingList, id: \.self){ item in
                            Text(item)}
                        
                    }// List
                    .listStyle(PlainListStyle())
                    .scrollContentBackground(.hidden)
                    
                    HStack {
                        TextField("Add new shopping item...", text: $newItem)
                            .padding()
                            .overlay(RoundedRectangle(cornerRadius: 20)
                                .stroke(Color.gray, lineWidth: 1)
                                .opacity(0.2))
                            .padding()
                        
                        Button(action:{
                            //action
                            addItem(newItem)
                            newItem = ""
                        }){
                            Image(systemName: "arrowshape.up.fill")
                                .padding()
                                .background(Color.blue)
                                .foregroundStyle(Color.white)
                                .cornerRadius(30)
                        }
                    }// HStack
                .padding()
                
                } //VStack
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color.white)
                .cornerRadius(20)
                .padding()
                
            } //ZStack
            .navigationBarTitle("Listify", displayMode: .inline)
            .toolbar {
                Menu{
                    Button("Sort A -> Z"){
                        //action
                        shoppingList.sort()
                    }
                    Button("Reverse Order"){
                        //action
                        shoppingList.reverse()
                    }
                }label: {
                    Image(systemName: "arrow.up.arrow.down.circle")
                        .imageScale(.large)
                }
                .padding()
            }
            
        } // NavigationView
        
    } // body
    
    private func addItem(_ item: String) {
        if !item.isEmpty {
            shoppingList.append(item)
        }
    }
} // struct ShoppingListView

#Preview {
    ShoppingListView()
}

