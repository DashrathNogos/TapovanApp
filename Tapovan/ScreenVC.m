//
//  ScreenVC.m
//  Tapovan
//
//  Created by Jimit Bagadiya on 28/10/16.
//  Copyright © 2016 Jimit Bagadiya. All rights reserved.
//

#import "ScreenVC.h"

@interface ScreenVC ()

@end

@implementation ScreenVC

- (void)viewDidLoad {
    [super viewDidLoad];
    appDelegate= (AppDelegate *)[[UIApplication sharedApplication] delegate];

    [self twitterSplash];

    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (void) twitterSplash
{
    //Setting the background
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:self.view.frame];
    imageView.image = [UIImage imageNamed:@""];
    //[self.view addSubview:imageView];
    //Twitter style splash
    SKSplashIcon *twitterSplashIcon = [[SKSplashIcon alloc] initWithImage:[UIImage imageNamed:@"logo.png"] animationType:SKIconAnimationTypeBounce];
    UIColor *twitterColor = [UIColor colorWithRed:236.0 green:233.0 blue:218.0 alpha:1.0];
  //  UIColor *twitterColor = [UIColor redColor];

    _splashView = [[SKSplashView alloc] initWithSplashIcon:twitterSplashIcon backgroundColor:twitterColor animationType:SKSplashAnimationTypeNone];
    _splashView.delegate = self; //Optional -> if you want to receive updates on animation beginning/end
    _splashView.animationDuration = 3.2; //Optional -> set animation duration. Default: 1s
    [self.view addSubview:_splashView];
    [_splashView startAnimation];
}
- (void) splashView:(SKSplashView *)splashView didBeginAnimatingWithDuration:(float)duration
{
    NSLog(@"Started animating from delegate");
    //To start activity animation when splash animation starts
    [_indicatorView startAnimating];
}

- (void) splashViewDidEndAnimating:(SKSplashView *)splashView
{
    NSLog(@"Stopped animating from delegate");
    //To stop activity animation when splash animation ends
    [_indicatorView stopAnimating];
    [self performSegueWithIdentifier:@"mainpage" sender:nil];
    //MainPageVC *controller = [[MainPageVC alloc] init];
    //UINavigationController *navController = [[UINavigationController alloc] /initWithRootViewController:controller];
//appDelegate.window.rootViewController = navController;
    
   // self.window.backgroundColor = [UIColor whiteColor];
    [appDelegate.window makeKeyAndVisible];

//    MainPageVC *rvc=[self.storyboard instantiateViewControllerWithIdentifier:@"MainPageVC"];
//    [self.navigationController pushViewController:rvc animated:YES];
}

@end
