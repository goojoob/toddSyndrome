//
//  InfoSlidesController.swift
//  toddSyndrome
//
//  Created by Antonio Rodriguez Cia on 1/11/16.
//  Copyright © 2016 Goojoob. All rights reserved.
//

import UIKit

class InfoSlidesController: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var logoImage: UIImageView!
    @IBOutlet weak var infoText: UILabel!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var launchButton: customButton!
    private let numPages:CGFloat = 2.0

    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setScrollViewContentPages()
        self.setCurrentPage(page: 0)
    }

    
    //CONFIGURE SCROLL AND PAGES
    
    private func setScrollViewContentPages() {
        self.scrollView.frame = CGRect(x:0, y:0, width:self.view.frame.width, height:self.view.frame.height)
        self.scrollView.contentSize = CGSize(width:self.scrollView.frame.width * self.numPages, height:self.scrollView.frame.height)
        self.scrollView.delegate = self
    }
    
    private func setCurrentPage(page:Int) {
        self.pageControl.currentPage = page
    }

    
    
    
    //SET CHANGES IN PAGES WHEN SCROLLING
    
    func scrollViewWillBeginDecelerating(_ scrollView: UIScrollView) {
        let pageWidth:CGFloat = self.scrollView.frame.width
        let currentPage = Int(floor((self.scrollView.contentOffset.x-pageWidth/self.numPages)/pageWidth)+1)
        
        self.setCurrentPage(page: currentPage);
        
        if currentPage == 0{
            self.setDataPage0()
        }else if currentPage == 1{
            self.setDataPage1()
        }
    }

    
    private func setDataPage0() {
        UIView.animate(withDuration: 0.5, delay: 0.3, options: [], animations: {
            self.infoText.text = "with this application you can identify how likely is a patient to have the neurological condition Todd’s Syndrome"
            self.view.backgroundColor = UIColor(netHex: 0xEFBE19)
            self.logoImage.image = UIImage(named: "Alice")
            self.launchButton.alpha = 0
        }, completion: nil)
    }
    
    private func setDataPage1() {
        UIView.animate(withDuration: 0.5, delay: 0.3, options: [], animations: {
            self.infoText.text = "add new patients and check past results in the patient list"
            self.view.backgroundColor = UIColor(netHex: 0x1cb99c)
            self.logoImage.image = UIImage(named: "Cat")
            self.launchButton.alpha = 1
        }, completion: nil)

    }

}
