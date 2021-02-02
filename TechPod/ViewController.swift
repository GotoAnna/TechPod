//
//  ViewController.swift
//  TechPod
//
//  Created by Mac on 2021/02/03.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    //TableViewを宣言
    @IBOutlet var table: UITableView!
    
    var songNameArray = [String]() //曲名を入れるための配列
    var fileNameArray = [String]() //曲のファイル名を入れるための配列
    var imageNameArray = [String]() //音楽家の画像を入れるための配列
    
    //音楽を再生するための変数
    var audioPlayer : AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //テーブルビューのデータソースメソッドはViewControllerクラスに書くという設定
        table.dataSource = self
        
        //テーブルビューのデリゲードメソッドはViewControllerメソッドに書くという設定
        table.delegate = self
        
        //songNameArrayに曲名を入れていく
        songNameArray = ["カノン", "エリーゼのために", "G線上のアリア"]
        
        fileNameArray = ["cannon", "elise", "aria"] //ファイル名
        imageNameArray = ["Pachelbel.jpg", "Beethoven.jpg", "Bach.jpg"] //画像
        
    }
    
    
    
    //セル数の設定
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return songNameArray.count //SongNameArrayの数
    }
    
    //ID付きのセルを取得して, セル付属のtextLabelに「テスト」と表示させてみる
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
        
        //indexPath.raw：セルのインデックス番号が設定されている
        cell?.textLabel?.text = songNameArray[indexPath.row]
        
        //セルに音楽家の画像を表示する
       cell?.imageView?.image = UIImage(named: imageNameArray[indexPath.row])
        
        return cell!
    }
    
   
    //セルが押された時に呼ばれるメソッド
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        print("\(songNameArray[indexPath.row])が選ばれました！")
        
        //音楽ファイルを指定して, パスを取得
        let audioPath = URL(fileURLWithPath: Bundle.main.path(forResource: fileNameArray[indexPath.row], ofType: "mp3")!)
        
        //再生の準備(AVAudioPlayerに音楽ファイルのパスを渡す)
        audioPlayer = try? AVAudioPlayer(contentsOf: audioPath)
        
        //音楽を再生
        audioPlayer.play()
    }


}

