//
//  ViewController.swift
//  SolarSystemArKit
//
//  Created by Ali Atakan AKMAN on 5.10.2020.
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
        
        // let myBox = SCNBox(width: 0.1, height: 0.1, length: 0.1, chamferRadius: 0.01)
        
        let sun = createSphere(radius: 0.9, content: "sun", vector: SCNVector3(0,0.2,-3))
        sceneView.scene.rootNode.addChildNode(sun)
        
        sceneView.automaticallyUpdatesLighting = true
        
        
        let mercury = createSphere(radius: 0.1, content: "mercury", vector: SCNVector3(1.3, 0.2, -3))
        
        sceneView.scene.rootNode.addChildNode(mercury)
        
        sceneView.automaticallyUpdatesLighting = true
        
        let venus = createSphere(radius: 0.3, content: "venus", vector: SCNVector3(2, 0.2, -3))
        
        sceneView.scene.rootNode.addChildNode(venus)
        
        sceneView.automaticallyUpdatesLighting = true
        
        let earth = createSphere(radius: 0.3, content: "earth", vector: SCNVector3(3, 0.2, -3))
        
        sceneView.scene.rootNode.addChildNode(earth)
        
        sceneView.automaticallyUpdatesLighting = true
        
        let mars = createSphere(radius: 0.2, content: "mars", vector: SCNVector3(4, 0.2, -3))
        
        sceneView.scene.rootNode.addChildNode(mars)
        
        sceneView.automaticallyUpdatesLighting = true
        
        let jupiter = createSphere(radius: 0.6, content: "jupiter", vector: SCNVector3(6, 0.2, -3))
        
        sceneView.scene.rootNode.addChildNode(jupiter)
        
        sceneView.automaticallyUpdatesLighting = true
        
        let saturn = createSphere(radius: 0.6, content: "saturn", vector: SCNVector3(9, 0.2, -2))
        
        sceneView.scene.rootNode.addChildNode(saturn)
        
        sceneView.automaticallyUpdatesLighting = true
        
        let uranus = createSphere(radius: 0.4, content: "uranus", vector: SCNVector3(13, 0.2, -1))
        
        sceneView.scene.rootNode.addChildNode(uranus)
        
        sceneView.automaticallyUpdatesLighting = true
        
        let neptun = createSphere(radius: 0.4, content: "neptun", vector: SCNVector3(18, 0.2, 0))
        
        sceneView.scene.rootNode.addChildNode(neptun)
        
        sceneView.automaticallyUpdatesLighting = true
        
      
        
        
    }
    
    func createSphere(radius : CGFloat, content : String , vector : SCNVector3)  -> SCNNode{
        
        let mySphere = SCNSphere(radius: radius)
        
        let boxMaterial = SCNMaterial()
        
        boxMaterial.diffuse.contents = UIImage(named: "art.scnassets/\(content).png")
        
        mySphere.materials = [boxMaterial]
        
        let node = SCNNode()
        
        node.position = vector
        
        node.geometry = mySphere
        
        return node
        
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

    // MARK: - ARSCNViewDelegate
    
/*
    // Override to create and configure nodes for anchors added to the view's session.
    func renderer(_ renderer: SCNSceneRenderer, nodeFor anchor: ARAnchor) -> SCNNode? {
        let node = SCNNode()
     
        return node
    }
*/
    
    func session(_ session: ARSession, didFailWithError error: Error) {
        // Present an error message to the user
        
    }
    
    func sessionWasInterrupted(_ session: ARSession) {
        // Inform the user that the session has been interrupted, for example, by presenting an overlay
        
    }
    
    func sessionInterruptionEnded(_ session: ARSession) {
        // Reset tracking and/or remove existing anchors if consistent tracking is required
        
    }
}
