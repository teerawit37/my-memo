//
//  ViewController.swift
//  MemoDemo
//
//  Created by Teerawit on 10/7/2558 BE.
//  Copyright © 2558 CEASON. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate {
    
    @IBOutlet weak var mTableview:UITableView!
    var dataSource:NSMutableArray = NSMutableArray()
    var headerView:UIImageView = UIImageView()

    override func viewDidLoad() {
        super.viewDidLoad()
        headerView.frame = CGRectMake(0, 0, 270, 270)
        headerView.backgroundColor = UIColor.clearColor()
        //headerView.backgroundColor = UIColor.orangeColor()
        headerView.image = UIImage(named: "inhub logo-01.png")
        headerView.userInteractionEnabled = true
        headerView.contentMode = UIViewContentMode.ScaleAspectFit
        
        let textView:UITextField = UITextField(frame: CGRectMake(69, 245, 182, 30 ))
        //textView.backgroundColor = UIColor.whiteColor()
        //textView.background = UIImage(named: "inhub logo-01.png")
        textView.textAlignment = NSTextAlignment.Center
        textView.placeholder = "Enter Your Note"
        textView.delegate = self
        textView.clearButtonMode = UITextFieldViewMode.Always
        headerView.addSubview(textView)
        mTableview.tableHeaderView = headerView
        
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder() //hidden keyboard
        dataSource.addObject(textField.text!);
        textField.text = ""
        print("%s", dataSource.description);
        mTableview.reloadData()
        return true
    }
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataSource.count
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell")
        cell?.textLabel?.text = self.dataSource.objectAtIndex(indexPath.row)
            as? String
        return cell!
    }
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let alert:UIAlertController = UIAlertController(title: "Message", message: "Thankyou for Calling", preferredStyle: UIAlertControllerStyle.Alert)
        
        alert.addAction(UIAlertAction(title: "Close it", style: UIAlertActionStyle.Default, handler: nil))
        alert.addAction(UIAlertAction(title: "Remove it", style: UIAlertActionStyle.Default, handler: { alertAction in
            self.dataSource.removeObjectAtIndex(indexPath.row)
            self.mTableview.reloadData()
        
        }))
        self.presentViewController(alert, animated: true, completion: nil)
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

