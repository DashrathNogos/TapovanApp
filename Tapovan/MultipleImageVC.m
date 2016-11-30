//
//  MultipleImageVC.m
//  Tapovan
//
//  Created by Jimit Bagadiya on 10/11/16.
//  Copyright © 2016 Jimit Bagadiya. All rights reserved.
//

#import "MultipleImageVC.h"

@interface MultipleImageVC ()

@end

@implementation MultipleImageVC

- (void)viewDidLoad {
    [super viewDidLoad];
    ViewImg.layer.cornerRadius=10;
    
    // Do any additional setup after loading the view.
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 50;
    
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"Cell";
    
    UICollectionViewCell *cell = [CollView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    
//    UIImageView *recipeImageView = (UIImageView *)[cell viewWithTag:100];
//    recipeImageView.image = [UIImage imageNamed:[recipeImages objectAtIndex:indexPath.row]];
//    
    return cell;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat picDimension = self.view.frame.size.width / 4.0f;
    return CGSizeMake(picDimension, picDimension);
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    ImageDetailVC *iVC=[self.storyboard instantiateViewControllerWithIdentifier:@"ImageDetailVC"];
    [self.navigationController pushViewController:iVC animated:YES];
   // [self performSegueWithIdentifier:@"main" sender:self];

    
}

// stroy board navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"Overview_Register"])
    {
//        WDRegisterViewController *obj=(WDRegisterViewController *)[segue destinationViewController];
//        obj.str_Title=@"Edit Profile";
//        obj.isRegister=NO;
    }


[self performSegueWithIdentifier:@"Overview_Measure" sender:nil];



UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
//WDPeekViewController *Peek = (WDPeekViewController *)[sb instantiateViewControllerWithIdentifier:@"WDPeekViewController"];
//[self.navigationController pushViewController:tabBarController animated:YES];
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

@end
