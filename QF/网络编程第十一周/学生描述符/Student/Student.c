//
//  Student.c
//  Student
//
//  Created by chen cheng on 14-8-1.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//



#include "Student.h"




typedef struct st_student
{
    char   *name;
    unsigned char sex;
    unsigned char age;
} ST_STUDENT;


#define MAX_NUMBER_OF_STUDENT 1024

static _Bool checkSex(unsigned char age);

static  ST_STUDENT *g_studentArray[MAX_NUMBER_OF_STUDENT] = {NULL};

StudentHandle createStudent(const char *name, unsigned char sex, unsigned char age)
{
    StudentHandle stuId = -1;
    
    int i = 0;
    for (i = 0;
         i<MAX_NUMBER_OF_STUDENT && g_studentArray[i]!=NULL;
         i++)
    {
        NULL;
    }
    
    if (i == MAX_NUMBER_OF_STUDENT)
    {
        stuId = -1;
        return stuId;
    }
    else
    {
        stuId = i;
    }
    
    g_studentArray[stuId] = (ST_STUDENT *)malloc(sizeof(ST_STUDENT));
    if (g_studentArray[stuId] == NULL)
    {
        stuId = -1;
        return stuId;
    }
    
    size_t nameLen = strlen(name);
    g_studentArray[stuId]->name = (char *)malloc(nameLen + 1);
    if (g_studentArray[stuId]->name == NULL)
    {
        return stuId;
    }
    strncpy(g_studentArray[stuId]->name, name, nameLen + 1);
    
    if (!checkSex(sex))
    {
        free(g_studentArray[stuId]->name);
        g_studentArray[stuId]->name = NULL;
        return stuId;
    }
    
    g_studentArray[stuId]->sex = sex;
    g_studentArray[stuId]->age = age;
    
    return stuId;
}

void setStudentName(StudentHandle stu, const char *name)
{
    if (name == NULL || (stu < 0 && stu >= MAX_NUMBER_OF_STUDENT))
    {
        return;
    }
    
    ST_STUDENT *c_self = g_studentArray[stu];

    size_t nameLen = strlen(name);
    if (c_self->name == NULL)
    {
        c_self->name = (char *)malloc(nameLen + 1);
    }
    else
    {
        c_self->name = (char *)realloc(c_self->name, nameLen + 1);
    }
    
    if (c_self->name == NULL)
    {
        return;
    }
    strncpy(c_self->name, name, nameLen + 1);
}

void setStudentSex(StudentHandle stu, unsigned char sex)
{
    if (stu < 0 && stu >= MAX_NUMBER_OF_STUDENT)
    {
        return;
    }

    ST_STUDENT *c_self = g_studentArray[stu];
    
    if (c_self == NULL)
    {
        return;
    }
    
    if (!checkSex(sex))
    {
        return;
    }
    
    c_self->sex = sex;
}

void setStudentAge(StudentHandle stu, unsigned char age)
{
    if (stu < 0 && stu >= MAX_NUMBER_OF_STUDENT)
    {
        return;
    }
    
    ST_STUDENT *c_self = g_studentArray[stu];

    if (c_self == NULL)
    {
        return;
    }
    
    c_self->age = age;
}


void printStudent(StudentHandle stu)
{
    if (stu < 0 && stu >= MAX_NUMBER_OF_STUDENT)
    {
        return;
    }
    
    ST_STUDENT *c_self = g_studentArray[stu];
    
    if (c_self == NULL)
    {
        return;
    }
    
    printf("***********************\n");
    printf("***********************\n");
    
    printf("姓名: %s\n", c_self->name);
    if (c_self->sex == 0)
    {
        printf("性别: 女\n");
    }
    else if (c_self->sex == 1)
    {
        printf("性别: 男\n");
    }
    else
    {
        printf("性别: 数据错误\n");
    }
    
    printf("年龄: %u\n", c_self->age);
    
    printf("***********************\n");
    printf("***********************\n\n");
}


void releaseStudent(StudentHandle stu)
{
    if (stu < 0 && stu >= MAX_NUMBER_OF_STUDENT)
    {
        return;
    }

    ST_STUDENT *c_self = g_studentArray[stu];
    
    if (c_self == NULL)
    {
        return;
    }

    if (c_self->name != NULL)
    {
        free(c_self->name);
        c_self->name = NULL;
    }
    
    free(c_self);
    g_studentArray[stu] = NULL;
}



static _Bool checkSex(unsigned char age)
{
    if (age!=0 && age!=1)
    {
        return false;
    }
    else
    {
        return true;
    }
}

