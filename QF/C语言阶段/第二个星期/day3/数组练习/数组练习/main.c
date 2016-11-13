//
//  main.c
//  数组练习
//
//  Created by qianfeng on 14-7-23.
//  Copyright (c) 2014年 zhang. All rights reserved.
//


//1.计算某个由英文、数字以及标点符号构成的数组的总宽度,其中英文字符的宽度为1cm,数字宽度为 0.5cm、标点符号宽度为 0.8cm。
//2.接上题,如果规定行的宽度为 10cm,将某个字符长度超过 50 的字符串截断,恰好 使 10cm 宽的行能容纳。输出这个被截断的子数组。
/*float jugechar(char ch)
{
    if ((ch >='a' && ch<='z') || (ch >= 'A' && ch <= 'Z')) {
        return 1.0;
    }
    else if (ch >= '0' && ch <= '9')
    {
        return 0.5;
    }
    else
        return 0.8;
}

int main(int argc, const char * argv[])
{
    char str[100];
    int i=0;
    int cnt=0;
    float length=0.0;
    while (1) {
        scanf("%c", &str[i]);
        if (str[i]=='\n') {
            str[i]='\0';
            break;
        }
        cnt++;
        i++;
    }
    //printf("%s %d", str, cnt);
    for (i=0; i<cnt; i++) {
        length += jugechar(str[i]);
        if (length > 10) {
            str[i]='\0';
        }
    }
    //printf("%f\n" , length);
    printf("%s\n", str);
    return 0;
}*/

//1. 有m个人围成一圈，开始报数，报道n，退出，问最后剩下的是几号。（从1号开始）
//比如：
//输入:5 3
//输出：
//4
//
//输入: 6 2
//输出:
//5

/*int main(int argc, const char *argv[])
{
    int a[100];
    int m, n;
    int i=0;
    int k=0;//保存报数的值
    int cnt=0;
    scanf("%d %d",&m,&n);
    for (i=0; i<m; i++) {
        a[i]=1;
    }
    i=0;
    while (cnt < m-1) {
        if (a[i]!=0)
        {
            k++;
        }
        if (k==n) {
            //printf("%d ",a[i]);
            a[i]=0;
            k = 0;
            cnt++;
        }
        i++;
        if (i==m) {//判断边界
            i=0;
        }
    }
    i=0;
    while (a[i]==0) {
        i++;
    }
    printf("%d ",i+1);
    return 0;
}*/

//2. 输入两个数，第一个数决定一个nXn的矩阵，第二个数决定从1开始赋值，赋值的上限
//比如：
//输入:5 18
//输出：
//1  2  3  4  5
//16 17 18 0  6
//15 0  0  0  7
//14 0  0  0  8
//13 12 11 10 9
//
//输入: 4 12
//输出:
//1  2  3  4
//12 0  0  5
//11 0  0  6
//10 9  8  7

/*int main(int argc, const char *argv[])
{
    int a[10][10]={0};
    int n, m;
    int type =1;//1,向右移动,2,向下移动,3,向左移动,4,向上移动
    int p=0,q=0;//控制二维数组下标
    int i=1;
    
    int s1,s2,s3,s4;
    scanf("%d %d", &n,&m);
    
    if (m>n*n || n>10) {
        return -1;
    }
    s1 = n-1;
    s2 = n-1;
    s3 = 0;
    s4 = 1;
    while (i <= m) {
        switch (type) {
            case 1:
                a[p][q++]=i;
                if (q==s1) {
                    type =2;
                    s1--;
                }
                break;
            case 2:
                a[p++][q]=i;
                if (p==s2) {
                    type=3;
                    s2--;
                }
                break;
            case 3:
                a[p][q--]=i;
                if (q == s3) {
                    type =4;
                    s3++;
                }
                break;
            case 4:
                a[p--][q] = i;
                if (p==s4) {
                    type =1;
                    s4++;
                }
                break;
            default:
                break;
        }
        
        i++;
    }
    
    for (i=0; i<n; i++) {
        for (int j=0; j<n; j++) {
            printf("%4d", a[i][j]);
        }
        printf("\n");
    }
    return 0;
}*/
//5.魔方阵是一个古老的智力问题，它要求在一个m*m的矩阵中填入1～m^2的数字（m为奇数），使得每一行、每一列、每条对角线的累加和都相等。请编程实现输入m，输出m*m的魔方阵出来。
//比如：
//输入：3
//输出：
//6 1 8
//7 5 3
//2 9 4

//4..输入10个数，找出出现次数最多的数 （如果多个并列，则按数字出现顺序分别输出）
//比如：
//输入：1 2 2 3 4 5 3 7 8 9
//输出：2
//数据结构: 定义一个整型数组 int count[10] 存储每个元素的个数, 开始时每个元素个数初始化为1
//
//算法:
//(1) 利用双层循环, 每一个元素都与后面一个元素比较, 如果两者相同, 则该元素次数+1,
//(2) 以上的算法中两个相同的元素的次数是一样的, 优化如下, 比较两个元素的时候, 如果两者相等, 则该元素次数+1, 后面的元素次数设置为0, 比较的时候再判断这个元素是否已经比较
//
//伪代码:
//
//定义数组保存每个元素次数
//
//使用双层循环遍历数组
//如果当前元素后后面元素相等, 并且后面的元素次数不为0
//当前元素次数+1, 后面的元素次数设置为0

/*int main(int argc, const char *argv[])
{
    int a[10];
    int count[10];
    int max;
    for (int i=0; i<10; i++) {
        scanf("%d",&a[i]);
    }
    for (int i=0; i<10; i++) {
        count[i]=1;
    }
    for (int i=0; i<10; i++) {
        for (int j =i+1; j<10; j++) {
            if (count[j]!=0 && a[i]==a[j])  {
                    count[i]++;
                    count[j]=0;
            }
        }
        //printf("%d ",count[i]);
    }
    
    max = count[0];
    for (int i=1; i<10; i++) {
        if (max < count[i]) {
            max = count[i];
        }
    }
    
    for (int i =0; i<10; i++) {
        if (max == count[i]) {
            printf("%d ",a[i]);
        }
    }
    
    return  0;
}*/


/*int main(int argc, const char *argv[])
{
    int n;
    int a[15][15]={0},i=0,j,k,tempi,tempj;
    scanf("%d",&n);
    if (n%2==0 || n<3 || n>15) {//判断是否满足条件
        return -1;
    }
    j=n/2;
    for(k=1;k<=n*n;k++)
    {
        a[i][j]=k;
        tempi=i;
        tempj=j;//保存上一次数的行跟列
        
        if(i==0)//变换行数
            i=n-1;
        else
            i=i-1;
        
        if (j==0)
            j=n-1;
        else
            j=j-1;
        
        if(a[i][j]!=0)
        {
            i=tempi+1;
            j=tempj;
        }
    }
    for(i=0;i<n;i++)
    {
        for(j=0;j<n;j++)
            printf("%4d ",a[i][j]);
        printf("\n");
    }
}*/
#include <stdio.h>
int main(int argc, const char *argv[])
{
    int a[100];
    int m, n;
    int i=0;
    int k=0;//保存报数的值
    int cnt=0;
    scanf("%d %d",&m,&n);
    for (i=0; i<m; i++) {
        a[i]=1;
    }
    i=0;
    while (cnt < m-1) {
        if (a[i]!=0)
        {
            k++;
        }
        if (k==n) {
            //printf("%d ",a[i]);
            a[i]=0;
            k = 0;
            cnt++;
        }
        i++;
        if (i==m) {//判断边界
            i=0;
        }
    }
    i=0;
    while (a[i]==0)
    {
        i++;
    }
    printf("%d",i+1);
    return 0;
}