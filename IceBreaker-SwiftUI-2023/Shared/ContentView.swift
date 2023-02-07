//
//  ContentView.swift
//  Shared
//
//  Created by forensics on 1/31/23.
//

import SwiftUI
import Firebase

struct ContentView: View {
    
    let db = Firestore.firestore()
    
    @State var txtFirstName: String = ""
    @State var txtLastName: String = ""
    @State var txtPrefName: String = ""
    
    @State var txtQuestion: String = "Test"
    @State var txtAnswer: String = ""
    
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
            }
            
            Text(txtQuestion)
            
            TextField("Answer: ", text: $txtAnswer)
            
            Button(action: sendAnswerToFirebase) {
                Text("Submit")
                    .padding(5)
            }
            
        }
        .multilineTextAlignment(.center)
        .disableAutocorrection(true)
        .onAppear(){
            //Executes this code
            //Fetch Questions form database
            
            getQuestionsFromFirebase()
        }
        
        
    }
    
    
    func getQuestionsFromFirebase(){
        
    }
    
    func setQuestion(){
        txtQuestion = txtFirstName
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
