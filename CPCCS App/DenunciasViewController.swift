//
//  DenunciasViewController.swift
//  CPCCS App
//
//  Created by Leonardo on 4/2/17.
//  Copyright © 2017 CPCCS. All rights reserved.
//
import UIKit

class DenunciasViewController: UIPageViewController, UIPageViewControllerDelegate, UIPageViewControllerDataSource {
    
    let pages = ["Denuncias1", "Denuncias2", "Denuncias3", "Denuncias4"]
    var denuncia = Denuncia.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        self.dataSource = self
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "Denuncias1")
        setViewControllers([vc!],
            direction: .forward,
            animated: true,
            completion: nil)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        for view in view.subviews {
            if view is UIScrollView {
                view.frame = UIScreen.main.bounds // Why? I don't know.
            }
            else if view is UIPageControl {
                view.backgroundColor = UIColor.black
            }
        }
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        if let identifier = viewController.restorationIdentifier {
            if let index = pages.index(of: identifier) {
                if index > 0 {
                    return self.storyboard?.instantiateViewController(withIdentifier: pages[index-1])
                }
            }
        }
        return nil
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        if let identifier = viewController.restorationIdentifier {
            /*
            if let index = pages.index(of: identifier) {
                if index < pages.count - 1 {
                    return self.storyboard?.instantiateViewController(withIdentifier: pages[index+1])
                }
            }*/
            if let index = pages.index(of: identifier) {
                if(index == 0 && denuncia.getPrimeraVentana()){
                    return self.storyboard?.instantiateViewController(withIdentifier: pages[1])
                } else if(index == 1 && denuncia.getSegundaVentana()){
                    return self.storyboard?.instantiateViewController(withIdentifier: pages[2])
                } else if(index == 2 && denuncia.getTerceraVentana()){
                    return self.storyboard?.instantiateViewController(withIdentifier: pages[3])
                }
            }
            /*if denuncia.getTerceraVentana(){
                return self.storyboard?.instantiateViewController(withIdentifier: pages[3])
            } else if denuncia.getSegundaVentana(){
                return self.storyboard?.instantiateViewController(withIdentifier: pages[2])
            } else if denuncia.getPrimeraVentana(){
                return self.storyboard?.instantiateViewController(withIdentifier: pages[1])
            }*/
        }
        return nil
    }
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return pages.count
    }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        if let identifier = viewControllers?.first?.restorationIdentifier {
            if let index = pages.index(of: identifier) {
                return index
            }
        }
        return 0
    }
}
