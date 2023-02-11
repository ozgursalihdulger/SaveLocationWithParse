//
//  AddPlaceVC.swift
//  FoursquareClone
//
//  Created by Özgür Salih Dülger on 7.02.2023.
//

import UIKit



class AddPlaceVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var placeNameText: UITextField!
    
    @IBOutlet weak var placeTypeText: UITextField!
    
    @IBOutlet weak var placeAtmosphereText: UITextField!
    
    @IBOutlet weak var placeImageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        placeImageView.isUserInteractionEnabled = true
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(chooseImage))
        placeImageView.addGestureRecognizer(gestureRecognizer)
        

      
    }
    

    @IBAction func nextButtonClicked(_ sender: Any) {
        
        if placeNameText.text! != "" && placeTypeText.text! != "" && placeAtmosphereText.text! != "" {
            
            if let chosenImage = placeImageView.image {
                let placeModel = PlaceModel.sharedInstance
                placeModel.placeName = placeNameText.text!
                placeModel.placeType = placeTypeText.text!
                placeModel.placeAtmosphere = placeAtmosphereText.text!
                placeModel.placeImage = chosenImage
                
            }
            self.performSegue(withIdentifier: "toMapVC", sender: nil)
            
           
        } else {
            let alert = UIAlertController(title: "HATA!", message: "İstenilen bilgileri lütfen eksiksiz giriniz.", preferredStyle: UIAlertController.Style.alert)
            let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default)
            alert.addAction(okButton)
            present(alert, animated: true)
        }
        
        
        
        
       
    }
    @objc func chooseImage () {
        
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = .photoLibrary
        self.present(picker, animated: true)
      
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        placeImageView.image = info[.originalImage] as? UIImage
        self.dismiss(animated: true)
    }
    
}
