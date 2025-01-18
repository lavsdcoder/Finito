//
//  MainViewViewModel.swift
//  Finito
//
//  Created by Rauls Lav on 17/01/25.
//

import Foundation
import FirebaseAuth

class MainViewViewModel : ObservableObject {
    
    @Published var currentuserId : String = ""
    
    private var handler: AuthStateDidChangeListenerHandle?

    
    init(){
        self.handler = Auth.auth().addStateDidChangeListener { [weak self] _, user in
                    DispatchQueue.main.async {
                        self?.currentuserId = user?.uid ?? ""
                    }
                }
    }
    
    func isSignedIn() -> Bool{
        return Auth.auth().currentUser != nil
    }
    
}
