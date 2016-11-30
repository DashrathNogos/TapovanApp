//
//  AppDelegate.m
//  Tapovan
//
//  Created by Jimit Bagadiya on 20/10/16.
//  Copyright © 2016 Jimit Bagadiya. All rights reserved.
//com.creativeglance.Tapovan

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate
@synthesize strTocken,strEmail,strMobile,strName,strImg;


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
  
    strTocken=[[NSMutableString alloc]init];
    strEmail=[[NSMutableString alloc]init];
    strMobile=[[NSMutableString alloc]init];
    strName=[[NSMutableString alloc]init];
    strImg=[[NSMutableString alloc]init];

    _user = [NSUserDefaults standardUserDefaults];

   // NSString *firstName = [_user objectForKey:@"firstName"];
    [_user synchronize];
   
//    UIImageView *splashImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_Height)];
//    [splashImage setImage: [UIImage imageNamed:@"logo.png"]];
////    [self.window addSubview:splashImage];
////    [self.window bringSubviewToFront:splashImage];
//    
//    //2. set an anchor point on the image view so it opens from the left
//   // splashImage.layer.anchorPoint = CGPointMake(0, 0.5);
//    
//    //reset the image view frame
//    splashImage.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_Height);
//    
//    [self.window.rootViewController.view addSubview:splashImage];
//    [self.window.rootViewController.view bringSubviewToFront:splashImage];
//    
//    PKWaitDelay(2,{
//        [UIView transitionWithView:self.window
//                          duration:3.00f
//                           options:UIViewAnimationCurveEaseInOut
//                        animations:^(void){
//                            splashImage.alpha = 0.0f;
//                           
//                            
//
//                        }
//                        completion:^(BOOL finished){
//                            NSLog(@"%@",[_user stringForKey:@"firstName"]);
//                            NSString *strLogin=[_user stringForKey:@"firstName"];
//                            if( strLogin== (id)[NSNull null] ||[strLogin isEqualToString:@""]||strLogin==nil)
//                                //if ([[_user objectForKey:@"firstName"] isEqualToString:@""])
//                            {
//                                NSString *storyboardId =@"ViewController";
//                                UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
//                                UIViewController *initViewController = [storyboard instantiateViewControllerWithIdentifier:storyboardId];
//                                
//                                UINavigationController *navController = [[UINavigationController alloc]initWithRootViewController:initViewController];
//                                
//                                self.window.rootViewController = navController;
//                                [self.window makeKeyAndVisible];
//                                
//                                
//                            }else{
//                                NSString *storyboardId =@"MainPageVC";
//                                
//                                UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
//                                
//                                UIViewController *initViewController = [storyboard instantiateViewControllerWithIdentifier:storyboardId];
//                                UINavigationController *navController = [[UINavigationController alloc]initWithRootViewController:initViewController];
//                                self.window.rootViewController = navController;
//                                [self.window makeKeyAndVisible];
//                                
//                            }
//                            
//
//                            [splashImage removeFromSuperview];
//                        }];}
//                );
//    [self.window makeKeyAndVisible];
//    
    
    
    NSLog(@"%@",[_user stringForKey:@"firstName"]);
    NSString *strLogin=[_user stringForKey:@"firstName"];
   if( strLogin== (id)[NSNull null] ||[strLogin isEqualToString:@""]||strLogin==nil)
    //if ([[_user objectForKey:@"firstName"] isEqualToString:@""])
   {
        NSString *storyboardId =@"ViewController";
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        UIViewController *initViewController = [storyboard instantiateViewControllerWithIdentifier:storyboardId];
        
        UINavigationController *navController = [[UINavigationController alloc]initWithRootViewController:initViewController];
       navController.navigationBar.backgroundColor=[UIColor redColor];
       navController.navigationBar.translucent=NO;
       navController.navigationBar.alpha=1.0;

       
        self.window.rootViewController = navController;
        [self.window makeKeyAndVisible];
        

    }else{
        NSString *storyboardId =@"MainPageVC";
        
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        
        UIViewController *initViewController = [storyboard instantiateViewControllerWithIdentifier:storyboardId];
        UINavigationController *navController = [[UINavigationController alloc]initWithRootViewController:initViewController];
//        navController.navigationBar.backgroundColor=[UIColor redColor];
//        navController.navigationBar.translucent=NO;
//        navController.navigationBar.alpha=1.0;

        self.window.rootViewController = navController;
        [self.window makeKeyAndVisible];

    }
    
    _strProfileimg=[UIImage imageNamed:@"gender_profile_grey.png"];
    
    return YES;
}

-(void)removeSplash;
{
    [_splashView removeFromSuperview];
    //[_splashView release];
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
