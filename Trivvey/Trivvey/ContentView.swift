//
//  ContentView.swift
//  Trivvey
//
//  Created by Alec Lobanov on 10/22/24.
//

import SwiftUI



struct ContentView: View {
    @State private var questions = [Question]()
    
    var body: some View {
        NavigationStack {
            //Spacer()
            List{
                ForEach(questions, id: \.question) {question in
                    NavigationLink(question.question,destination: QuestionView(question: question))
                }
            }
            .onAppear{
                let url: URL = Bundle.main.url(forResource: "questions", withExtension: "json")!
                let data = try! Data(contentsOf: url)
                questions = try! JSONDecoder().decode([Question].self, from: data)
            }
            .navigationTitle("Trivvey")
            .toolbar {
                ToolbarItem(placement: .bottomBar){
                    Button{
                        questions.shuffle()
                    } label:{
                        Image(systemName:"shuffle")
                        Text("Shuffle")
                    }
                    .buttonStyle(.borderedProminent)
                    
                }
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
