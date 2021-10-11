import Foundation
import PlaygroundSupport
import SpriteKit
import UIKit
import AVFoundation

public func LoadLiveView() {
    
    loadFont(name: "Avenixel-Regular", withExtension: "ttf")

    let sceneView = SKView(frame: CGRect(x:0 , y:0, width: 560, height: 980))
        
    if let scene = Scene1(fileNamed: "IntroductionScenes/Scene1.sks"){
        scene.scaleMode = .aspectFill
        sceneView.presentScene(scene)
        
    }
        
    sceneView.ignoresSiblingOrder = false
    sceneView.showsPhysics = false
    
    PlaygroundSupport.PlaygroundPage.current.liveView = sceneView
        
}



public func loadFont(name:String, withExtension:String) {
    
    if let fontURL = Bundle.main.url(forResource: name, withExtension: withExtension)
    {
        CTFontManagerRegisterFontsForURL(fontURL as CFURL, .process, nil)
    }
    
}
