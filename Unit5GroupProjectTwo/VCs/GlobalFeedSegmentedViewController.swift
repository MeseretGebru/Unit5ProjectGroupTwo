//
//  GlobalFeedSegmentedViewController.swift
//  Unit5GroupProjectTwo
//
//  Created by C4Q on 2/6/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import UIKit

extension GlobalPostFeedVC: UIScrollViewDelegate {
    private func setUpScrollViewConstraints() {
        scrollView.snp.makeConstraints { (make) -> Void in
            make.width.equalTo(view.snp.width)
            make.height.equalTo(view.safeAreaLayoutGuide.snp.height)
            make.centerX.equalTo(view.safeAreaLayoutGuide.snp.centerX)
            make.centerY.equalTo(view.safeAreaLayoutGuide.snp.centerY)
            
        }
    }
    @objc func segmentValueChanged(sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            pageControl.currentPage = 0
            frame.origin.x = self.scrollView.frame.size.width * CGFloat(0)
            frame.size = self.scrollView.frame.size
            
            let subView = UIView(frame: frame)
            subView.addSubview(feedView)
            //subView.backgroundColor = colors[0]
            self.scrollView .addSubview(subView)
            
            let x = CGFloat(pageControl.currentPage) * scrollView.frame.size.width
            scrollView.setContentOffset(CGPoint(x:x, y:0), animated: true)
        }
        if sender.selectedSegmentIndex == 1 {
            pageControl.currentPage = 1
            
            frame.origin.x = self.scrollView.frame.size.width * CGFloat(1)
            frame.size = self.scrollView.frame.size
            
            let subView = UIView(frame: frame)
            subView.addSubview(popularFeedView)
           // subView.backgroundColor = colors[1]
            self.scrollView .addSubview(subView)
            
            let x = CGFloat(pageControl.currentPage) * scrollView.frame.size.width
            scrollView.setContentOffset(CGPoint(x:x, y:0), animated: true)
        }
    }
    func configurePageControl() {
        // The total number of pages that are available is based on how many available colors we have.
        
        self.pageControl.numberOfPages = 2
        self.pageControl.currentPage = 0
        self.pageControl.tintColor = UIColor.red
        self.pageControl.pageIndicatorTintColor = UIColor.black
        self.pageControl.currentPageIndicatorTintColor = UIColor.green
        
          pageControl.addTarget(self, action: #selector(changePage(sender:)), for: UIControlEvents.valueChanged)
        self.view.addSubview(pageControl)
    }
    
    
    func setupScrollView() {
        self.view.addSubview(scrollView)
        setUpScrollViewConstraints()
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.showsVerticalScrollIndicator = false
        scrollView.bounces = false
        scrollView.scrollsToTop = true
        
        scrollView.contentSize = CGSize(width: self.scrollView.frame.size.width * 2, height: self.scrollView.frame.size.height)
    for index in 0...1 {
    
    frame.origin.x = self.scrollView.frame.size.width * CGFloat(index)
    frame.size = self.scrollView.frame.size
    
    let subView = UIView(frame: frame)
   // subView.backgroundColor = colors[index]
        switch index {
        case 0:
            subView.addSubview(feedView)
        default:
            subView.addSubview(popularFeedView)
            subView.backgroundColor = .green
        }
        self.scrollView.addSubview(subView)
        
    }
    }
    
    @objc func changePage(sender: UIPageControl) -> () {
       
        var frame = scrollView.frame
        frame.origin.x = frame.size.width * CGFloat(sender.currentPage)
        frame.origin.y = 0
        let x = CGFloat(pageControl.currentPage) * scrollView.frame.size.width
        scrollView.setContentOffset(CGPoint(x:x, y:0), animated: true)
        scrollView.scrollRectToVisible(frame, animated: true)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        
        let pageNumber = round(scrollView.contentOffset.x / scrollView.frame.size.width)
        pageControl.currentPage = Int(pageNumber)
        segmentView.selectedSegmentIndex = pageControl.currentPage
    }
    func gestureRecognizer(gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWithGestureRecognizer otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }

}
