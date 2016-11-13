//
//  main.c
//  练习
//
//  Created by qianfeng on 14-7-22.
//  Copyright (c) 2014年 zhang. All rights reserved.
//

#include <stdio.h>
#include <string.h>

//7.计算某个由英文、数字以及标点符号构成的数组的总宽度,其中英文字符的宽度为
//1cm,数字宽度为 0.5cm、标点符号宽度为 0.8cm。
//8.接上题,如果规定行的宽度为 10cm,将某个字符长度超过 50 的字符串截断,恰好 使 10cm 宽的行能容纳。输出这个被截断的子数组。

/*
float jugechar(char ch)
{
    if ((ch>='a' && ch <= 'z')||(ch >='A'&&ch<='Z')) {
        return 1.0;
    }
    else if((ch>='0' && ch <= '9'))
    {
        return 0.5;
    }
    else
        return 0.8;
}

int main(int argc, const char * argv[])
{
    char str[100];
    int len=0;
    int i=0;
    float length=0;
    while (1) {
        scanf("%c", &str[i]);
        if (str[i]=='\n') {
            str[i]='\0';
            break;
        }
        len++;
        i++;
    }
    printf("%s\n",str);
    
    for (i=0; i<len; i++) {
        length += jugechar(str[i]);
        
    }
    printf("%.2f\n", length);
    
    return 0;
}*/

//有m个人围成一圈，开始报数，报道n，退出，问最后剩下的是几号。（从1号开始）
//比如：
//输入:5 3
//输出：
//4

//输入: 6 2
//输出:
//5



/*int main(int argc, const char* argv[])
{
    int i,k,m,n,cnt,num[100];
    
    scanf("%d%d",&m,&n);
    if(n>m||m>100)
        return -1;
    for(i=0; i<m; i++) //初始化num数组
        num[i]=i+1;
    cnt=0;
    k= 0;
    i= 0;
    while (cnt<m-1)//cnt 指出局人数
    {
        if(num[i]!=0)//判断这个号是否出局
            k++;
        if(k==n)//报n的出局
        {
            num[i]=0;//将出局的这个人标记
            k=0;//使计数器置零，以便后面的人报数
            cnt++;//出局人数计数器加1
        }
        i++;
        if(i==m)
            i=0;
    }
    i=0;
    while (num[i]==0) {//找到位置
        i++;
    }
    printf("%d\n",num[i]);
    
    return 0;
}*/

/*输入两个数，第一个数决定一个nXn的矩阵，第二个数决定从1开始赋值，赋值的上限
 比如：
 输入:5 18
 输出：
 1 2 3 4 5
 16 17 18 0 6
 15 0 0 0 7
 14 0 0 0 8
 13 12 11 10 9
 
 输入: 4 12
 输出:
 1 2 3 4
 12 0 0 5
 11 0 0 6
 10 9 8 7*/



/*int main(int argc ,const char * argv[])
{
    int a[100][100]={0};//定义二维数组
    int n ,m;
    int i,p,q;
    int right,left,up,down,type;
    scanf("%d%d",&n,&m);//输入n, m
    if(m>n*n||n>100)//判断条件是否满足
        return -1;
    
    //memset(a, 0, sizeof(a));//数组初始化
    
    type = 0;  //确定输入的方向，0向左1向下2向左3向上
    right = n-1;  //向右输入的边界
    down = n-1;   //向下输入的边界
    left = 0;     //向左输入的边界
    up = 1;         //向上输入的边界
    
    for(i=1,p=0,q=0; i<=m; i++)
    {
        switch(type)
        {
            case 0:
                a[p][q++] = i;
                if(q==right)
                {
                    type = 1;
                    right--;
                }
                break;
            case 1:
                a[p++][q] = i;
                if(p==down)
                {
                    type = 2;
                    down--;
                }
                break;
            case 2:
                a[p][q--] = i;
                if(q==left)
                {
                    type = 3;
                    left++;
                }
                break;
            case 3:
                a[p--][q] = i;
                if(p==up)
                {
                    type = 0;
                    up++;
                }
                break;
        }
    }
    for(p=0; p<n; p++)
    {
        for(q=0; q<n; q++)
            printf("%5d",a[p][q]);
        printf("\n");
    }
    return 0;
}*/


//输入十个数，任意相邻的两个数不同，输出所有的递增，递减序列
//比如：
//输入:1 5 9 8 12 21 3 0 -1 9
//输出：
//1 5 9
//9 8
//8 12 21
//21 3 0 -1
//-1 9
//
//输入: 3 9 8 -11 4 21 8 -3 0 2
//输出:
//3 9
//9 8 -11
//-11 4 21
//21 8 -3
//-3 0 2

/*int main(int argc, const char *argv[])
{
    int a[10];
    for (int i=0; i<10; i++) {
        scanf("%d", &a[i]);
    }
    printf("%d ",a[0]);
    for (int i=1; i<10-1; i++)
    {
        printf("%d ",a[i]);
        if ((a[i]<a[i-1]&&a[i]<a[i+1]) || (a[i]>a[i-1]&&a[i]>a[i+1])) {
            printf("\n");
            printf("%d ",a[i]);;
        }
    }
    printf("%d \n",a[9]);

    return 0;
}
*/

//输入10个数，找出出现次数最多的数 （如果多个并列，则按数字出现顺序分别输出）
//比如：
//输入：1 2 2 3 4 5 6 7 8 9
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
//
//从保存每个元素次数的数组中查找最大的值

/*int main(int argc, const char *argv[])
{
    int a[10];
    int count[10];
    int temp;
    int i, j, k=0;
    for (i=0; i<10; i++) {
        count[i]=1;
    }
    for (i=0; i<10; i++) {
        scanf("%d", &a[i]);
    }
    for (i=0; i<10; i++) {
        for (j=i+1; j<10; j++) {
            if (count[j] && a[j]==a[i]) {
                    count[i]++;
                    count[j]=0;
            }
        }
        printf("%d ",count[i]);
    }
    putchar('\n');
    //找出最大值
    temp = count[0];
    for (i=0; i<10; i++) {
        if (temp < count[i]) {
            temp = count[i];
            k=i;
        }
    }
    for (; k<10; k++) {
        if (temp ==count[k]) {
            printf("%d ",a[k]);
        }
    }
    printf("\n");
    return 0;
}*/

//魔方阵是一个古老的智力问题，它要求在一个m*m的矩阵中填入1～m^2的数字（m为奇数），使得每一行、每一列、每条对角线的累加和都相等。请编程实现输入m，输出m*m的魔方阵出来。
//比如：
//输入：3
//输出：
//6 1 8
//7 5 3
//2 9 4

//8 1 6
//3 5 7
//4 9 2

//(1)将1放在第一行中间一列；
//(2)从2开始直到n×n止各数依次按下列规则存放；每一个数存放的行比前一个数的行数减1，列数加1/减1（例如上面的三阶魔方阵，5在4的上一行后一列）；
//(3)如果上一个数的行数为1，则下一个数的行数为n(指最下一行);例如1在第一行，则2应放在最下一行，列数同样加1；
//(4)当上一个数的列数为n时，下一个数的列数应为1，行数减去1。例如2在第3行最后一列，则3应放在第二行第一列；
//(5)如果按上面规则确定的位置上已有数，或上一个数是第一行第n列时，则把下一个数放在上一个数的下面。例如按上面的规定，4应该放在第1行第2列，但该位置已经被占据，所以4就放在3的下面；

//15  8   1   24  17
//16  14  7   5   23
//22  20  13  6   4
//3   21  19  12  10
//9   2   25  18  11

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