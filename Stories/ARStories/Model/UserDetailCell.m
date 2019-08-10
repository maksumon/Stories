//
//  UserDetailCell.m
//  Stories
//
//  Created by Mohammad Ashraful Kabir on 10/08/2019.
//  Copyright © 2019 Mohammad Ashraful Kabir. All rights reserved.
//

#import "UserDetailCell.h"

@implementation UserDetailCell

-(void)awakeFromNib {
    [super awakeFromNib];
    
    self.imgView.layer.cornerRadius = self.imgView.frame.size.height / 2;
    self.imgView.layer.borderColor = [UIColor redColor].CGColor;
    self.imgView.layer.borderWidth = 3;
}

@end
