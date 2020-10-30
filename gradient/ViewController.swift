//
//  ViewController.swift
//  gradient
//
//  Created by Cüneyt Ayvaz on 29.10.2020.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var gradientView: UIView!
    @IBOutlet weak var gradientViewTopContraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame.size = gradientView.frame.size
        gradientLayer.colors = [UIColor.red.cgColor, UIColor.blue.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 0.0)
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 1.0)
        gradientView.layer.insertSublayer(gradientLayer, at: 0)
        
        tableView.register(GradientTableViewCell.nib, forCellReuseIdentifier: GradientTableViewCell.identifier)
                tableView.delegate = self
                tableView.dataSource = self
    }
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 30
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: GradientTableViewCell.identifier, for: indexPath) as! GradientTableViewCell
        return cell
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        let top = -tableView.contentOffset.y
        let bottom = tableView.contentSize.height - tableView.frame.size.height - tableView.contentOffset.y
        
        if top > 0 {
            gradientViewTopContraint.constant = top
        }
        else if bottom < 0 {
            gradientViewTopContraint.constant = bottom
        }
         
    }
}
