//
//  main.c
//  练习
//
//  Created by qianfeng on 14-7-29.
//  Copyright (c) 2014年 zhang. All rights reserved.
//

#include <stdio.h>
//字符串压缩算法，把输入的字符串压缩处理后的结果保存到第二个字符串中，并输出。
//比如：
//输入：aaaaaaaaaaaeefggg
//输出为：a11e2f1g3
//输入：eeeeeaaaff
//压缩为：e5a3f2

/*void compress(char *src, char *dst)
{
    int cnt=1;
    char ch;
    ch=*src;
    src++;
    while (*src) {
        if(*src != ch) {
            int val = sprintf(dst, "%c%d",ch,cnt);
            dst+=val;
            cnt =1;
            ch = *src;
        }
        else
        {
            cnt++;
        }
        src++;
    }
    sprintf(dst, "%c%d",ch,cnt);
}
int main(int argc, const char * argv[])
{
    char str1[100];
    char str2[100];
    scanf("%s",str1);
    compress(str1, str2);
    printf("%s\n",str2);
    
    return 0;
}
*/

//3.求一个字符串s的最大连续递增数字子串。
//
//
//比如：
//输入
//f123fffwf3210abcd
//输出为
//123
//
//输入
//abcd765bbw1357f123
//输出为
//123

#include <ctype.h>
#include <string.h>
#include <stdio.h>
int main(int argc, const char *argv[])
{
    char str[100];
    char substr[100];
    scanf("%s",str);
    int cnt=0;
        int max=0;
    
    char *pstr = str;
    while(*pstr)
    {
        if(isdigit(*pstr))
        {
            cnt =1;
            pstr++;
            while((*pstr)==*(pstr-1)+1)
            {
                cnt++;
                pstr++;
            }
            if (max <cnt)
            {
                max =cnt;
                strncpy(substr,pstr-cnt,cnt);
                cnt = 0;
            }
        }
        pstr++;
    }
    substr[max]='\0';
    printf("%s\n",substr);
    return 0;
}

//1.字符串排序。比较三个字符串的大小，然后按从小到大的顺序将字符串输出。
//比如：
//输入
//asdfwd
//ddrwf
//ffweff
//输出为
//asdfwd
//ddrwf
//ffweff
//
//输入
//sgfgeasdfw
//aabbe
//wrwwdfaf
//输出为
//aabbe
//sgfgeasdfw
//wrwwdfaf


/*#include <stdio.h>
 #include <string.h>
 #include <stdlib.h>
 
 int main(int argc, const char *argv[])
 {
 char *pstr[3];
 int i,j,k;
 for (i=0; i<3; i++) {
 pstr[i] = (char *)malloc(sizeof(char)*100);
 scanf("%s",pstr[i]);
 }
 
 for (j=0; j<3-1; j++) {
 k = j;
 for (i = j+1; i<3; i++)
 {
 //if(a[k]>a[i])
 if (strcmp(pstr[k], pstr[i])>0) {
 k= i;
 }
 }
 if (k!=j)
 {//如果K的值发生变化,那么k就是最小数的下标
 char *temp;
 temp = pstr[k];
 pstr[k] = pstr[j];
 pstr[j] = temp;
 }
 }
 
 for (i=0; i<3; i++) {
 printf("%s\n",pstr[i]);
 }
 
 }*/
//2.
//查找一个字符在字符串1中第一次出现的字符位置，
//比如：
//输入
//asdfwd
//d
//输出为
//2
//
//输入
//hhff
//h
//输出为
//0

/*int main(int argc, const char *argv[])
 {
 char str[100];
 char ch;
 scanf("%s %c", str, &ch);
 
 int index = (char)(strchr(str, ch)-str);
 
 printf("%d\n", index);
 
 
 return 0;
 }*/

//5.
// 字符串解压缩算法，把输入字符串解压处理后结果保存在第二个字符串中，并输出。
// 比如：
// 输入：a11e2f1g3
// 输出：aaaaaaaaaaaeefggg
// 输入：e5a3f2
// 输出：eeeeeaaaff

/*int main(int argc, const char *argv[])
 {
 char str[100];
 char ch[100];
 int cnt[100];
 int i=0;
 int j,k;
 char *pstr=str;
 scanf("%s",str);
 while (*pstr) {
 sscanf(pstr,"%c%d",&ch[i],&cnt[i]);
 pstr++;
 while (*pstr>='0' && *pstr<='9') {
 pstr++;
 }
 i++;
 }
 for (j=0; j<i; j++) {
 for (k=0; k<cnt[j]; k++) {
 printf("%c",ch[j]);
 }
 }
 return 0;
 }*/

