//
//  ModelCell.h
//  Tapovan
//
//  Created by Jimit Bagadiya on 03/11/16.
//  Copyright © 2016 Jimit Bagadiya. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ModelCell : NSObject
@property(nonatomic, assign) int cellPosition;
@property(nonatomic,strong)NSString *strImg,*strimg1,*strimg2,*strimg3,*strTitle,*strDes,*strVideo;
-(NSString*)str:(NSString*)strimg stri1:(NSString*)strimgs1 stri2:(NSString*)strimgs2 stri:(NSString*)strimgs3 striT:(NSString*)strTitles striD:(NSString*)strDesc striV:(NSString*)strVideos int:(int)cellPositions;

@end
