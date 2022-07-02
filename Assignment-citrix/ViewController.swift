//
//  ViewController.swift
//  Assignment-citrix
//
//  Created by Nitin Agnihotri on 02/07/22.
//

import UIKit
import WebKit
import SafariServices

class ViewController: UIViewController {

    @IBOutlet var newsTableView: UITableView!
    private var newsListVM = NewsListVM()
    private var newsListData: NewsData?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        callApiToGetNews()
    }
    
    private func callApiToGetNews() {
        if ConnectionManager.sharedInstance.isReachable {
            showLoader()
            newsListVM.callFuncToGetMoviewList(newsListUrl) { news, error in
                if error == nil,
                   let newsList = news {
                    self.getDataAndReload(newsList)
                } else {
                    self.performError(error: error,message: nil)
                }
            }
        } else {
            self.performError(error: nil,message: NO_INTERNET_CONNECTION)
        }
    }
    
    private func performError(error: Error?,message:String?) {
        removeLoader()
        AlertController.alert(target:self,title: "", message: error?.localizedDescription ?? "", buttons: ["Ok"]) { alert, selectedIndex in
            
        }
    }
    
//    private func openWebKitUrl(_ urlStr:String) {
//        let url = URL(string: urlStr)
//        let request = URLRequest(url: url!)
//        let webView = WKWebView(frame: self.view.frame)
//        self.view.addSubview(webView)
//        webView.navigationDelegate = self
//        webView.load(request)
//    }
    
    func showLinksClicked(_ urlStr:String) {
        
        let url = URL(string: urlStr)!
        let safariVC = SFSafariViewController(url: url)
        present(safariVC, animated: true, completion: nil)
        safariVC.delegate = self
    }

}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsListData?.results.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NewsDataTableCell", for: indexPath) as! NewsDataTableCell
        cell.configureCell(newsListData!, index: indexPath.row)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let url = newsListData?.results[indexPath.row].url {
//            openWebKitUrl(url)
            showLinksClicked(url)
        }
    }
}

extension ViewController {
    func getDataAndReload(_ newsListModel:NewsData) {
        removeLoader()
        
        newsListData = newsListModel
        newsTableView.reloadData()
    }
}

extension ViewController: WKNavigationDelegate {

    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        print("Started to load")
    }

    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        print("Finished loading")
    }

    func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error) {
        print(error.localizedDescription)
    }
}

extension ViewController: SFSafariViewControllerDelegate {
    func safariViewControllerDidFinish(_ controller: SFSafariViewController) {
        controller.dismiss(animated: true, completion: nil)
    }
}
