//
//  HomePage.swift
//  Dek-D Internship
//
//  Created by Parisut Supchokpool on 16/5/2565 BE.
//

import UIKit

class HomePage: UITableViewController,addData {
    
    //mock up
    var alldata:[modeldata] = [modeldata(title: "เตรียมสอบ", desc: "อวยโพยเชิญทู้นี้! ส่อง ''โพยเตรียมสอบ'' ในวิถีเซียน ละเอียดชนิดหมูบดยังต้องยอมแพ้"),modeldata(title: "งาน #VMas", desc: "มาดูกัน งาน#VMAs ปีนี้ P!nk สอนอะไรเรา"),modeldata(title: "ซุปกิมจิที่ไหนอร่อย?", desc: "ซุปกินจิที่ไหนอร่อย? ก็ซุปกิมจิที่ทำกินเองไง!"),modeldata(title: "เฟรชชี่ปี1", desc: "เปิดวาปเฟรชชี่ปี1"),modeldata(title: "บอกกองซีรีส์คุณพ่อบรู๊ค", desc: "น้องณดาน่ารักมาก!! บุกกองซีรีส์คุณพ่อบรู๊ค")]
    var delegate:addData?

    func addDataDelegate(rawdata: modeldata) {
        alldata.insert(rawdata, at: 0)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "CustomCell", bundle: nil), forCellReuseIdentifier: "cell")
    }

    override func viewDidAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return alldata.count ?? 0
    }
    

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomCell
        cell.customcell(name: alldata[indexPath.row].title ?? "", des: alldata[indexPath.row].desc ?? "")
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(ontap(gesture:)))
        cell.tag = indexPath.row
        cell.addGestureRecognizer(tapGesture)
        return cell
    }
    
    
    @objc func ontap(gesture:UITapGestureRecognizer) {
    
        if let cell = gesture.view {
            performSegue(withIdentifier: "showdata", sender: alldata[cell.tag])
        }
        
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            alldata.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "passdata" {
            let vc = segue.destination as! addPage
            vc.delegate = self
        }
        else if segue.identifier == "showdata" {
            let vc = segue.destination as! dataPage
            vc.showdata = sender as!  modeldata
        }
    }
    
}

