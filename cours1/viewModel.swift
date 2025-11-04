//
//  viewModel.swift
//  cours1
//
//  Created by LETARD Pierric on 03/11/2025.
//
import SwiftUI

@Observable
class ViewModel {
    var counter: Int = 0 {
        didSet {
            title1 = "Tu as cliqué \(counter) fois sur le bouton"
            title2 = "Bon anniversaire ! \(counter) clic, tu es grand maintenant !"
        }
    }
    var viewTitle: String = "Clic moi !"
    var title1: String = "Tu as cliqué X fois sur le bouton"
    var title2: String = "Bon anniversaire !"

}


struct ContentView2: View {
    @State var viewModel = ViewModel()
    
    var body: some View {
        VStack{
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello world ")
            Button(viewModel.viewTitle) {
                viewModel.counter += 1
                if viewModel.counter == 18 {
                    viewModel.viewTitle = viewModel.title2
                } else {
                    viewModel.viewTitle = viewModel.title1
                }
            }
        }.padding()
    }
}


#Preview {
    ContentView2()
    NavigationStack {
        NavigationLink("Aller aux details") {
            ContentView2()
        }
    }

}

