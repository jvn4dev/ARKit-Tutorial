//
//  ViewController.swift
//  ARDicee
//
//  Created by 정성준 on 2021/03/10.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {

    @IBOutlet var sceneView: ARSCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the view's delegate
        sceneView.delegate = self
        
        let sphere = SCNSphere(radius: 0.2)
        
        let cube = SCNBox(width: 0.1, height: 0.1, length: 0.1, chamferRadius: 0.05)
        
        let material = SCNMaterial()
        
        material.diffuse.contents = UIImage(named: "art.scnassets/8k_earth_daymap.jpeg")
        
        sphere.materials = [material]
        
        let node = SCNNode()
        
        node.position = SCNVector3(0, 0.1, -0.5)
        
        node.geometry = sphere
        
        sceneView.scene.rootNode.addChildNode(node)
        
        sceneView.autoenablesDefaultLighting = true

//        // Create a new scene
//        let scene = SCNScene(named: "art.scnassets/ship.scn")!
//
//        // Set the scene to the view
//        sceneView.scene = scene
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARWorldTrackingConfiguration()

        // Run the view's session
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }

}
