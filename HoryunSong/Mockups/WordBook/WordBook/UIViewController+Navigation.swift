//
//  UIViewController+Navigation.swift
//  PilotPlantSwift
//
//  Created by lingostar on 2014. 10. 28..
//  Copyright (c) 2014년 lingostar. All rights reserved.
//

import UIKit
import ObjectiveC

private var backButtonHidden : Bool = false
private var tapKBDismiss : Bool = false


public extension UIViewController {
    
    @IBAction func modalDismiss(_ sender : AnyObject){
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func modalDismissPush(_ sender : AnyObject){
        var destVC : UIViewController! = nil
        //var tempVC : UIViewController! = nil
        if let presentingVC = self.presentingViewController as? UITabBarController {
            if let tempVC = presentingVC.selectedViewController as? UINavigationController {
                destVC = tempVC.topViewController
            } else {
                destVC = self.presentingViewController
            }
        } else if let presentingVC = self.presentingViewController as? UINavigationController {
            destVC = presentingVC.topViewController
        } else {
            destVC = self.presentingViewController
        }
        
        destVC.performSegue(withIdentifier: "ModalDismissPush", sender: nil)
        self.dismiss(animated: true, completion: nil)
    }
    
    
    
    @IBAction func navigationBack(_ sender : AnyObject){
        if let navigationCongtroller = self.navigationController {
            navigationController?.popViewController(animated: true)
        }
    }
    
    @IBAction func navigationBackToRoot(_ sender : AnyObject){
        if let navigationCongtroller = self.navigationController {
            navigationController?.popToRootViewController(animated: true)
        }
    }
    
    @IBAction func keyboardDismiss(_ sender: AnyObject) {
        for view in self.view.subviews {
            view.resignFirstResponder()
        }
    }
    
    @IBAction func openPhotoLibrary(_ sender: AnyObject) {
        
        let imagePickerController = UIImagePickerController()
        //imagePickerController.delegate = sender
        imagePickerController.sourceType = UIImagePickerControllerSourceType.savedPhotosAlbum
        imagePickerController.allowsEditing = true
        self.present(imagePickerController, animated: true, completion: { imageP in
            
        })
    }
    
    @IBInspectable var backHidden : Bool {
        get {
            return self.navigationItem.hidesBackButton
        }
        set (newValue){
            //backButtonHidden = newValue
            self.navigationItem.hidesBackButton = newValue
        }
    }
    
    /*
    @IBInspectable var keyboardDismiss : Bool {
        get {
            return objc_getAssociatedObject(self, &tapKBDismiss) as Bool!
        }
        set (newValue){
            objc_setAssociatedObject(self, &tapKBDismiss, newValue, UInt(OBJC_ASSOCIATION_RETAIN))
        }
        
    }
    
    public override func touchesEnded(touches: NSSet, withEvent event: UIEvent) {
        super.touchesEnded(touches, withEvent: event)
        if self.keyboardDismiss {
            for view in self.view.subviews {
                view.resignFirstResponder()
            }
        }
    }*/
    
    func viewSize() -> CGSize {
        return self.view.bounds.size
    }
}

