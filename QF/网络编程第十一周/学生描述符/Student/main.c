//
//  main.c
//  Student
//
//  Created by chen cheng on 14-8-1.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#include <stdio.h>
#include "Student.h"

int main(int argc, const char * argv[])
{
    //创建学生
    StudentHandle stu = createStudent("小明3", 1, 18);
    
    //第一次打印
    printStudent(stu);
    
    setStudentSex(stu, 0);
    setStudentAge(stu, 28);
    
    //第二次打印
    printStudent(stu);
    
    setStudentName(stu, "周永康");
    
    //第三次打印
    printStudent(stu);
    
    //释放学生
    releaseStudent(stu);
    
    return 0;
}

