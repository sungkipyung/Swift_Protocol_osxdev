//: Playground - noun: a place where people can play

import UIKit

// gallery view controller를 띄워서 
// 사진을 하나 선택 해온다고 가정해볼께요.
protocol GalleryViewControllerDelegate: class {
    func galleryViewController(_ vc: GalleryViewController, didSelectImage image: UIImage)
}

class GalleryViewController: UIViewController {
    weak var delegate: GalleryViewControllerDelegate?
    
    func didSelectImage(_ image: UIImage) {
        delegate?.galleryViewController(self, didSelectImage: image)
        
        dismiss(animated: true, completion: nil)
        
    }
}

class MyViewController: UIViewController {
//    @IBAction
    func touchUpPresentGalleryButton(_ sender: UIButton) {
        guard let destination = self.storyboard?.instantiateViewController(withIdentifier: "GalleryViewController") as? GalleryViewController else { return }
        
        destination.delegate = self
        
        self.present(destination, animated: true, completion: nil)
    }
}


extension MyViewController: GalleryViewControllerDelegate {
    func galleryViewController(_ vc: GalleryViewController, didSelectImage image: UIImage) {
        // TODO: Handle selected image
    }
}