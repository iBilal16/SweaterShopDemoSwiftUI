//
//  ContentView.swift
//  SweaterShopDemo
//
//  Created by Bilal Ahmad on 17/01/2022.
//

import SwiftUI

struct ContentView: View {
    @StateObject var cartManager = CartManager()
    var columns = [GridItem(.adaptive(minimum: 160), spacing : 20)]
    
    var body: some View {
        
        NavigationView {
            ScrollView {
                LazyVGrid (columns: columns, spacing: 20) {
                    ForEach(productList, id: \.id) {
                        product in ProductCard(product: product)
                            .environmentObject(cartManager)
                    }
                    
                }
            }
            .navigationTitle(Text("Sweater Shop"))
            .toolbar {
                NavigationLink {
                    CartView()
                } label: {
                    CartButton(numberOfProducts: cartManager.products.count)
                }
                
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
