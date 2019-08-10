//
//  Content.h
//  Stories
//
//  Created by Mohammad Ashraful Kabir on 10/08/2019.
//  Copyright © 2019 Mohammad Ashraful Kabir. All rights reserved.
//

#import <JSONModel/JSONModel.h>

@protocol Content @end

@interface Content : JSONModel

@property (nonatomic) NSString *type;
@property (nonatomic) NSString *url;

@end
