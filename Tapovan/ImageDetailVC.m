//
//  ImageDetailVC.m
//  Tapovan
//
//  Created by Jimit Bagadiya on 10/11/16.
//  Copyright © 2016 Jimit Bagadiya. All rights reserved.
//

#import "ImageDetailVC.h"
#import "UIImageView+AFNetworking.h"
@interface ImageDetailVC ()

@end

@implementation ImageDetailVC

- (void)viewDidLoad {
    [super viewDidLoad];
    viewImg.layer.cornerRadius=10;
    lblTitle.text=_strTitle;
    lblDescri.text=_strDes;
    lblSingleImgTitle.text=_strTitle;
    lblSingleImgDes.text=_strDes;
    _tblVideo.hidden=YES;
    SingleImag.hidden=YES;
    ScrollImg.hidden=YES;

    _tblVideo.delegate=self;
    _tblVideo.dataSource=self;
    
    //scrollImg
    arrUrl =[[NSMutableArray alloc]init];
    
    
    videoDetailView.layer.cornerRadius=7;
    
    
    if (_arrImg.count<=1) {
        NSString *ss=[_arrImg objectAtIndex:0];
        //   NSLog(@"%@",ss);
        
        if ([ss isEqualToString:@""]) {
            
            
        }else{
            _tblVideo.hidden=YES;
            titleDesView.hidden=YES;
            SingleImag.hidden=NO;
            ScrollImg.hidden=YES;

            //  cell1.singleImg.contentMode = UIViewContentModeScaleAspectFit;
            [SingleImag setImageWithURL:[NSURL URLWithString:ss]
                             placeholderImage:[UIImage imageNamed:@"placeholder.png"
                                               ]];
        }
    }if (_arrVideo.count>=1) {
         NSString *ss=[_arrVideo objectAtIndex:0];
        
        if ([ss isEqualToString:@""]) {
            
            
        }else{
            lblTileVideo.text=_strTitle;
            lblTitleDescription.text=_strDes;
//            videoDetailView.frame.size.height;
//            videoDetailView = [[UIView alloc]initWithFrame:(CGRectMake(0, 0,_tblVideo.frame.size.width, lblTitleDescription.frame.size.height))];
//            [_tblVideo addSubview:videoDetailView];
            
            
            _tblVideo.hidden=NO;
            titleDesView.hidden=YES;
            SingleImag.hidden=YES;
            ScrollImg.hidden=YES;
            //  cell1.singleImg.contentMode = UIViewContentModeScaleAspectFit;
            [_tblVideo reloadData];
        }
    }if (_arrImg.count>1) {
            ScrollImg.hidden=NO;
            _tblVideo.hidden=YES;
            titleDesView.hidden=YES;
            SingleImag.hidden=YES;
            ScrollImg.imagesUrls = [self imageUrls];
            ScrollImg.contentMode = UIViewContentModeScaleAspectFit;
            ScrollImg.loadingImage = [UIImage imageNamed:@"dark_blue.jpg"];
            ScrollImg.tempDownloadedImageSavingEnabled = YES;
            [ScrollImg setInitialPage:2];

            //viewImg.hidden=YES;
            UITapGestureRecognizer *doubleTapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleDoubleTapGesture:)];
            doubleTapGestureRecognizer.numberOfTapsRequired = 2;
            doubleTapGestureRecognizer.numberOfTouchesRequired = 1;
            [self.view addGestureRecognizer:doubleTapGestureRecognizer];
        AFImageViewer *am=[[AFImageViewer alloc]init];
        
        am.pageControl.pageIndicatorTintColor = [UIColor blueColor];
        am.pageControl.currentPageIndicatorTintColor = [UIColor greenColor];

        }else{
            
            
        }
   // }


    //}
    
    
    // Do any additional setup after loading the view.
}
-(void)handleDoubleTapGesture:(UITapGestureRecognizer *)tapGestureRecognizer
{
    
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    
    CGSize newSize = CGSizeMake(screenRect.size.width, screenRect.size.height);
    if (ScrollImg.frame.size.width == screenRect.size.width) {
        newSize.width = viewImg.frame.size.width;
        newSize.height = (viewImg.frame.size.height-75)-lblSingleImgDes.frame.size.height;
         CGPoint currentCenter = ScrollImg.center;
        ScrollImg.backgroundColor=[UIColor colorWithRed:235.0/255.0 green:232.0/255.0 blue:217.0/255.30 alpha:1.0];
        ScrollImg.frame = CGRectMake(ScrollImg.frame.origin.x, ScrollImg.frame.origin.y, newSize.width, newSize.height);
        ScrollImg.center = currentCenter;
    }else{
    
    CGPoint currentCenter = ScrollImg.center;
    
    ScrollImg.frame = CGRectMake(ScrollImg.frame.origin.x, ScrollImg.frame.origin.y, newSize.width, newSize.height);
    ScrollImg.center = currentCenter;
    ScrollImg.backgroundColor=[UIColor colorWithRed:236.0/255.0 green:233.0/255.0 blue:218.0/255.0 alpha:1];
    
}
}

-(NSArray *)imageUrls
{
    
    for (int i=0; i<_arrImg.count; i++) {
        NSString *str=[_arrImg objectAtIndex:i];
        NSURL *u=[NSURL URLWithString:str];
        
        [arrUrl addObject:u];
        
        
    }
    return arrUrl;
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
#pragma Tableview Methods
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 2;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    switch(section){
        case 0:
            return 1;
        case 1:
            if (_arrVideo.count>=1) {
                return _arrVideo.count;
            }
            return 0;
            break;
    }
    return 0;

}


//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
//{
//    if (_arrVideo.count>=1) {
//        return _arrVideo.count;
//    }
//    return 0;
//}
//
//


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    static NSString *video = @"cell";
    VideoDetailCell *cell = [tableView dequeueReusableCellWithIdentifier:video];
    if (cell==nil) {
        cell=[[VideoDetailCell alloc]initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:video];
        
    }
    if (indexPath.section==0) {
        UILabel *lblTitle1=(UILabel *)[cell viewWithTag:5];
        UILabel *lblDes=(UILabel *)[cell viewWithTag:10];
        lblTitle1.lineBreakMode = UILineBreakModeWordWrap;
        lblTitle1.lineBreakMode = UILineBreakModeWordWrap;

       lblTitle1.text=_strTitle;
        lblDes.text=_strDes;
    }if (indexPath.section==1) {
           NSString *strId=[_arrVideo objectAtIndex:indexPath.row];
    
            NSDictionary *playerVars = @{
                                         @"playsinline" : @1,
                                         };
            cell.video.delegate=self;
            [cell.video loadWithVideoId:strId];
    }
//     [cell4.ytdPlayer loadWithVideoId:strId];
//    playerVars:playerVars];
    
    
    
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath {
    //minimum size of your cell, it should be single line of label if you are not clear min. then return UITableViewAutomaticDimension;
    return UITableViewAutomaticDimension;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section==0) {
                NSString *cellText = [_strTitle stringByAppendingString:_strDes];
        UIFont *cellFont = [UIFont fontWithName:@"Helvetica" size:17.0];
        CGSize constraintSize = CGSizeMake(_tblVideo.frame.size.width, MAXFLOAT);
        CGSize labelSize = [cellText sizeWithFont:cellFont constrainedToSize:constraintSize lineBreakMode:UILineBreakModeWordWrap];
        
        return labelSize.height+10;

    }return 200;
    
    
//    NSString *cellText = [_strTitle stringByAppendingString:_strDes];
//    UIFont *cellFont = [UIFont fontWithName:@"Helvetica" size:17.0];
//    CGSize constraintSize = CGSizeMake(280.0f, MAXFLOAT);
//    CGSize labelSize = [cellText sizeWithFont:cellFont constrainedToSize:constraintSize lineBreakMode:UILineBreakModeWordWrap];
//    
//    return labelSize.height + 20;
}
- (IBAction)btnBackClicked:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
    
}
@end
