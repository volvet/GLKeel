//
//  GLKeenViewController.h
//  GLK-1
//
//  Created by Volvet Zhang on 16/1/16.
//  Copyright © 2016年 volvet. All rights reserved.
//

#import <GLKit/GLKit.h>

@interface GLKeenViewController : GLKViewController {
    GLuint  mVertexBufferId;
}

@property (strong, nonatomic)  GLKBaseEffect * mEffect;

@end
