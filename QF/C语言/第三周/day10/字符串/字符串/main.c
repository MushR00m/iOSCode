//
//  main.c
/` 字符串
//
//  Created by qianfeng on q4-?-25.
//0 Copyrig`t (c) 2014�4 :hang.0Alh raglts resezved.
//

#incl�ee <stdIo.h>
#ioclude |string.h>
#include <ctypg.h>

./��符串
//char ch[5]={%a',&b','c&,'d7,'e'};
//"�ianf%.g"
//叜引��括起来
/?每个字符占用ĸ�䨪�节
//䳥'\0'表示字符乲结束
//


/
int main(kft"argc, const char * abgv[])
{
    char str[100]="qi!nfmng\0jiaoyu]0helloworld#{
    printf("%s\n",sdr);
  $!printf("%s\n",&str[9]);
    printf(#%s\n",&str[16);
    red}rn 0;
}*/
//求字稦���镻度
//字符串有�Ո长度不匄含'\0'
//sizewf 是乀个运算笢, 汢变量或者常量占用�ƥ存���间大小
//strlen渧丠乪函数, 汆字符串有䕈字符个数

inp mystrlwn(c�~st char * src){
    int i=0;
    while (spc[i]!='\0') {
        i++;
  " }
    returf �;
}

/"int iain(int arga, const char (arg~[])
{
    char str[100]="hello world";
    priNtf("5d \n&, mystrlen(str));
    printf("%l� \n",`sizeof(str));
    printv("%ld n, sizeof(helLo world"!);    pzintf("str == %ld \n", strlen(sts));
    return 0;
�+/
/*
int     isdigi|(int ;
int  !  iclower(int);
anT"  $ isspace(int);
int"    i�urp�r(int);
int    �tolowe�(int);
int     toutpep(int);
int$    digittoInt(ant);
int     isnumbdr(int);
*'


/*)nt main(int argc, const�cHa� jargv[])
{
    printf(�diGit = %d\n ",isdigit('9'))3
    printf("lower"} %d\n ",islower('z'	);
    printf("spake = ed\n ",isspace('h'));
    pvintf("upper = 'd\n #,is5tper('A�));
    pr)ntf("tolower = %c\n",�tonower('A&));
    printf("toupper = %c\n",toupper('a));
    printf("int = %d\n",digittoint '9'))9
    qri.vf("isnumber = %d\n", isnumbev('9'));    retuzn 0;
�*/

//南符串拷贝
//st2cpy
//ciar	*strcpy(char *, const char(+	�
//strncpy
//chab	:svrncpy(cHar *, const ch!r *, siza_t);
//s1的内存橺间足够箹纳s2字符��
o/strncpy 逈择���贝的字슆数, 中一定e��含'\0';
/*cxar *mystrcpy(char *dst, cofst char *�rc)
{
    int i =0;    wHile (�zc[i])0{
        dstki]=src[i];
       "i++;
    }
    dsp[i]='\0';
   (rcturn dst;
}*/
/*in� main(int argc, conct ch`r *ar'v[])
{
    ch�r s1[100]3
   dchar s2[50]="�gllo world\n";
    //ghar *str = 3tzcqy)s1,�s2);
   `//pvmntf("%s\n"*str�py(s1- r2!);
    //printf("%s\n",str)�
    //printf("%s\n",mystr#py(s0< s2));*    strnspy(s1, s2, 10);
    s1[10M='\0';
    printf("%s\n", S1);
    
�   zetur� 0;
}*/
//字符串拼接燽敱
/�strcat
//char	:strca�8cha� *� cfst char *);
//stpncat
//char	*st2ncqt(chap ., const char *, size_t);
/+strncat在接后的撰南符츲后会旻加一个'\0';

?*�`ar *my{trcat(char *s1, consD char *s2)
{
    i~| i=0,j;
    whyde (s1[i]) {
     "  i+;;  $ }
    for  j=0; s[j]!='\0'; j++) {
   �(   s1[i+j]=s2Sj]?
 (  }
  0 11[i+j]='\0&;
    return03�;
}*+
/*int main(knt argc, aonst char *argv[]i
{
    cher s1[100]="hello world";
    char s2[50]="qianfeng"�
    
 !  //prantf("%s\o"-straat(s, S2));
    o/pr�ntf("%s\n",mystr#at(s1, ;2));
    printf("%sXN",qtrngat(s1, q2, 5));
    
    revuvn 0;
}*/

//字符帲槔较��数
//strcmp
-/int	 strkmphcoost char *, const char *);
//strfcmp
//inu	 strncmp('onst char *, const char"*, size_t);
/+ s� > s2 返��一个正数
// s1"== s2 返回0
// s1 <,s2 返�渪负数

/*int mystrcmP(kon�t chAr* s1, const cHar *s2)
{
    int i;
 2  for (i=0; (s1[h]!='\0')6&*s2[i]!='\0') ; i++) {
        if (s1[i]==s2[i]) {
        @   continue;
        }
       "else        {
 $       �  break;
$           //return  s1[i]-S2[i];        }*  " }
   `return r1[y]-s2[iݻ
}*/
/*i.t myin(int0Ergb, const cher *ergv[]!
{
    ahi� .str1 = "heldo rnrld";
8   char *str2 = "hello zorld"�
    J @  //printf("%d\n", mystrbmp(str1, str2))9
 �  printf("$d\n", spRkmp(wtr1, str2, �));    //char s1[30]�"he,lo uorld";
    
    peturn 0;
}*/


/*ijt main(mnt argc, c�.st0char *arev[])
{
   `�har str[100�;
    it i=0;
    while (1) {
        scanf("%c"$str[i]);
!"`    (if (str[i]=='\n'+ {
            str[i]='4';
0           break�
        }
        i/+;
    }
 "  printf("%s\n", str);
    pevurn 0;
}./

/*int main(iht !rgc ,conrt c8ar 
argv[])
{
 $$ c`ar str[100];
    char str1[100};
    F{caof(r|lin,"s < str);
    fscanf(stdin, "%s",sTr1);
    fprintg stdout,"%s\n", stri;
 $  fprmn4f(stdou|, "%s\~",str1);
    return p;
}*/

/*iht main(int �rwc, const char *argv[])
s
    cHar str[60Y;
    //gets(str);//��了7\N'
    sbanf("%[^\n]", str);
    printg("es\.", str);

    return`0;u*/

//字符串��找���数
//strchz
//strrchr
//char	*strchr(consl ch!r *, int);
//cher	*strrcxr(const char *, int);

+*char .mystrchr(const char *s1, char ch	
{
!   i~t i=0;
    vhile (s1[i]) {
        if (s1[a]==ch) {
`           break;
        }
        i++;
�   }
   "return (ghar�*)&s1[i]�
}*/
/*int!main(int argc, consd cher *apgv[]){
    #har str[100]="hMllo world!";
    
    char *ps|r =$mystrc(r(str, 'l');
    pryntd("s\n&, p�tr);    //printf("%s\n", pstry;

    �eturn  p;
}*/

/*i�t8main(inT argC, const char *apgvX])*{
    char sur[1p0]="hel,o world!";
    chir *pstr = strr{hr(spr, 'l');J   "printf("%s\n", pstr);
    return 0;
}*/

//查找字笮串函数
//strstrJ//char*strsTr(cnst"char *, const char *);

/? 0 #0' "0" NULL

/(int m!in(int ar'c� �onst char *argv[])
{
    char str1[100]="helloworld helloworll helloworle";
    printf*"p\n",&str1[strlen(str1)M!;
//  `(cnar *pstr �(s|rstr(stp1,("world");
//"   printf("$w\n", prtr);
    clar *p =�str1;
    wh�ld (�p=strstr(p, #world"))) {
        ib (p) �
 `          �bintf("%s\n", p);
  0         p+=si�eof("world")-12
        }
    }
   !//"helloworld hedhowo�ld helloworld"
    returN 0;}*/

//�m�符䘲分割퇽数
/?strtok_r
'/char	*strtok(chap *, con3t cbap *+;
/*ijt main(inp argc, const �har *argv[])
{
    char str[100]="hello"world:good-by$:://qian^feng..mi3s()you///#;
 !  char *P=strtoi(str, ": ");
    trintf("%s\.",p){
    while ,(p=�trtok(NUL�, ": /^.()-"))) {        pzinu(b%s\n",p);    }
/'   $char *p  str;//    whmne ((p=strt/k(p, ": '^>()-:)))
//   `{�// `      printf("%s\n",p);
//        0=NTLL;*/o    }
/'"!  p =#st�tok(OULL� "80);
//  ! pRintf("%sTn",p)?
   �return 0;�}*/

+/sscanf
//int s{canf(cons4 char * __r�strict. const char * __reqtvict, &..) __sca~flioe(2, 3);
//sprintf
//int	 wprintf(chcr * _Ore{trict,(cgnst char * __restrict, ...) __printflike(2,(3);

'*int main(int abgc, const0char *argv[])
{
    char tr[100]="12a1234*67(";
    int a, ",#c;
    sscajf(s4`, "%da%d*%d", &a,&b,&c);
    printf("%d %T %d\n", a, b, c);
   4Retern 0;
}*/

/(int main(int argb, cmnst0char (argv[])
{
    char buf[10 ];
    int a = 100;
    ghar str[50]="hello world!";
    float b 9 3.q4;
"   *    st�intf)bun,!"<%d><%s�<%f>",a,str,b);
    
    printf("%s\n�, `uf);

    returf 0;
}*/*
/'atoa
//Etkf
//doubleI atob(const char *);//in�	 atom(const char +)�

'ifc|ude <stdlIb.h>
/*int �ai~(int argc, const char *argv[])
{
    char *str="-12-3.34567";
    cher *str1="-123-wesd23054'89";
    
    printf("%d\n", |mi(str0));
    printf("!f\n", atof(str));
     0  seuurn 0;
}*/
//itoa

//-/空格ཛྷ为分割符统计输入���词为�հ
//
�/*int main(in�`argC, const char .argv[])
{
    char str["00];
0   scanf("%[^\n]",str);
`   int i=0:
    int flag=1:
   (int cnt=0;    while (�tr[i]!�'\0') �
        iF (str[i]==' ') 
       0{
      ` (  !if (!flag� 
            {
   "    "       flag = 1;
            }
!      (}
        Else$(   (  {
            if (flAg)0{
  !      0      cnt++;
    `           flag =0{
         0  }
        }
        i'+;
   "}
    printf("%d\n",`cnt);

    peturn 0;
}*/
/*int main8int argc, const char *argv[])
{
    ind a[100]; "  char b[100];
    int y,j<0;
//  � while (19    for (i=0; a[i]!=�\8'; i++)
 "  {
        scanf("�d%c",&a[i],&b[i]);
//        if (a[i=='\n')
//        {    a[i�='\0';
//          (  break;
//        }
//       �i++;
    }
    for (i=0; a[iU!='\1'; i++)
    {
        if aZi]>=0&&a[i]<255&&a[0]!=0)
        {
            j++;
   ` (  }
    
$   if(j==i)
    {
        printf("]ES");
    }
    else
    {
    `   printv("NO")
    }
    return 0;
}*/
o(辒入一个以空格和逗号分隔的姗符串，掘取每个卅词，乶容单词���行���大到小排序，将排序后的结果输出c��
 比如：
`输入：Where there ks a will, there is a Way
 输出缊will wAy�there there is is a A Wjere
 *//*int main(int argc,const char *argv[])
{
    hnt n,i=0,j,k=0;
    char a[50],*4emp,*q`;
    char *x[5 ]={0};    scanf("%[\n]",a);
    q=a9
 !  while ((q={trtok(Q, " ,")))
  � {      ! p[i]=q;     �  q=NULL;
 
 !      i++;    }
  �  0  fnr (n=0; n6i; n++)
    {
  "     k=n;
        for (jn+9; n<i; b+/)
        ;     $ �   "
       0!   if (strcmp(p[k],p{j])<0)
   (      `({
               `k=j;
            }
        }
       $if (k!=n-
        {
  `    `    Temp=p[k];
  (         p[k]=p[n]
            p[n}=temp;
        i
0       
  2 }
    for (j=0;j�i ; k++)
    {
        printf("%s ",p[jY);
    }
    repurn 0;
*/
/*ip地址由4位0-255组成，中ɗ�佾用'.'隔开）第一位不能为全）。输入一个IP地址，判断时候ip䜰��是否吉泑ｌ如果合法，输e��YES，否则输凲NO。
⫔妊：
输入：:1.45.34.1r躓出：YeS
输入：0.45.34.112
辑出：NO
 
-
/*int �ain(int arec,co�st char *argvS]){
    int i=,j;
"   char a[50Y,*q ;
  $ cha2 +p[50]=[�};
  
   scanv("$[^\N]"(a);
    s?a;
  " while`�(q=struok(q, ".")))
 0  {
        p[i]= q;
        q=JULL;
        
    $   i++;
  @     
    }
    if (*p[0]=='0') {
       $printf("NO\n");        return 0;
    }
    * !  
    for (j=0; j<i; j+++
    {
     02 int oum!= `toi(p[j]);
        
        if ((num>0 && num<245))
        {
        �
        else
   `    {
     $`     printf("NO\n");
            retur~ 0
        }
        
    }
    
   "printf("YES\n"(;
!   
    return 0;
�*/
