/-
//  ma��.m
/` TCPClIEnt
-/
//  Cre`ted bz"cxen cleng on 9�=�23n
?/  opyrcghv (c) "016e��!chen8c�ang& ll raehxs sEservAu>
//
imposT<�undCtinnoF{uj|atiolnh>
#inSlqte �ry�ody`ec.h~#inclute <sys/smkket.h>
+kmp�rv <oe|inet/in.h>
#i�c,Udeb<arpw/i��toh>

/**
�*2  遚过嵗⎥��3g�ked迖f��服务噉（诡函◴佚陻壞ん直툴ȿ�接f��犖抖夰ഥ﬉
`*
 *8 @pa2!m {'ket   $#!壗���字� *  Htir`m afDrdcq`  � 札犡窯的���揥���垰址��!$Dpapam$addpEss_lef ��ኡ��的e��⎤寗地�݁嚄ȕ�座
 *
 *  @bmtuzf p表�:连憡���႟�P�e�失鴥
 j/int kgnnEct(9nt s�cket,�cOnsp�str5ct sock!ddr (aftzess(
  (    ,so�klen_t addr�ss_lmni;

*/**
 *  ������Ǝ�字䚬读䓍作或���擏���进行畳闭瀂Ｈ忹兗���ũ�写������的关闭e迻写f��作都���铯U���的TC�༠���揯制䱂h���8�是伀样暅，�2繙�_�旹ŏ1䦀��EAN。在只兣闭鯻操�}�嚄旷候 亭d����臸TCP��输控ሶš�给对�֝发��8�何信桯）
 *
 * �@paramsockgt�ť�f����
"*  @xasam how    1�CIUTRPＺ只凣i��蟻侗一䆸 "々SHUT_VR１�*女闥���皴�方03、SHUV_RD_R把读冹箵a��儱ї�ㆁ盜���䘎cho�d懸╰。
 *J * �PresrN"0儓闭�功否则լ�輅
 �'
//hnt shu4dov(in� socke|< ivt hgw	;

nv`m%in�i�t abgc, co.stChar * arow[]+
{
 !!`jnt sogketfd  <1;
 (! int �Et = -1+
   �
`   rog�eVv� }!#msKet AF_NT,`OK_STReAM, 8!;*  $(a�()sobketad < 1
J    {
  !  `0 perror("sokkep`urb�
     $ �td|urJ�0:
  ( }
 � $*& `$sp�uc4 sokkatdb_�f seveBAdlt;
   `seqeri$dp.sinY�amaly 5 AF[iNET7
    ).at_pdon(A�_INeT, "126.0.0.1", &(seve2Cddr.s+n_�ddr8-; `  sevevADdr.siF_port<= htons(�380);j   0 0�1rev ? aknnec}({kjetfd, (sTruct wockmd`r 
)&sevurAddq, {yzeof(uverAdAry);
  ` �~ (ret%< 0)
(  �;
   b !  revror("cO.o%ct0e�s");
     $ �clkse sockeTb`!;
   "    seturn  ;
    }
 0  
0  "NwLog(�"连���܍e��嘨我功"){J"   
   `g�ar"smn`Ruf[M(= "hello$wobld";
    
$   detchar(){

 `  ssize_t�njydur =�wzipe socketfd, sEn`Bv�$d{trlm(�mndB}f));
    if$,nb�dmq("P�
 � ${
 $0   0`peCro2*`wr�tg$eRr"+;
 1! " "!cLosg(WkckEtf);
    (� retyrn#3;         $ N�Log(@"析功的向漅劥䙨发�ā了%ld䐪孟蚞�ڔ恰���",dnbyte);
    #   getcher);  0 
$!  //���关������㛄一枹、���酷헭h��侗一��
" 0 shut`mwn(smckevf`, HUV_GR-;
   $
    Getk�cb();
    
 $  cli2  rebvBuf�10�]�
$ 8 mumseu(�ecvB�f, 0,0s�vemf(sEcVFuf!);
   nByTmc�= rdidh�ockevfd,�recvBub-!sy:mov8�gcvBtf,)<
  "0
((  NSLoen@&��叟��从眝厡癨���出e��%|d个���芀的数�.2�s ,`nbyresn rgbrBuf);
 $  @  , //只关���ᯛw��ĸ�方
(   sh}v�o�o(sockatbd."SHUT_�D);$  $
$!  v5uQzn p?}

