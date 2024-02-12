//
//  AdventureLogic.swift
//  Assignment5
//
//  Created by James Kowalski on 2/7/24.
//

import Foundation
class AdventureLogic
{
    private var AdventureQuestions = [String: Question]() //Create a collection
    private var mstrCurrentQuestionKey = "StartingQuestion" //Specifies the question index that the end-user is currently playing.
    
    init()
    {
        //-----------------------------------------------------------------------------
        //Common Question Choices:
        //-----------------------------------------------------------------------------
        let QuestionChoice_KnockOnDoor =  QuestionChoice(ChoiceTitle: "Knock On Door",
                                                         NextQuestionKey: "KnockOnDoor")
        let QuestionChoice_GotoBackOfHouse = QuestionChoice(ChoiceTitle: "Go to back of house",
                                                            NextQuestionKey: "GoToBackOfHouse")
        let QuestionChoice_CloseMailbox = QuestionChoice(ChoiceTitle: "Close Mailbox",
                                                         NextQuestionKey: "StartingQuestion")
        let QuestionChoice_OpenMailbox = QuestionChoice(ChoiceTitle: "Open Mailbox",
                                                        NextQuestionKey: "OpenedMailbox")
        let QuestionChoice_ReadLeaflet = QuestionChoice(ChoiceTitle: "Read leaflet",
                                                        NextQuestionKey: "ReadLeaflet")
        let QuestionChoice_TryAgain = QuestionChoice(ChoiceTitle: "Try Again",
                                                     NextQuestionKey: "StartingQuestion")
        let QuestionChoice_StartOver = QuestionChoice(ChoiceTitle: "Start Over",
                                                      NextQuestionKey: "StartingQuestion")
        //-----------------------------------------------------------------------------
        //Question initialization.
        //-----------------------------------------------------------------------------
        AdventureQuestions["StartingQuestion"] = Question("West of House",
                                                          "You are in an open field west of a white house, with a boarded front door. There is a small mailbox here. A rubber mat saying 'Welcome to Zork!' lies by the door. What do you do?",
                                                          [QuestionChoice_OpenMailbox, //OK
                                                           QuestionChoice_KnockOnDoor, //OK
                                                           QuestionChoice_GotoBackOfHouse]) //OK
        AdventureQuestions["OpenedMailbox"] = Question("West of House",
                                                       "You open the mailbox, revealing a small leaflet.",
                                                       [QuestionChoice_ReadLeaflet, //OK
                                                        QuestionChoice_CloseMailbox, //OK
                                                        QuestionChoice_GotoBackOfHouse] //OK
        )
        AdventureQuestions["ReadLeaflet"] = Question("West of House",
                                                     "The leaflet looks like it was sent by local athorities. 'Beware of trolls in the area. They're not friendly and have been breaking in homes.'",
                                                     [QuestionChoice_CloseMailbox,
                                                      QuestionChoice_KnockOnDoor,
                                                      QuestionChoice_GotoBackOfHouse])
        
        
        AdventureQuestions["KnockOnDoor"] = Question("West of House",
                                                     "You knock on the door. Bang Bang Bang. There's no answer",
                                                     [QuestionChoice_OpenMailbox,
                                                      QuestionChoice_KnockOnDoor,
                                                      QuestionChoice_GotoBackOfHouse]
        )
        AdventureQuestions["GoToBackOfHouse"] = Question("Back of House",
                                                         "You make your way to the back of the house and discover a troll fumbling with the back door. He was so busy he didn't see you approach. You notice a big rock on the ground",
                                                         [QuestionChoice(ChoiceTitle: "Say Hello",
                                                                         NextQuestionKey: "SayHelloToTroll"),
                                                          QuestionChoice(ChoiceTitle: "Pick Up Rock",
                                                                         NextQuestionKey: "PickUpRock"),
                                                          QuestionChoice(ChoiceTitle: "Help Troll Get in House",
                                                                         NextQuestionKey: "HelpTrollGetInHouse")]
        )
        AdventureQuestions["SayHelloToTroll"] = Question("Back of House",
                                                         "Mustering up courage, you greet the Troll with a friendly smile and wave. Like most Trolls, this one hates humans. It immediately picked up a large rock and hit your head with enough force to kill ten people. Unfortunately, you're dead.",
                                                         [QuestionChoice_TryAgain]
        )
        AdventureQuestions["PickUpRock"] = Question("Back of House",
                                                    "You pick up large rock. Luckily, the troll was too engrossed trying to get into the house to notice you.",
                                                    [QuestionChoice(ChoiceTitle: "Hit Troll With Rock!",
                                                                    NextQuestionKey: "TrollDied"),
                                                     QuestionChoice(ChoiceTitle: "Threaten Troll With Rock!",
                                                                    NextQuestionKey: "TrollAttacksAndKillsYou")
                                                    ]
        )
        AdventureQuestions["HelpTrollGetInHouse"] = Question("Back of House",
                                                             "The Troll looks at you with a puzzled look, grunts, picks up a large rock and hits you over the head with enough force to kill you. Unfortunately, you're dead.",
                                                             [QuestionChoice_TryAgain]
        )
        AdventureQuestions["TrollAttacksAndKillsYou"]=Question("Back of House",
                                                               "You make the meanest face that you've ever made, hold the rock up prominently so the troll can see it, and start screaming to the top of your lungs. Trolls never shy away from a fight. He finds a rock of his own, and proceeds to bash your head with it. Unfortunately, you're dead.",
                                                               [QuestionChoice_TryAgain])
        
        AdventureQuestions["TrollDied"]=Question("Back of House",
                                                 "Before the troll has enough time to respond, you begin hitting the troll in the head repeatedly until it finally lets out a shriek and dies. You are victorious!",
                                                 [QuestionChoice_StartOver])
        
    }
    //-----------------------------------------------------------------------------
    //This function gets the Adventure Description for the current question key.
    //-----------------------------------------------------------------------------
    func getAdventureDescription() -> String
    {
        return getAdventureQuestion(strKey: mstrCurrentQuestionKey)
    }
    //-----------------------------------------------------------------------------
    //This function gets the Adventure Title for the current question key.
    //-----------------------------------------------------------------------------
    func getAdventureTitle() -> String
    {
        return getAdventureTitle(strKey: mstrCurrentQuestionKey)
    }
    //-----------------------------------------------------------------------------
    //This function gets the button text for the current question key.
    //-----------------------------------------------------------------------------
    func getButtonText(intChoice :Int) -> String
    {
        let choice = getAdventureQuestionChoice(strKey: mstrCurrentQuestionKey, intChoice: intChoice)
        if choice != nil
        {
            if let choiceTitle = choice?.ChoiceTitle
            {
                return choiceTitle
            }
        }
        return ""
    }
    //-----------------------------------------------------------------------------
    //This function gets the Adventure title for the specified key. If the key
    //is invalid it returns an empty string.
    //-----------------------------------------------------------------------------
    func getAdventureTitle(strKey :String) -> String
    {
        if let strAdventureQuestion=AdventureQuestions[strKey] {
            return strAdventureQuestion.Title
        }
        return ""
    }
    //-----------------------------------------------------------------------------
    //This function returns the question text of the specified question key.
    //-----------------------------------------------------------------------------
    func getAdventureQuestion(strKey :String) -> String
    {
        if let strAdventureQuestion=AdventureQuestions[strKey] {
            return strAdventureQuestion.Question
        }
        return ""
    }
    //-----------------------------------------------------------------------------
    //THe following function returns the QuestionChoice struct for the specified
    //key and button.
    //-----------------------------------------------------------------------------
    func getAdventureQuestionChoice(strKey :String, intChoice: Int) -> QuestionChoice?
    {
        if let strAdventureQuestion = AdventureQuestions[strKey]{
            
            if strAdventureQuestion.QuestionChoices.indices.contains(intChoice) {
                let questionChoice = strAdventureQuestion.QuestionChoices[intChoice]
                return questionChoice
            }
        }
        return nil
    }
    //-----------------------------------------------------------------------------
    //This function returns the number of question choices for the specified
    //question key.
    //-----------------------------------------------------------------------------
    func getNumberOfAdventureChoices(strKey :String) -> Int?
    {
        if let strAdventureQuestion=AdventureQuestions[strKey] {
            return strAdventureQuestion.QuestionChoices.count
        }
        return nil
    }
    //-----------------------------------------------------------------------------
    //This function sets the button click that was chosen for the current question
    //key.
    //-----------------------------------------------------------------------------
    func setChoice(intChoice: Int)
    {
        let questionChoice = getAdventureQuestionChoice(strKey: mstrCurrentQuestionKey,intChoice: intChoice)
        mstrCurrentQuestionKey = questionChoice?.NextQuestionKey ?? "StartingQuestion"
    }
}




