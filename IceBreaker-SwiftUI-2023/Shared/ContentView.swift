//
//  ContentView.swift
//  Shared
//
//  Created by forensics on 1/31/23.
//

import SwiftUI
import Firebase
import FirebaseFirestore

struct ContentView: View {
    
    let db = Firestore.firestore()
    
    @State var txtFirstName: String = ""
    @State var txtLastName: String = ""
    @State var txtPrefName: String = ""
    
    @State var txtQuestion: String = "Test"
    @State var txtAnswer: String = ""
    
    @State var questions = [Question]()
    
    var body: some View {
        VStack {
            Text("Placeholder")
                .font(.system(size: 40))
                .bold()
            Text("By: S. Wondolowski")
                .padding(.bottom)
        
                        
            TextField("First Name:", text: $txtFirstName)
            TextField("Last Name:", text: $txtLastName)
            TextField("Pref Name:", text: $txtPrefName)
            
                        
            Button(action: setQuestion) {
                Text("Get Question")
                    .padding(5)
            }.buttonStyle(.borderedProminent)
                .buttonBorderShape(.roundedRectangle(radius: 20))
            
        
            Text(txtQuestion)
            
            TextField("Answer: ", text: $txtAnswer)

            
            
            Button(action: sendAnswerToFirebase) {
                Text("Submit")
                    .padding(5)
            }.buttonStyle(.borderedProminent)
                .buttonBorderShape(.roundedRectangle(radius: 20))
            
            
        }
        .multilineTextAlignment(.center)
        .disableAutocorrection(true)
        .onAppear(){
            //Executes this code
            //Fetch Questions form database
            
            getQuestionsFromFirebase()
        }
        
        
    }
    
    
    func getQuestionsFromFirebase(){ // fetches questions from firebase
        db.collection("questions")
            .getDocuments() { (querySnapshot,err) in
                if let err = err{
                    print("Error getting documents: \(err)")
                } else {
                    for document in querySnapshot!.documents {
                        print("Document Id Fetched: \(document.documentID)")
                        print("\(document.data())")
                        
                        let question = Question(id: document.documentID, data: document.data())
                        
                        self.questions.append(question!)
                    }
                            
                }
                
            }
    }
    
    func setQuestion(){ // Randomly pick a question from my questions array
        txtQuestion = questions.randomElement()!.text
        
        //tracks previous question so next question is different
    }
    
    func sendAnswerToFirebase(){
        txtQuestion = ""
    }
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
