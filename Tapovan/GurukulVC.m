//
//  GurukulVC.m
//  Tapovan
//
//  Created by Jimit Bagadiya on 02/11/16.
//  Copyright © 2016 Jimit Bagadiya. All rights reserved.
//

#import "GurukulVC.h"
#import "AFHTTPRequestOperationManager.h"
#import "UIImageView+AFNetworking.h"
@interface GurukulVC ()

@end

@implementation GurukulVC

- (void)viewDidLoad {
    [super viewDidLoad];
    appDelegate= (AppDelegate *)[[UIApplication sharedApplication] delegate];

    arrType=[[NSMutableArray alloc]init];
    arrTitle=[[NSMutableArray alloc]init];
    getTitle=[[NSMutableArray alloc]init];
    getimg=[[NSMutableArray alloc]init];
    getDesc=[[NSMutableArray alloc]init];
    getVideo=[[NSMutableArray alloc]init];
    arrCount=[[NSMutableArray alloc]init];
    getDate=[[NSMutableArray alloc]init];
    
     [self GurukulActivity];
    
}

-(void)GurukulActivity{
    strToken= [appDelegate.user stringForKey:@"firstName"];

    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];//school
    NSDictionary *params = @{@"type": @"gurukul",@"access_token": strToken};
    
    [manager POST:@"http://tapovan.devdemoz.com/mobapi/getactivity" parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
            NSLog(@"JSON: %@", responseObject);
        getTitle=[responseObject valueForKey:@"title"];
        getimg=[responseObject valueForKey:@"gallery_data"];
        getVideo=[responseObject valueForKey:@"video_data"];
        getDesc=[responseObject valueForKey:@"short_desc"];
        arrType=[responseObject valueForKey:@"activity_type"];
        arrType=[responseObject valueForKey:@"activity_type"];
        getDate=[responseObject valueForKey:@"created_on"];

        //getVideo=[NSMutableArray arrayWithObjects:@"p7OyciHjfT0", nil];
        if (getTitle == nil || [getTitle count] == 0) {
            _tblGurukul.hidden=YES;

        }else{
            [_tblGurukul reloadData];

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
        
        
     //   NSLog(@"%@",strImg);
        NSArray* img=[getimg objectAtIndex:indexPath.row];
        for (int i=0; i<img.count; i++){
        NSString *ss=[img objectAtIndex:i];
         //   NSLog(@"%@",ss);

         if ([ss isEqualToString:@""]) {
            
        }else{
//            cell1.singleImg.autoresizingMask = ( UIViewAutoresizingNone );
//            cell1.singleImg.autoresizesSubviews = NO;
            cell1.singleImg.contentMode = UIViewContentModeScaleToFill;
            
            cell1.singleImg.image = UIGraphicsGetImageFromCurrentImageContext();
            UIGraphicsEndImageContext();
            //cell1.singleImg.bounds = CGRectMake(0, 0, 50, 50);
           // cell1.singleImg.frame = CGRectMake(0, 0, 50, 50);
           // cell1.singleImg.contentMode = UIViewContentModeScaleAspectFill;
            [cell1.singleImg setImageWithURL:[NSURL URLWithString:ss]
                             placeholderImage:[UIImage imageNamed:@"placeholder.png"]];
            [cell1.singleImg setNeedsDisplay];
            [cell1.singleImg reloadInputViews];
//            float actualHeight = cell1.singleImg.frame.size.height;
//            float actualWidth = cell1.singleImg.frame.size.width;
//            float imgRatio = actualWidth/actualHeight;
//            float maxRatio = 320.0/480.0;
//            
//            if(imgRatio!=maxRatio){
//                if(imgRatio < maxRatio){
//                    imgRatio = 480.0 / actualHeight;
//                    actualWidth = imgRatio * actualWidth;
//                    actualHeight = 480.0;
//                }
//                else{
//                    imgRatio = 320.0 / actualWidth;
//                    actualHeight = imgRatio * actualHeight;
//                    actualWidth = 320.0;
//                }
//            }
//            CGRect rect = CGRectMake(0.0, 0.0, actualWidth, actualHeight);
//            UIGraphicsBeginImageContext(rect.size);
//            [image drawInRect:rect];
//            UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
//            UIGraphicsEndImageContext();
             //[self centerCropImage:cell1.singleImg.image];
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
        
        imgMultiple=[getimg objectAtIndex:indexPath.row];
      
        
         [cell3.btnOne addTarget:self action:@selector(btnOneImg:) forControlEvents:(UIControlEventTouchUpInside)];
        [cell3.btnSecond addTarget:self action:@selector(btnSecondImg:) forControlEvents:(UIControlEventTouchUpInside)];
        [cell3.btnOne setTag:indexPath.row];
        [cell3.btnSecond setTag:indexPath.row];

        
        //NSLog(@"%@",img);
        if (imgMultiple.count==1) {
            NSString *str1=[imgMultiple objectAtIndex:0];
            [cell1.singleImg setImageWithURL:[NSURL URLWithString:str1]
                            placeholderImage:[UIImage imageNamed:@"placeholder.png"]];
            
            cell1.lblTitle.text=[getTitle objectAtIndex:indexPath.row];
            cell1.lblDescription.text=[getDesc objectAtIndex:indexPath.row];}
       
         else if (imgMultiple.count<=2) {
             
            NSString *str1=[imgMultiple objectAtIndex:0];
            NSString *str2=[imgMultiple objectAtIndex:1];
           // cell3.img1.contentMode = UIViewContentModeScaleAspectFit;
            [cell3.img1 setImageWithURL:[NSURL URLWithString:str1]
                             placeholderImage:[UIImage imageNamed:@"placeholder.png"]];
           // cell3.img2.contentMode = UIViewContentModeScaleAspectFit;
            [cell3.img2 setImageWithURL:[NSURL URLWithString:str2]
                             placeholderImage:[UIImage imageNamed:@"placeholder.png"]];
 //cell3.img1.image=[UIImage imageNamed:@"computer.png"];
           // cell3.img2.image=[UIImage imageNamed:@"computer.png"];
            //cell3.img3.image=[UIImage imageNamed:@"computer.png"];

        }
        else if (imgMultiple.count>=3)
        {
            [cell3.btnCount setTag:indexPath.row];

            NSString *str=[NSString stringWithFormat:@"%lu", (unsigned long)imgMultiple.count];
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
            
            NSString *str1=[imgMultiple objectAtIndex:0];
            NSString *str2=[imgMultiple objectAtIndex:1];
            NSString *str3=[imgMultiple objectAtIndex:2];
            //cell3.img1.contentMode = UIViewContentModeScaleAspectFit;
            [cell3.img1 setImageWithURL:[NSURL URLWithString:str1]
                       placeholderImage:[UIImage imageNamed:@"placeholder.png"]];
            //cell3.img2.contentMode = UIViewContentModeScaleAspectFit;
            [cell3.img2 setImageWithURL:[NSURL URLWithString:str2]
                       placeholderImage:[UIImage imageNamed:@"placeholder.png"]];
            //cell3.img3.contentMode = UIViewContentModeScaleAspectFit;
            [cell3.img3 setImageWithURL:[NSURL URLWithString:str3]
                       placeholderImage:[UIImage imageNamed:@"placeholder.png"]];
        
        }else{
            
        }
        cell3.lblTitle.text=[getTitle objectAtIndex:indexPath.row];
        cell3.lblDescription.text=[getDesc objectAtIndex:indexPath.row];
        cell3.lblDate.text=[getDate objectAtIndex:indexPath.row];
        

        
        
        return cell3;

    }
    if ([strType isEqualToString:@"V"]) {
        VideoGurukulCell *cell4 = [tableView dequeueReusableCellWithIdentifier:video];
        
        NSArray* img=[getVideo objectAtIndex:indexPath.row];
        NSLog(@"%@",img);
        if (img.count>=1) {
            NSString *str1=[img objectAtIndex:0];
            cell4.ytdPlayer.delegate=self;
            //[cell4.ytdPlayer loadWithVideoId:str1];
            cell4.lblTitle.text=[getTitle objectAtIndex:indexPath.row];
            cell4.lblDescriptionVideo.text=[getDesc objectAtIndex:indexPath.row];
        }else{
            
        }
        

        
        cell4.lblTitle.text=[getTitle objectAtIndex:indexPath.row];
        cell4.lblDescriptionVideo.text=[getDesc objectAtIndex:indexPath.row];
        cell4.lblDate.text=[getDate objectAtIndex:indexPath.row];

        NSString *strId=[getVideo objectAtIndex:0];
        
//        NSDictionary *playerVars = @{
//                                     @"playsinline" : @1,
//                                     };
//        cell4.ytdPlayer.delegate=self;
//        [cell4.ytdPlayer loadWithVideoId:strId];

        //[cell4.ytdPlayer loadWithVideoId:strId];
      //  playerVars:playerVars];
        
        
        return cell4;

    }else{
        
    }

    
    return cell1;
}
-(IBAction)btnOneImg:(id)sender
{
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:[sender tag] inSection:0];
    UITableViewCell *cell = [_tblGurukul cellForRowAtIndexPath:indexPath];
    ImageDetailVC *dVC=[self.storyboard instantiateViewControllerWithIdentifier:@"ImageDetailVC"];
    dVC.strTitle=[getTitle objectAtIndex:indexPath.row];
    dVC.strDes=[getDesc objectAtIndex:indexPath.row];
    dVC.arrImg=[getimg objectAtIndex:indexPath.row];
    [self.navigationController pushViewController:dVC animated:YES];

}
-(IBAction)btnSecondImg:(id)sender
{
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:[sender tag] inSection:0];
    UITableViewCell *cell = [_tblGurukul cellForRowAtIndexPath:indexPath];
    ImageDetailVC *dVC=[self.storyboard instantiateViewControllerWithIdentifier:@"ImageDetailVC"];
    dVC.strTitle=[getTitle objectAtIndex:indexPath.row];
    dVC.strDes=[getDesc objectAtIndex:indexPath.row];
    dVC.arrImg=[getimg objectAtIndex:indexPath.row];
    [self.navigationController pushViewController:dVC animated:YES];

}

-(IBAction)btnMoreImg:(id)sender{
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:[sender tag] inSection:0];
    UITableViewCell *cell = [_tblGurukul cellForRowAtIndexPath:indexPath];
    ImageDetailVC *dVC=[self.storyboard instantiateViewControllerWithIdentifier:@"ImageDetailVC"];
    dVC.strTitle=[getTitle objectAtIndex:indexPath.row];
    dVC.strDes=[getDesc objectAtIndex:indexPath.row];
    dVC.arrImg=[getimg objectAtIndex:indexPath.row];
    [self.navigationController pushViewController:dVC animated:YES];
   
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
//   // }
//    if ([strType isEqualToString:@"A"]) {
//        NSString *t=[getTitle objectAtIndex:indexPath.row];
//        NSString *d=[getDesc objectAtIndex:indexPath.row];
//        NSLog(@"%@",t);
//        NSLog(@"%@",d);
//        
//
//        
//    }
//    if ([strType isEqualToString:@"G"]) {
//        NSString *t=[getTitle objectAtIndex:indexPath.row];
//        NSString *d=[getDesc objectAtIndex:indexPath.row];
//        NSLog(@"%@",t);
//        NSLog(@"%@",d);
//        NSArray* img=[getimg objectAtIndex:indexPath.row];
//        NSLog(@"%@",img);
//       
//        
//    }
//    if ([strType isEqualToString:@"V"]) {
//        NSString *t=[getTitle objectAtIndex:indexPath.row];
//        NSString *d=[getDesc objectAtIndex:indexPath.row];
//        NSLog(@"%@",t);
//        NSLog(@"%@",d);
//        
//        appDelegate.arrVideo=[getVideo objectAtIndex:indexPath.row];
//        NSLog(@"%@",appDelegate.arrVideo);
//        
//    }else{}

//    appDelegate.arrVideo=[getVideo objectAtIndex:indexPath.row];
    
    
    
    
    
    
    
    
    
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

-(UIImage *)centerCropImage:(UIImage *)image
{
    // Use smallest side length as crop square length
    CGFloat squareLength = MIN(image.size.width, image.size.height);
    // Center the crop area
    CGRect clippedRect = CGRectMake((image.size.width - squareLength) / 2, (image.size.height - squareLength) / 2, squareLength, squareLength);
    // Crop logic
    CGImageRef imageRef = CGImageCreateWithImageInRect([image CGImage], clippedRect);
    UIImage * croppedImage = [UIImage imageWithCGImage:imageRef];
    CGImageRelease(imageRef);
    return croppedImage;
}

@end
