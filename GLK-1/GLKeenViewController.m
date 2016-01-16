//
//  GLKeenViewController.m
//  GLK-1
//
//  Created by Volvet Zhang on 16/1/16.
//  Copyright © 2016年 volvet. All rights reserved.
//

#import "GLKeenViewController.h"

typedef struct {
    GLKVector3 positionCoords;
} SceneVertex;

static const SceneVertex vertices[] = {
    {{-1.0f, -1.0f, 1.0f}},
    {{1.0f, -1.0f, 1.0f}},
    {{0.0f, 1.0f, 1.0f}},
};

@implementation GLKeenViewController

@synthesize mEffect;


-(void) viewDidLoad {
    [super viewDidLoad];
    
    GLKView * view = (GLKView*)self.view;
    
    NSAssert([view isKindOfClass:[GLKView class]], @"Unexpected view");
    
    view.context = [[EAGLContext alloc] initWithAPI:kEAGLRenderingAPIOpenGLES2];
    
    [EAGLContext setCurrentContext:view.context];
    
    self.mEffect = [[GLKBaseEffect alloc] init];
    
    self.mEffect.useConstantColor = GL_TRUE;
    self.mEffect.constantColor = GLKVector4Make(1.0f, 0.0f, 0.0f, 1.0f); // R,  G,  B, Alpha
    
    glClearColor(0.0f, 0.0f, 0.0f, 1.0f);
    glGenBuffers(1, &mVertexBufferId);
    glBindBuffer(GL_ARRAY_BUFFER, mVertexBufferId);
    glBufferData(GL_ARRAY_BUFFER, sizeof(vertices), vertices, GL_STATIC_DRAW);
}

-(void) viewDidUnload {
    [super viewDidLoad];
    
    GLKView * view = (GLKView*)self.view;
    [EAGLContext setCurrentContext:view.context];
    
    if( 0 != mVertexBufferId ){
        glDeleteBuffers(1, &mVertexBufferId);
        mVertexBufferId = 0;
    }
    
    //view.context = nil;
    [EAGLContext setCurrentContext:nil];
}


- (void)glkView:(GLKView *)view drawInRect:(CGRect)rect {
    [self.mEffect prepareToDraw];
    
    glClear(GL_COLOR_BUFFER_BIT);
    glEnableVertexAttribArray(GLKVertexAttribPosition);
    glVertexAttribPointer(GLKVertexAttribPosition, 3, GL_FLOAT, GL_FALSE, sizeof(SceneVertex), NULL);
    glDrawArrays(GL_TRIANGLES, 0, 3);
}

@end
