//
//  AppDelegate.swift
//  TrabalhoPratico
//
//  Created by Bruno Ferreira on 11/12/2018.
//  Copyright © 2018 Bruno Ferreira. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    var nameFile = ""
    
    var lstDisciplinas:[Disciplina] = []{
        didSet{
            print("Lista de disciplinas:")
            for disciplina in lstDisciplinas{
                print(" - \(disciplina.description)")
            }
        }
    }

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        nameFile = getFileName(nomeFich: "Disciplinas.dat")
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
        saveDisciplinas()
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }

    func getFileName(nomeFich : String) -> String {
        let directoty = FileManager().urls(for: .documentDirectory, in: .userDomainMask ).first!
        let filePath = directoty.appendingPathComponent(nomeFich)
        return filePath.path
    }
    
    func saveDisciplinas(){
        print("\nA gravar no ficheiro \(nameFile)")
        //NSKeyedArchiver.archiveRootObject(groupsArray, toFile: filePath(key: "file.archive"))
        if NSKeyedArchiver.archiveRootObject(lstDisciplinas, toFile: nameFile ) {
            print("Foi Gravado")
        } else {
            print("Deu Erro")
        }
    }
    
    func readFile(){
        print("\nA ler... \(nameFile)")
        
        let table = NSKeyedUnarchiver.unarchiveObject(withFile: nameFile) as? [Disciplina]
        
        if table == nil {
            print("Erro na leitura")
        } else {
            print("Estou a ler \(table!.count) disciplinas")
        }
        
        lstDisciplinas = table ?? []
        
    }
}

