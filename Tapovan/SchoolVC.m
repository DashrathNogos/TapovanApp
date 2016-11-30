//
//  SchoolVC.m
//  Tapovan
//
//  Created by Jimit Bagadiya on 02/11/16.
//  Copyright © 2016 Jimit Bagadiya. All rights reserved.
//

#import "SchoolVC.h"
#import "AFHTTPRequestOperationManager.h"
#import "UIImageView+AFNetworking.h"

@interface SchoolVC ()

@end

@implementation SchoolVC

- (void)viewDidLoad {
    [super viewDidLoad];
    arrType=[[NSMutableArray alloc]init];
    arrTitle=[[NSMutableArray alloc]init];
    getTitle=[[NSMutableArray alloc]init];
    getimg=[[NSMutableArray alloc]init];
    getDesc=[[NSMutableArray alloc]init];
    getVideo=[[NSMutableArray alloc]init];
    arrCount=[[NSMutableArray alloc]init];
    getDate=[[NSMutableArray alloc]init];
    
    [self SchoolActivity];
    
    
}
-(void)SchoolActivity{
    appDelegate= (AppDelegate *)[[UIApplication sharedApplication] delegate];
    strToken= [appDelegate.user stringForKey:@"firstName"];

    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];//school
    NSDictionary *params = @{@"type": @"school",@"access_token":strToken};
//     NSDictionary *params = @{@"type": @"gurukul",@"access_token":@"aFjVa8XmRvCaISpGgTuQVj7Z6YM5VThvqnxvWyCP2YtfNacv8Lx2NA6kzqm9Kr837zDWjMgkPxGmaqQW"};
    [manager POST:@"http://tapovan.devdemoz.com/mobapi/getactivity" parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"JSON: %@", responseObject);
        getTitle=[responseObject valueForKey:@"title"];
        getimg=[responseObject valueForKey:@"gallery_data"];
        getVideo=[responseObject valueForKey:@"video_data"];
        getDesc=[responseObject valueForKey:@"short_desc"];
        arrType=[responseObject valueForKey:@"activity_type"];
        getDate=[responseObject valueForKey:@"created_on"];
        if (getTitle == nil || [getTitle count] == 0) {
            [_tblSchool setHidden:YES];
            
        }else{
            [_tblSchool reloadData];
            
        }
        

        
        
        
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
}
#pragma Tableview Methods
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return getTitle.count;
}




- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    strType=[arrType objectAtIndex:indexPath.row];
    static NSString *image = @"cell1";
    static NSString *title = @"cell2";
    static NSString *video = @"cell3";
    static NSString *multipleimg = @"cell4";
    
    ImageCell *cell1 = [tableView dequeueReusableCellWithIdentifier:image];
    
    if ([strType isEqualToString:@"I"]) {
        
        cell1.lblTitle.text=[getTitle objectAtIndex:indexPath.row];
        cell1.lblDescription.text=[getDesc objectAtIndex:indexPath.row];
        cell1.lblDate.text=[getDate objectAtIndex:indexPath.row];

        
        NSString *strImg=[getimg objectAtIndex:indexPath.row];
        NSLog(@"%@",strImg);
        NSArray* img=[getimg objectAtIndex:indexPath.row];
        for (int i=0; i<img.count; i++){
            NSString *ss=[img objectAtIndex:i];
            NSLog(@"%@",ss);
            
            if ([ss isEqualToString:@""]) {
                
            }else{
                //  cell1.singleImg.contentMode = UIViewContentModeScaleAspectFit;
                [ cell1.singleImg setImageWithURL:[NSURL URLWithString:ss]
                                 placeholderImage:[UIImage imageNamed:@"placeholder.png"]];
            }
        }
        
        
        
        return cell1;
    }
    if ([strType isEqualToString:@"A"]) {
        TitleGurukulCell *cell2 = [tableView dequeueReusableCellWithIdentifier:title];
        cell2.lblTitle.text=[getTitle objectAtIndex:indexPath.row];
        cell2.lblDesc.text=[getDesc objectAtIndex:indexPath.row];
        cell2.lblDate.text=[getDate objectAtIndex:indexPath.row];

        
        return cell2;
        
    }
    if ([strType isEqualToString:@"G"]) {
        MultipleImageCell *cell3 = [tableView dequeueReusableCellWithIdentifier:multipleimg];
        
        [cell3.btnOne addTarget:self action:@selector(btnOneImg:) forControlEvents:(UIControlEventTouchUpInside)];
        [cell3.btnSecond addTarget:self action:@selector(btnSecondImg:) forControlEvents:(UIControlEventTouchUpInside)];
        [cell3.btnOne setTag:indexPath.row];
        [cell3.btnSecond setTag:indexPath.row];

        
        NSArray* img=[getimg objectAtIndex:indexPath.row];
        NSLog(@"%@",img);
        if (img.count==1) {
             NSString *str1=[img objectAtIndex:0];
            [cell1.singleImg setImageWithURL:[NSURL URLWithString:str1]
                       placeholderImage:[UIImage imageNamed:@"placeholder.png"]];
       
            cell1.lblTitle.text=[getTitle objectAtIndex:indexPath.row];
            cell1.lblDescription.text=[getDesc objectAtIndex:indexPath.row];
            cell1.lblDate.text=[getDate objectAtIndex:indexPath.row];
}
     else if (img.count>=2) {
            NSString *str1=[img objectAtIndex:0];
            NSString *str2=[img objectAtIndex:1];
            // cell3.img1.contentMode = UIViewContentModeScaleAspectFit;
            [cell3.img1 setImageWithURL:[NSURL URLWithString:str1]
                       placeholderImage:[UIImage imageNamed:@"placeholder.png"]];
            // cell3.img2.contentMode = UIViewContentModeScaleAspectFit;
            [cell3.img2 setImageWithURL:[NSURL URLWithString:str2]
                       placeholderImage:[UIImage imageNamed:@"placeholder.png"]];
            cell3.lblTitle.text=[getTitle objectAtIndex:indexPath.row];
            cell3.lblDescription.text=[getDesc objectAtIndex:indexPath.row];
            cell3.lblDate.text=[getDate objectAtIndex:indexPath.row];

        }
        else if (img.count>=3)
        {
            [cell3.btnCount setTag:indexPath.row];

            NSString *str=[NSString stringWithFormat:@"%lu", (unsigned long)img.count];
            int i=[str intValue];
            //    int i=arr.count;
            i=i-3;
            NSString *count=[@"+" stringByAppendingString:[NSString stringWithFormat:@"%d", i]];
            
            if (i==0) {
                
            }else{
                cell3.lblPhoto.text =@"MORE PHOTOS";
                
                cell3.lblPhoto.textColor=[UIColor whiteColor];
                [cell3.btnCount setTitle:count forState:(UIControlStateNormal)];
                [cell3.btnCount setTintColor:[UIColor whiteColor]];
                 [cell3.btnCount addTarget:self action:@selector(btnMoreImg:) forControlEvents:(UIControlEventTouchUpInside)];
            }

            NSString *str1=[img objectAtIndex:0];
            NSString *str2=[img objectAtIndex:1];
            NSString *str3=[img objectAtIndex:2];
            //cell3.img1.contentMode = UIViewContentModeScaleAspectFit;
            [cell3.img1 setImageWithURL:[NSURL URLWithString:str1]
                       placeholderImage:[UIImage imageNamed:@"placeholder.png"]];
            //cell3.img2.contentMode = UIViewContentModeScaleAspectFit;
            [cell3.img2 setImageWithURL:[NSURL URLWithString:str2]
                       placeholderImage:[UIImage imageNamed:@"placeholder.png"]];
            //cell3.img3.contentMode = UIViewContentModeScaleAspectFit;
            [cell3.img3 setImageWithURL:[NSURL URLWithString:str3]
                       placeholderImage:[UIImage imageNamed:@"placeholder.png"]];
           
            cell3.lblTitle.text=[getTitle objectAtIndex:indexPath.row];
            cell3.lblDescription.text=[getDesc objectAtIndex:indexPath.row];
            cell3.lblDate.text=[getDate objectAtIndex:indexPath.row];

        }else{
            
        }
        
        
        
        
        return cell3;
        
    }
    if ([strType isEqualToString:@"V"]) {
        VideoGurukulCell *cell4 = [tableView dequeueReusableCellWithIdentifier:video];
        cell4.lblTitle.text=[getTitle objectAtIndex:indexPath.row];
        cell4.lblDescriptionVideo.text=[getDesc objectAtIndex:indexPath.row];
        cell4.lblDate.text=[getDate objectAtIndex:indexPath.row];
        
//        NSString *strId=[getVideo objectAtIndex:0];
//        
////        NSDictionary *playerVars = @{
////                                     @"playsinline" : @1,
////                                     };
//        cell4.ytdPlayer.delegate=self;
//        
//        [cell4.ytdPlayer loadWithVideoId:strId ];
//        
        
        return cell4;
        
    }else{
        
    }
    
    
    return cell1;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    //NSString* strTypes=[arrType objectAtIndex:indexPath.row];
    // if ([strType isEqualToString:@"I"]) {
    NSString *t=[getTitle objectAtIndex:indexPath.row];
    NSString *d=[getDesc objectAtIndex:indexPath.row];
    NSLog(@"%@",t);
    NSLog(@"%@",d);
    NSArray* img=[getimg objectAtIndex:indexPath.row];
    NSLog(@"%@",img);
    appDelegate.arrVideo=[getVideo objectAtIndex:indexPath.row];
    NSLog(@"%@",appDelegate.arrVideo);
    ImageDetailVC *dVC=[self.storyboard instantiateViewControllerWithIdentifier:@"ImageDetailVC"];
    dVC.strTitle=[getTitle objectAtIndex:indexPath.row];
    dVC.strDes=[getDesc objectAtIndex:indexPath.row];
    dVC.arrImg=[getimg objectAtIndex:indexPath.row];
    dVC.arrVideo=[getVideo objectAtIndex:indexPath.row];
    [self.navigationController pushViewController:dVC animated:YES];
}
-(IBAction)btnOneImg:(id)sender
{
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:[sender tag] inSection:0];
    UITableViewCell *cell = [_tblSchool cellForRowAtIndexPath:indexPath];
    ImageDetailVC *dVC=[self.storyboard instantiateViewControllerWithIdentifier:@"ImageDetailVC"];
    dVC.strTitle=[getTitle objectAtIndex:indexPath.row];
    dVC.strDes=[getDesc objectAtIndex:indexPath.row];
    dVC.arrImg=[getimg objectAtIndex:indexPath.row];
    [self.navigationController pushViewController:dVC animated:YES];
    
}
-(IBAction)btnSecondImg:(id)sender
{
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:[sender tag] inSection:0];
    UITableViewCell *cell = [_tblSchool cellForRowAtIndexPath:indexPath];
    ImageDetailVC *dVC=[self.storyboard instantiateViewControllerWithIdentifier:@"ImageDetailVC"];
    dVC.strTitle=[getTitle objectAtIndex:indexPath.row];
    dVC.strDes=[getDesc objectAtIndex:indexPath.row];
    dVC.arrImg=[getimg objectAtIndex:indexPath.row];
    [self.navigationController pushViewController:dVC animated:YES];
    
}

-(IBAction)btnMoreImg:(id)sender{
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:[sender tag] inSection:0];
    UITableViewCell *cell = [_tblSchool cellForRowAtIndexPath:indexPath];
    ImageDetailVC *dVC=[self.storyboard instantiateViewControllerWithIdentifier:@"ImageDetailVC"];
    dVC.strTitle=[getTitle objectAtIndex:indexPath.row];
    dVC.strDes=[getDesc objectAtIndex:indexPath.row];
    dVC.arrImg=[getimg objectAtIndex:indexPath.row];
    [self.navigationController pushViewController:dVC animated:YES];
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath*)indexPath;
{
    if ([strType isEqualToString:@"I"]) {
        return 300;
    }if ([strType isEqualToString:@"A"]) {
        return 150;
    }
    if ([strType isEqualToString:@"G"]) {
        return 250;
        
    }
    if ([strType isEqualToString:@"V"]) {
        return 300;
        
    }
    else{
        return 150;
    }
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
