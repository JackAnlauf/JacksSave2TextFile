//
//  ViewController.swift
//  JacksSave2TextFile
//
//  Created by student on 3/11/25.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func writeMyText(_ sender: Any) {
        let fm = FileManager.default
        let urls = fm.urls(for: .documentDirectory, in: .userDomainMask)
        let url = urls.last?.appendingPathComponent("file.text")
        do {
            try typeTextHere.text.write(to: url!, atomically: true, encoding: String.Encoding.utf8)
        } catch {
            print("Error writing file")
        }
        
        
    }
    @IBAction func readMyText(_ sender: Any) {
        
        let fm = FileManager.default
        let urls = fm.urls(for: .documentDirectory, in: .userDomainMask)
        let url = urls.last?.appendingPathComponent("file.text")
        do {
            let fileContent = try String(contentsOf: url!, encoding: String.Encoding.utf8)
            displayTextHere.text = fileContent
        } catch {
            print("error reading file")
        }
        
    }
    
    @IBOutlet var typeTextHere: UITextView!
    @IBOutlet var displayTextHere: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        typeTextHere.text = "Type your new text right here"
        displayTextHere.text = ""
        
        
    }


}

