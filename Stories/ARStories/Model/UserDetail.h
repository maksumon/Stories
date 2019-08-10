//
//  UserDetail.h
//  Stories
//
//  Created by Mohammad Ashraful Kabir on 10/08/2019.
//  Copyright © 2019 Mohammad Ashraful Kabir. All rights reserved.
//

#import <JSONModel/JSONModel.h>
#import "Content.h"

@interface UserDetail : JSONModel

@property (nonatomic) NSString *name;
@property (nonatomic) NSString *imageUrl;
@property (nonatomic) NSArray<Content> *contents;

@end
