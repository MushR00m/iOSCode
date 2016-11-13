//
//  main.c
//  MainArgument
//
//  Created by bencai on 14-8-12.
//  Copyright (c) 2014年 bencai. All rights reserved.
//

#include <stdio.h>

int main(int argc, const char * argv[])
{
      printf("argc:%d\n",argc);
      printf("argv[0]:%s\n",argv[0]);
  if(argc > 1){
    printf("argv[1]:%s\n",argv[1]);
  }
  
     return 0;
}

