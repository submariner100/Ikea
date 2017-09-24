//
//  ViewController.swift
//  Ikea
//
//  Created by Macbook on 23/09/2017.
//  Copyright © 2017 Chappy-App. All rights reserved.
//

import UIKit
import ARKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

	let itemsArray: [String] = ["cup", "vase", "boxing", "table"]
	@IBOutlet weak var sceneView: ARSCNView!
	@IBOutlet weak var itemsCollectionView: UICollectionView!
	
	let configuration = ARWorldTrackingConfiguration()
	
	override func viewDidLoad() {
		super.viewDidLoad()
	
		self.sceneView.debugOptions = [ARSCNDebugOptions.showWorldOrigin, ARSCNDebugOptions.showFeaturePoints]
		self.sceneView.session.run(configuration)
		self.itemsCollectionView.dataSource = self
		self.itemsCollectionView.delegate = self
		
	
	}

	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return itemsArray.count
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Item", for: indexPath) as! ItemCell
		cell.itemLabel.text = self.itemsArray[indexPath.row]
		return cell
		
	}
	
	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
		let cell = collectionView.cellForItem(at: indexPath)
		cell?.backgroundColor = UIColor.green
	}
	
	func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
		let cell = collectionView.cellForItem(at: indexPath)
		cell?.backgroundColor = UIColor.orange
	}
	
	func centerPivot(for node: SCNNode) {
		let min = node.boundingBox.min
		let max = node.boundingBox.max
		node.pivot = SCNMatrix4MakeTranslation(
			min.x + (max.x - min.x)/2,
			min.y + (max.y - min.y)/2,
			min.z + (max.z - min.z)/2
		)
	}


}

