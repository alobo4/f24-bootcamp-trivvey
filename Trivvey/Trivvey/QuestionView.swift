//
//  QuestionView.swift
//  Trivvey
//
//  Created by Alec Lobanov on 10/23/24.
//

import SwiftUI

struct QuestionView: View {
    @State var question:Question
    @State private var selectedAnswer:String? = nil
    
    var body: some View {
        VStack{
            Text(question.question)
                .font(.title)
            Button(question.A){
                selectedAnswer = "A"
            }
            .buttonStyle(.borderedProminent)
            Button(question.B){
                selectedAnswer = "B"
            }
            .buttonStyle(.borderedProminent)
            Button(question.C){
                selectedAnswer = "C"
            }
            .buttonStyle(.borderedProminent)
            Button(question.D){
                selectedAnswer = "D"
            }
            .buttonStyle(.borderedProminent)
            
            if selectedAnswer != nil {
                if selectedAnswer == question.answer {
                    Text("Correct!")
                        .foregroundStyle(.green)
                }else{
                    Text("Incorrect!")
                        .foregroundStyle(.red)
                }
            }
            
        }
    }
}

#Preview {
    QuestionView(question: .example)
}
