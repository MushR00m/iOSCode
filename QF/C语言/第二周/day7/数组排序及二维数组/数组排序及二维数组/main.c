//
//  main.c
//  数组排序及二维数组
//
//  Created by qianfeng on 14-7-22.
//  Copyright (c) 2014年 zhang. All rights reserved.
//

#include <stdio.h>
//冒泡排序: 相邻两数比较,大数往后移动,小数往前移动;
//4 5 7 8 9

//  9 7 8 5 4
//第一次排序,交换4次
//  7 9 8 5 4
//  7 8 9 5 4
//  7 8 5 9 4
//  7 8 5 4 9

//第二次排序,交换3次
//  7 8 5 4
//  7 5 8 4
//  7 5 4 8 9

//第三次排序,交换2次
//  5 7 4 8 9
//  5 4 7 8 9

//第四次排序
//  4 5 7 8 9

#define LEN 10

/*int main(int argc, const char * argv[])
{
    int a[LEN];
    int i, j;
    int temp;
    for (i=0; i<LEN; i++) {
        scanf("%d",&a[i]);
    }
    for (i = 0; i<LEN-1; i++) {
        for (j=0; j<LEN-1-i; j++) {
            if (a[j]>a[j+1]) {
                temp = a[j];
                a[j] = a[j+1];
                a[j+1]=temp;
            }
        }
    }
    for (i=0; i<LEN; i++) {
        printf("%d ",a[i]);
    }
    putchar('\n');
    
    return 0;
}*/

//选择排序

//9 7 8 5 4
//
//第一次排序
//4 7 8 5 9

//第二次排序
//4 5 8 7 9

//第三次排序
//4 5 7 8 9

//第四次排序
//4 5 7 8 9

/*int main(int argc, const char *argv[])
{
    //int a[5]={9, 7, 8, 5, 4};
    int a[LEN];
    int i,j;
    int k,temp;
    for (i=0; i<LEN; i++) {
        scanf("%d", &a[i]);
    }
    for (i=0; i<LEN-1; i++) {
        k=i;
        for (j=i+1; j<LEN; j++) {
            if (a[k]>a[j]) {
                k=j;
            }
        }
        if (k!=i) {
            temp = a[k];
            a[k] = a[i];
            a[i] = temp;
        }
    }
    for (i = 0; i<LEN; i++) {
        printf("%d ",a[i]);
    }
    putchar('\n');
    return 0;
}*/

//插入法排序
//
/*int main(int argc, const char *argv[])
{
    int i,j,temp;
    //int a[5]={9, 7, 8, 5, 4};
    int a[LEN];
    for (i=0; i<LEN; i++) {
        scanf("%d", &a[i]);
    }
    for (i=0; i< LEN-1; i++) {
        temp = a[i+1];
        j = i;
        while (j>=0&&a[j]>temp) {
            a[j+1]=a[j];
            j--;
        }
        a[j+1]=temp;
    }
    for (i=0; i<LEN; i++) {
        printf("%d ", a[i]);
    }
    printf("\n");
    return 0;
}*/

//二维数组
// int a[3][3]
//
//二维数组初始化
//直接初始化
/*int main(int argc, const char *argv[])
{
    int a[3][4]={1,2,3,4,5,6,7,8,9,10,11,12};
    int i, j;
    for (i=0; i<3; i++) {
        for (j=0; j<4; j++) {
            printf("%d ", a[i][j]);
        }
    }
    return  0;
}*/

/*int main(int argc,const char *argv[])
{
    int a[3][4]={{1,2,3,4},
                 {5,6,7,8},
                 {9,10,11,12}};
    for (int i=0; i<3; i++) {
        for (int j=0; j<4; j++) {
            printf("%d ",a[i][j]);
        }
        printf("\n");
    }
    printf("\n");
    return 0;
}*/

//1
//1 1
//1 2 1
//1 3 3 1
//1 4 6 4 1

//

/*int main(int argc,const char *argv[])
{
    int a[10][10];
    int i, j;
    for (i=0; i<10; i++) {
        for (j=0; j<=i; j++) {
            if (j==0 || i==j) {
                a[i][j]=1;
            }
            else
            {
                a[i][j]=a[i-1][j-1]+a[i-1][j];
            }
            printf("%d  ",a[i][j]);
        }
        printf("\n");
    }
    return 0;
}*/
#include<stdio.h>
int main(int argc,const char *argv[])
{
    int i,n,sum=0,j=1;
    scanf("%d",&n);
    for(i=1;i<=n;i++)
    {
        j*=i;
        sum+=j;
    }
    printf("%d\n",sum);
    return 0;
}

