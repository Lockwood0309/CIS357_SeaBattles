//
//  ViewController.swift
//  SeaBattles
//
//  Created by Lockwood on 4/10/22.
//

import UIKit
import GameKit

class ViewController: UIViewController, GKGameCenterControllerDelegate, GKMatchmakerViewControllerDelegate, GKTurnBasedMatchmakerViewControllerDelegate {
    func turnBasedMatchmakerViewControllerWasCancelled(_ viewController: GKTurnBasedMatchmakerViewController) {
        viewController.dismiss(animated: true, completion: nil)
    }
    
    func turnBasedMatchmakerViewController(_ viewController: GKTurnBasedMatchmakerViewController, didFailWithError error: Error) {
        viewController.dismiss(animated: true, completion: nil)
    }
    
    func matchmakerViewControllerWasCancelled(_ viewController: GKMatchmakerViewController) {
        viewController.dismiss(animated: true, completion: nil)
    }
    
    func matchmakerViewController(_ viewController: GKMatchmakerViewController, didFailWithError error: Error) {
        viewController.dismiss(animated: true, completion: nil)
    }
    
    
    
    func gameCenterViewControllerDidFinish(_ gameCenterViewController: GKGameCenterViewController) {
        
        gameCenterViewController.dismiss(animated: true, completion: nil)
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        AuthUser()
        
    }

    private func AuthUser(){
        let user = GKLocalPlayer.local
        user.authenticateHandler = { vc, error in
            guard error == nil else{
                print(error?.localizedDescription ?? "")
                return
            }
            
            
            if let vc = vc{
                self.present(vc, animated: true, completion: nil)
            }
        } 
    }

    @IBAction func ShowLeaderBoard(_ sender: Any) {
        let vc = GKGameCenterViewController()
        vc.gameCenterDelegate = self
        vc.viewState = .leaderboards
        vc.leaderboardIdentifier = "Sea_Battles_Leaders_22"
        present(vc,animated: true,completion: nil)
    }
    
    @IBAction func ShowAchievements(_ sender: Any) {
        let vc = GKGameCenterViewController()
        vc.gameCenterDelegate = self
        vc.viewState = .achievements
        present(vc,animated: true,completion: nil)
    }
    
    @IBAction func StartGame(_ sender: Any) {
        presentMatchmaker()
    }
    
    func presentMatchmaker() {
            guard GKLocalPlayer.local.isAuthenticated else {return}
            
            let request = GKMatchRequest()
            request.minPlayers = 2
            request.maxPlayers = 2
            request.inviteMessage = ""
//            let vc = GKGameCenterViewController()
//            vc.gameCenterDelegate = self
            let vc = GKTurnBasedMatchmakerViewController(matchRequest: request)
//            let vc = GKMatchmakerViewController(matchRequest: request)
//            vc?.matchmakerDelegate = self
            vc.turnBasedMatchmakerDelegate = self
            let rootViewController = UIApplication.shared.windows.first!.rootViewController
            rootViewController?.present(vc, animated: true, completion: nil)
//            delegate?.presentMatchmaking(viewController: vc)
        }
    
//    extension GameCenterHelper: GKMatchmakerViewControllerDelegate {
//        func matchmakerViewController(_ viewController: GKMatchmakerViewController, didFind match: GKMatch) {
//            viewController.dismiss(animated: true)
//            delegate?.presentGame(match: match)
//        }
//    }
}



