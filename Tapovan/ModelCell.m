//
//  ModelCell.m
//  Tapovan
//
//  Created by Jimit Bagadiya on 03/11/16.
//  Copyright © 2016 Jimit Bagadiya. All rights reserved.
//

#import "ModelCell.h"

@implementation ModelCell
@synthesize cellPosition,strImg,strDes,strimg1,strimg2,strimg3,strTitle,strVideo;
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.strImg=strImg;
        self.strDes=strDes;
        self.strimg1=strimg1;
        self.strimg2=strimg2;
        self.strimg3=strimg3;
        self.strTitle=strTitle;
        self.strVideo=strVideo;
        self.cellPosition=cellPosition;
    }
    return self;
}

-(void)str:(NSString*)strimg stri1:(NSString*)strimgs1 stri2:(NSString*)strimgs2 stri:(NSString*)strimgs3 striT:(NSString*)strTitles striD:(NSString*)strDesc striV:(NSString*)strVideos int:(int)cellPositions{
    self.strImg=strimg;
    self.strimg1=strimgs1;
    self.strimg2=strimgs2;
    self.strimg3=strimgs3;
    self.strTitle=strTitles;
    self.strDes=strDesc;
    self.strVideo=strVideos;
    self.cellPosition=cellPositions;
    
}
@end
