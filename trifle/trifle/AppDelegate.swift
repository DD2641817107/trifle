//
//  AppDelegate.swift
//  trifle
//
//  Created by TOMY on 2019/3/27.
//  Copyright © 2019年 tone. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    //初始界面的选择
    var defaultVc : UIViewController? {
        let isLogin = UserAccountTool.shareInstance.isLogin
        return isLogin ? WelComeViewController() : UIStoryboard(name: "Main", bundle: nil).instantiateInitialViewController()
    }

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = defaultVc
        window?.makeKeyAndVisible()
        // 设置全局颜色
        UITabBar.appearance().tintColor = UIColor.orange
        
        //友盟初始化     需要在友盟上注册app才能获得key
        UMConfigure.initWithAppkey("5c9e1ad061f5643baf001628", channel: "App Store")
        confitUShareSettings()
        configUSharePlatforms()
        
        //2.003pRJ9H2l_z3E97e20d6e8b3WISBE
        //https://api.weibo.com/2/statuses/home_timeline.json?access_token=2.003pRJ9H2l_z3E97e20d6e8b3WISBE
        return true
    }
    //回调函数
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        let result : Bool = UMSocialManager.default()!.handleOpen(url)
        return result
    }
}
extension AppDelegate
{
    func confitUShareSettings(){
        UMSocialGlobal.shareInstance().isUsingWaterMark = true
    }
    func configUSharePlatforms(){
        //第三方登录  微博
        UMSocialManager.default()?.setPlaform(UMSocialPlatformType.sina, appKey: "4004224699", appSecret: "677159572822481a09616ddde45247a9", redirectURL: "https://sns.whalecloud.com/sina2/callback")
    }
}
