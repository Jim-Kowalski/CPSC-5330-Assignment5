//
//  AdventureQuestion.swift
//  Assignment5
//
//  Created by James Kowalski on 2/7/24.
//

import Foundation
struct Question {
    init (_ title: String,_ Ques: String,_ QChoices: [QuestionChoice])
    {
        self.Question = Ques
        self.QuestionChoices = QChoices
        self.Title = title
    }
    var Title: String
    var Question: String
    var QuestionChoices: [QuestionChoice]
}
struct QuestionChoice
{
    let ChoiceTitle: String
    let NextQuestionKey: String
}
