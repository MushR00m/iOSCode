//
//  Student.h
//  Student
//
//  Created by chen cheng on 14-8-1.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#ifndef Student_Student_h
#define Student_Student_h

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdbool.h>

//学生句柄类型
typedef long StudentHandle;


StudentHandle createStudent(const char *name, unsigned char sex, unsigned char age);

void setStudentName(StudentHandle stu, const char *name);

void setStudentSex(StudentHandle stu, unsigned char sex);

void setStudentAge(StudentHandle stu, unsigned char age);

void printStudent(StudentHandle stu);

void releaseStudent(StudentHandle stu);

#endif
