function dydt=NetfluxODE_pooled(t,y,params) 
% NetfluxODE_pooled.m 
% Automatically generated by Netflux on 07-May-2022
 
% Assign names for parameters 
[rpar,tau,ymax,speciesNames]=params{:}; 
AngII = 1; 
AngIIin = 2; 
AngIIfb = 3; 
AT1R = 4; 
AGT = 5; 
ACE = 6; 
NOX = 7; 
ROS = 8; 
ET1 = 9; 
ET1in = 10; 
ET1fb = 11; 
ETAR = 12; 
DAG = 13; 
PKC = 14; 
TRPC = 15; 
NE = 16; 
NEin = 17; 
BAR = 18; 
AC = 19; 
cAMP = 20; 
PKA = 21; 
CREB = 22; 
CBP = 23; 
TGFB = 24; 
TGFBin = 25; 
TGFBfb = 26; 
TGFB1R = 27; 
smad3 = 28; 
smad7 = 29; 
latentTGFB = 30; 
BAMBI = 31; 
PDGF = 32; 
PDGFin = 33; 
PDGFR = 34; 
NP = 35; 
NPin = 36; 
NPRA = 37; 
cGMP = 38; 
PKG = 39; 
tension = 40; 
tensionin = 41; 
tensionfb = 42; 
B1int = 43; 
Rho = 44; 
ROCK = 45; 
Ca = 46; 
calcineurin = 47; 
NFAT = 48; 
IL6 = 49; 
IL6in = 50; 
IL6fb = 51; 
gp130 = 52; 
STAT = 53; 
IL1 = 54; 
IL1in = 55; 
IL1RI = 56; 
TNFa = 57; 
TNFain = 58; 
TNFaR = 59; 
NFKB = 60; 
PI3K = 61; 
Akt = 62; 
p38 = 63; 
TRAF = 64; 
ASK1 = 65; 
MKK3 = 66; 
PP1 = 67; 
JNK = 68; 
abl = 69; 
Rac1 = 70; 
MEKK1 = 71; 
MKK4 = 72; 
ERK = 73; 
Ras = 74; 
Raf = 75; 
MEK1 = 76; 
FAK = 77; 
epac = 78; 
Factin = 79; 
FA = 80; 
cmyc = 81; 
CTGF = 82; 
proliferation = 83; 
SRF = 84; 
EDAFN = 85; 
aSMA = 86; 
AP1 = 87; 
TIMP1 = 88; 
TIMP2 = 89; 
PAI1 = 90; 
proMMP14 = 91; 
proMMP1 = 92; 
proMMP2 = 93; 
proMMP9 = 94; 
fibronectin = 95; 
periostin = 96; 
proCI = 97; 
proCIII = 98; 
B3int = 99; 
Src = 100; 
Grb2 = 101; 
p130Cas = 102; 
YAP = 103; 
MRTF = 104; 
Gactin = 105; 
TNC = 106; 
mTORC1 = 107; 
mTORC2 = 108; 
p70S6K = 109; 
EBP1 = 110; 
syndecan4 = 111; 
proMMP3 = 112; 
proMMP8 = 113; 
proMMP12 = 114; 
thrombospondin4 = 115; 
osteopontin = 116; 
contractility = 117; 
RhoGEF = 118; 
RhoGDI = 119; 
talin = 120; 
vinculin = 121; 
paxillin = 122; 
MLC = 123; 
AT2R = 124; 
E2 = 125; 
E2in = 126; 
ERX = 127; 
ERB = 128; 
GPR30 = 129; 
CyclinB1 = 130; 
CDK1 = 131; 
LOX = 132; 
dydt = zeros(132,1); 
dydt(AngII) = (OR(act(y(AngIIin),rpar(:,12)),act(y(AngIIfb),rpar(:,200)))*ymax(AngII) - y(AngII))/tau(AngII); 
dydt(AngIIin) = (rpar(1,1)*ymax(AngIIin) - y(AngIIin))/tau(AngIIin); 
dydt(AngIIfb) = (AND(rpar(:,187),act(y(AGT),rpar(:,187)),act(y(ACE),rpar(:,187)))*ymax(AngIIfb) - y(AngIIfb))/tau(AngIIfb); 
dydt(AT1R) = (OR(AND(rpar(:,23),act(y(AngII),rpar(:,23)),inhib(y(ERB),rpar(:,23))),act(y(tension),rpar(:,109)))*ymax(AT1R) - y(AT1R))/tau(AT1R); 
dydt(AGT) = (AND(rpar(:,186),inhib(y(AT1R),rpar(:,186)),act(y(p38),rpar(:,186)),inhib(y(JNK),rpar(:,186)))*ymax(AGT) - y(AGT))/tau(AGT); 
dydt(ACE) = (act(y(TGFB1R),rpar(:,40))*ymax(ACE) - y(ACE))/tau(ACE); 
dydt(NOX) = (OR(act(y(AT1R),rpar(:,24)),act(y(TGFB1R),rpar(:,78)))*ymax(NOX) - y(NOX))/tau(NOX); 
dydt(ROS) = (OR(act(y(NOX),rpar(:,25)),act(y(ETAR),rpar(:,35)))*ymax(ROS) - y(ROS))/tau(ROS); 
dydt(ET1) = (OR(act(y(ET1in),rpar(:,20)),act(y(ET1fb),rpar(:,202)))*ymax(ET1) - y(ET1))/tau(ET1); 
dydt(ET1in) = (rpar(1,9)*ymax(ET1in) - y(ET1in))/tau(ET1in); 
dydt(ET1fb) = (act(y(AP1),rpar(:,191))*ymax(ET1fb) - y(ET1fb))/tau(ET1fb); 
dydt(ETAR) = (act(y(ET1),rpar(:,44))*ymax(ETAR) - y(ETAR))/tau(ETAR); 
dydt(DAG) = (OR(act(y(ETAR),rpar(:,87)),act(y(AT1R),rpar(:,88)))*ymax(DAG) - y(DAG))/tau(DAG); 
dydt(PKC) = (OR(AND(rpar(:,100),act(y(DAG),rpar(:,100)),act(y(mTORC2),rpar(:,100))),act(y(syndecan4),rpar(:,121)))*ymax(PKC) - y(PKC))/tau(PKC); 
dydt(TRPC) = (OR(act(y(DAG),rpar(:,89)),act(y(tension),rpar(:,108)))*ymax(TRPC) - y(TRPC))/tau(TRPC); 
dydt(NE) = (act(y(NEin),rpar(:,18))*ymax(NE) - y(NE))/tau(NE); 
dydt(NEin) = (rpar(1,7)*ymax(NEin) - y(NEin))/tau(NEin); 
dydt(BAR) = (act(y(NE),rpar(:,43))*ymax(BAR) - y(BAR))/tau(BAR); 
dydt(AC) = (OR(act(y(BAR),rpar(:,47)),AND(rpar(:,48),act(y(AT1R),rpar(:,48)),act(y(BAR),rpar(:,48))))*ymax(AC) - y(AC))/tau(AC); 
dydt(cAMP) = (OR(act(y(AC),rpar(:,49)),act(y(ERB),rpar(:,135)))*ymax(cAMP) - y(cAMP))/tau(cAMP); 
dydt(PKA) = (OR(act(y(cAMP),rpar(:,37)),act(y(ERB),rpar(:,136)))*ymax(PKA) - y(PKA))/tau(PKA); 
dydt(CREB) = (act(y(PKA),rpar(:,42))*ymax(CREB) - y(CREB))/tau(CREB); 
dydt(CBP) = (OR(inhib(y(smad3),rpar(:,38)),inhib(y(CREB),rpar(:,39)))*ymax(CBP) - y(CBP))/tau(CBP); 
dydt(TGFB) = (OR(act(y(TGFBin),rpar(:,13)),OR(AND(rpar(:,140),act(y(AT1R),rpar(:,140)),inhib(y(CDK1),rpar(:,140))),act(y(TGFBfb),rpar(:,199))))*ymax(TGFB) - y(TGFB))/tau(TGFB); 
dydt(TGFBin) = (rpar(1,2)*ymax(TGFBin) - y(TGFBin))/tau(TGFBin); 
dydt(TGFBfb) = (OR(AND(rpar(:,183),act(y(latentTGFB),rpar(:,183)),act(y(proMMP9),rpar(:,183))),OR(AND(rpar(:,184),act(y(latentTGFB),rpar(:,184)),act(y(proMMP2),rpar(:,184))),AND(rpar(:,185),act(y(latentTGFB),rpar(:,185)),act(y(tension),rpar(:,185)))))*ymax(TGFBfb) - y(TGFBfb))/tau(TGFBfb); 
dydt(TGFB1R) = (AND(rpar(:,41),act(y(TGFB),rpar(:,41)),inhib(y(BAMBI),rpar(:,41)))*ymax(TGFB1R) - y(TGFB1R))/tau(TGFB1R); 
dydt(smad3) = (OR(AND(rpar(:,32),act(y(TGFB1R),rpar(:,32)),inhib(y(smad7),rpar(:,32)),inhib(y(PKG),rpar(:,32)),inhib(y(ERB),rpar(:,32))),act(y(Akt),rpar(:,97)))*ymax(smad3) - y(smad3))/tau(smad3); 
dydt(smad7) = (OR(act(y(STAT),rpar(:,82)),AND(rpar(:,101),act(y(AP1),rpar(:,101)),inhib(y(YAP),rpar(:,101))))*ymax(smad7) - y(smad7))/tau(smad7); 
dydt(latentTGFB) = (act(y(AP1),rpar(:,182))*ymax(latentTGFB) - y(latentTGFB))/tau(latentTGFB); 
dydt(BAMBI) = (AND(rpar(:,81),act(y(TGFB),rpar(:,81)),act(y(IL1RI),rpar(:,81)))*ymax(BAMBI) - y(BAMBI))/tau(BAMBI); 
dydt(PDGF) = (act(y(PDGFin),rpar(:,19))*ymax(PDGF) - y(PDGF))/tau(PDGF); 
dydt(PDGFin) = (rpar(1,8)*ymax(PDGFin) - y(PDGFin))/tau(PDGFin); 
dydt(PDGFR) = (act(y(PDGF),rpar(:,46))*ymax(PDGFR) - y(PDGFR))/tau(PDGFR); 
dydt(NP) = (act(y(NPin),rpar(:,21))*ymax(NP) - y(NP))/tau(NP); 
dydt(NPin) = (rpar(1,10)*ymax(NPin) - y(NPin))/tau(NPin); 
dydt(NPRA) = (act(y(NP),rpar(:,54))*ymax(NPRA) - y(NPRA))/tau(NPRA); 
dydt(cGMP) = (act(y(NPRA),rpar(:,55))*ymax(cGMP) - y(cGMP))/tau(cGMP); 
dydt(PKG) = (act(y(cGMP),rpar(:,56))*ymax(PKG) - y(PKG))/tau(PKG); 
dydt(tension) = (OR(act(y(tensionin),rpar(:,14)),act(y(tensionfb),rpar(:,203)))*ymax(tension) - y(tension))/tau(tension); 
dydt(tensionin) = (rpar(1,3)*ymax(tensionin) - y(tensionin))/tau(tensionin); 
dydt(tensionfb) = (AND(rpar(:,198),act(y(FA),rpar(:,198)),act(y(contractility),rpar(:,198)))*ymax(tensionfb) - y(tensionfb))/tau(tensionfb); 
dydt(B1int) = (OR(act(y(tension),rpar(:,105)),AND(rpar(:,106),act(y(PKC),rpar(:,106)),act(y(tension),rpar(:,106))))*ymax(B1int) - y(B1int))/tau(B1int); 
dydt(Rho) = (OR(act(y(TGFB1R),rpar(:,85)),AND(rpar(:,120),inhib(y(PKG),rpar(:,120)),act(y(RhoGEF),rpar(:,120)),inhib(y(RhoGDI),rpar(:,120))))*ymax(Rho) - y(Rho))/tau(Rho); 
dydt(ROCK) = (act(y(Rho),rpar(:,52))*ymax(ROCK) - y(ROCK))/tau(ROCK); 
dydt(Ca) = (act(y(TRPC),rpar(:,90))*ymax(Ca) - y(Ca))/tau(Ca); 
dydt(calcineurin) = (act(y(Ca),rpar(:,91))*ymax(calcineurin) - y(calcineurin))/tau(calcineurin); 
dydt(NFAT) = (act(y(calcineurin),rpar(:,92))*ymax(NFAT) - y(NFAT))/tau(NFAT); 
dydt(IL6) = (OR(act(y(IL6in),rpar(:,15)),act(y(IL6fb),rpar(:,201)))*ymax(IL6) - y(IL6))/tau(IL6); 
dydt(IL6in) = (rpar(1,4)*ymax(IL6in) - y(IL6in))/tau(IL6in); 
dydt(IL6fb) = (OR(AND(rpar(:,188),act(y(CREB),rpar(:,188)),act(y(CBP),rpar(:,188))),OR(act(y(NFKB),rpar(:,189)),act(y(AP1),rpar(:,190))))*ymax(IL6fb) - y(IL6fb))/tau(IL6fb); 
dydt(gp130) = (act(y(IL6),rpar(:,26))*ymax(gp130) - y(gp130))/tau(gp130); 
dydt(STAT) = (act(y(gp130),rpar(:,30))*ymax(STAT) - y(STAT))/tau(STAT); 
dydt(IL1) = (act(y(IL1in),rpar(:,16))*ymax(IL1) - y(IL1))/tau(IL1); 
dydt(IL1in) = (rpar(1,5)*ymax(IL1in) - y(IL1in))/tau(IL1in); 
dydt(IL1RI) = (act(y(IL1),rpar(:,45))*ymax(IL1RI) - y(IL1RI))/tau(IL1RI); 
dydt(TNFa) = (act(y(TNFain),rpar(:,17))*ymax(TNFa) - y(TNFa))/tau(TNFa); 
dydt(TNFain) = (rpar(1,6)*ymax(TNFain) - y(TNFain))/tau(TNFain); 
dydt(TNFaR) = (act(y(TNFa),rpar(:,53))*ymax(TNFaR) - y(TNFaR))/tau(TNFaR); 
dydt(NFKB) = (OR(AND(rpar(:,29),act(y(IL1RI),rpar(:,29)),inhib(y(ERX),rpar(:,29))),OR(AND(rpar(:,33),act(y(ERK),rpar(:,33)),inhib(y(ERX),rpar(:,33))),OR(AND(rpar(:,34),act(y(p38),rpar(:,34)),inhib(y(ERX),rpar(:,34))),AND(rpar(:,79),act(y(Akt),rpar(:,79)),inhib(y(ERX),rpar(:,79))))))*ymax(NFKB) - y(NFKB))/tau(NFKB); 
dydt(PI3K) = (OR(act(y(TNFaR),rpar(:,31)),OR(act(y(TGFB1R),rpar(:,75)),OR(act(y(PDGFR),rpar(:,76)),act(y(FAK),rpar(:,77)))))*ymax(PI3K) - y(PI3K))/tau(PI3K); 
dydt(Akt) = (OR(AND(rpar(:,99),act(y(PI3K),rpar(:,99)),act(y(mTORC2),rpar(:,99))),OR(act(y(ERX),rpar(:,137)),act(y(GPR30),rpar(:,141))))*ymax(Akt) - y(Akt))/tau(Akt); 
dydt(p38) = (OR(act(y(ROS),rpar(:,27)),OR(act(y(MKK3),rpar(:,61)),OR(act(y(Ras),rpar(:,74)),AND(rpar(:,83),act(y(Rho),rpar(:,83)),inhib(y(Rac1),rpar(:,83))))))*ymax(p38) - y(p38))/tau(p38); 
dydt(TRAF) = (OR(act(y(TGFB1R),rpar(:,62)),act(y(TNFaR),rpar(:,69)))*ymax(TRAF) - y(TRAF))/tau(TRAF); 
dydt(ASK1) = (OR(act(y(TRAF),rpar(:,70)),act(y(IL1RI),rpar(:,73)))*ymax(ASK1) - y(ASK1))/tau(ASK1); 
dydt(MKK3) = (act(y(ASK1),rpar(:,71))*ymax(MKK3) - y(MKK3))/tau(MKK3); 
dydt(PP1) = (act(y(p38),rpar(:,60))*ymax(PP1) - y(PP1))/tau(PP1); 
dydt(JNK) = (OR(act(y(ROS),rpar(:,28)),OR(AND(rpar(:,65),inhib(y(NFKB),rpar(:,65)),act(y(MKK4),rpar(:,65))),AND(rpar(:,84),inhib(y(Rho),rpar(:,84)),act(y(MKK4),rpar(:,84)))))*ymax(JNK) - y(JNK))/tau(JNK); 
dydt(abl) = (act(y(PDGFR),rpar(:,66))*ymax(abl) - y(abl))/tau(abl); 
dydt(Rac1) = (OR(act(y(abl),rpar(:,67)),AND(rpar(:,117),act(y(abl),rpar(:,117)),act(y(p130Cas),rpar(:,117))))*ymax(Rac1) - y(Rac1))/tau(Rac1); 
dydt(MEKK1) = (OR(act(y(FAK),rpar(:,50)),act(y(Rac1),rpar(:,63)))*ymax(MEKK1) - y(MEKK1))/tau(MEKK1); 
dydt(MKK4) = (OR(act(y(MEKK1),rpar(:,64)),act(y(ASK1),rpar(:,72)))*ymax(MKK4) - y(MKK4))/tau(MKK4); 
dydt(ERK) = (OR(AND(rpar(:,59),inhib(y(PP1),rpar(:,59)),act(y(MEK1),rpar(:,59))),AND(rpar(:,104),act(y(ROS),rpar(:,104)),inhib(y(AT2R),rpar(:,104))))*ymax(ERK) - y(ERK))/tau(ERK); 
dydt(Ras) = (OR(act(y(AT1R),rpar(:,86)),act(y(Grb2),rpar(:,113)))*ymax(Ras) - y(Ras))/tau(Ras); 
dydt(Raf) = (act(y(Ras),rpar(:,57))*ymax(Raf) - y(Raf))/tau(Raf); 
dydt(MEK1) = (AND(rpar(:,58),inhib(y(ERK),rpar(:,58)),act(y(Raf),rpar(:,58)))*ymax(MEK1) - y(MEK1))/tau(MEK1); 
dydt(FAK) = (act(y(B1int),rpar(:,111))*ymax(FAK) - y(FAK))/tau(FAK); 
dydt(epac) = (act(y(cAMP),rpar(:,51))*ymax(epac) - y(epac))/tau(epac); 
dydt(Factin) = (AND(rpar(:,124),act(y(ROCK),rpar(:,124)),act(y(Gactin),rpar(:,124)))*ymax(Factin) - y(Factin))/tau(Factin); 
dydt(FA) = (AND(rpar(:,130),act(y(vinculin),rpar(:,130)),inhib(y(paxillin),rpar(:,130)),act(y(CDK1),rpar(:,130)))*ymax(FA) - y(FA))/tau(FA); 
dydt(cmyc) = (act(y(JNK),rpar(:,68))*ymax(cmyc) - y(cmyc))/tau(cmyc); 
dydt(CTGF) = (OR(AND(rpar(:,176),act(y(CBP),rpar(:,176)),act(y(smad3),rpar(:,176)),act(y(ERK),rpar(:,176))),act(y(YAP),rpar(:,177)))*ymax(CTGF) - y(CTGF))/tau(CTGF); 
dydt(proliferation) = (OR(act(y(CDK1),rpar(:,142)),OR(act(y(AP1),rpar(:,143)),OR(act(y(CREB),rpar(:,144)),OR(act(y(CTGF),rpar(:,145)),OR(act(y(PKC),rpar(:,146)),OR(AND(rpar(:,147),act(y(p70S6K),rpar(:,147)),inhib(y(EBP1),rpar(:,147))),act(y(cmyc),rpar(:,148))))))))*ymax(proliferation) - y(proliferation))/tau(proliferation); 
dydt(SRF) = (act(y(MRTF),rpar(:,126))*ymax(SRF) - y(SRF))/tau(SRF); 
dydt(EDAFN) = (act(y(NFAT),rpar(:,169))*ymax(EDAFN) - y(EDAFN))/tau(EDAFN); 
dydt(aSMA) = (OR(act(y(YAP),rpar(:,179)),OR(AND(rpar(:,180),act(y(CBP),rpar(:,180)),act(y(smad3),rpar(:,180))),act(y(SRF),rpar(:,181))))*ymax(aSMA) - y(aSMA))/tau(aSMA); 
dydt(AP1) = (OR(act(y(ERK),rpar(:,36)),act(y(JNK),rpar(:,80)))*ymax(AP1) - y(AP1))/tau(AP1); 
dydt(TIMP1) = (act(y(AP1),rpar(:,159))*ymax(TIMP1) - y(TIMP1))/tau(TIMP1); 
dydt(TIMP2) = (act(y(AP1),rpar(:,160))*ymax(TIMP2) - y(TIMP2))/tau(TIMP2); 
dydt(PAI1) = (OR(act(y(smad3),rpar(:,161)),act(y(YAP),rpar(:,162)))*ymax(PAI1) - y(PAI1))/tau(PAI1); 
dydt(proMMP14) = (OR(act(y(AP1),rpar(:,154)),act(y(NFKB),rpar(:,155)))*ymax(proMMP14) - y(proMMP14))/tau(proMMP14); 
dydt(proMMP1) = (AND(rpar(:,149),inhib(y(smad3),rpar(:,149)),act(y(NFKB),rpar(:,149)),act(y(AP1),rpar(:,149)))*ymax(proMMP1) - y(proMMP1))/tau(proMMP1); 
dydt(proMMP2) = (OR(act(y(AP1),rpar(:,150)),act(y(STAT),rpar(:,151)))*ymax(proMMP2) - y(proMMP2))/tau(proMMP2); 
dydt(proMMP9) = (OR(act(y(STAT),rpar(:,152)),AND(rpar(:,153),act(y(NFKB),rpar(:,153)),act(y(AP1),rpar(:,153))))*ymax(proMMP9) - y(proMMP9))/tau(proMMP9); 
dydt(fibronectin) = (OR(AND(rpar(:,167),act(y(CBP),rpar(:,167)),act(y(smad3),rpar(:,167))),act(y(NFKB),rpar(:,168)))*ymax(fibronectin) - y(fibronectin))/tau(fibronectin); 
dydt(periostin) = (OR(AND(rpar(:,170),act(y(CBP),rpar(:,170)),act(y(smad3),rpar(:,170))),AND(rpar(:,171),act(y(CREB),rpar(:,171)),act(y(CBP),rpar(:,171))))*ymax(periostin) - y(periostin))/tau(periostin); 
dydt(proCI) = (OR(act(y(SRF),rpar(:,163)),AND(rpar(:,165),act(y(CBP),rpar(:,165)),act(y(smad3),rpar(:,165)),inhib(y(epac),rpar(:,165))))*ymax(proCI) - y(proCI))/tau(proCI); 
dydt(proCIII) = (OR(act(y(SRF),rpar(:,164)),AND(rpar(:,166),act(y(CBP),rpar(:,166)),act(y(smad3),rpar(:,166)),inhib(y(epac),rpar(:,166))))*ymax(proCIII) - y(proCIII))/tau(proCIII); 
dydt(B3int) = (OR(AND(rpar(:,194),act(y(tension),rpar(:,194)),inhib(y(thrombospondin4),rpar(:,194))),act(y(osteopontin),rpar(:,195)))*ymax(B3int) - y(B3int))/tau(B3int); 
dydt(Src) = (OR(act(y(PDGFR),rpar(:,93)),act(y(B3int),rpar(:,110)))*ymax(Src) - y(Src))/tau(Src); 
dydt(Grb2) = (AND(rpar(:,112),act(y(FAK),rpar(:,112)),act(y(Src),rpar(:,112)))*ymax(Grb2) - y(Grb2))/tau(Grb2); 
dydt(p130Cas) = (OR(AND(rpar(:,107),act(y(tension),rpar(:,107)),act(y(Src),rpar(:,107))),AND(rpar(:,116),act(y(FAK),rpar(:,116)),act(y(Src),rpar(:,116))))*ymax(p130Cas) - y(p130Cas))/tau(p130Cas); 
dydt(YAP) = (OR(act(y(AT1R),rpar(:,102)),act(y(Factin),rpar(:,118)))*ymax(YAP) - y(YAP))/tau(YAP); 
dydt(MRTF) = (AND(rpar(:,123),act(y(NFAT),rpar(:,123)),inhib(y(Gactin),rpar(:,123)))*ymax(MRTF) - y(MRTF))/tau(MRTF); 
dydt(Gactin) = (inhib(y(Factin),rpar(:,125))*ymax(Gactin) - y(Gactin))/tau(Gactin); 
dydt(TNC) = (OR(act(y(NFKB),rpar(:,172)),act(y(MRTF),rpar(:,173)))*ymax(TNC) - y(TNC))/tau(TNC); 
dydt(mTORC1) = (act(y(Akt),rpar(:,94))*ymax(mTORC1) - y(mTORC1))/tau(mTORC1); 
dydt(mTORC2) = (inhib(y(p70S6K),rpar(:,98))*ymax(mTORC2) - y(mTORC2))/tau(mTORC2); 
dydt(p70S6K) = (act(y(mTORC1),rpar(:,95))*ymax(p70S6K) - y(p70S6K))/tau(p70S6K); 
dydt(EBP1) = (inhib(y(mTORC1),rpar(:,96))*ymax(EBP1) - y(EBP1))/tau(EBP1); 
dydt(syndecan4) = (AND(rpar(:,196),act(y(tension),rpar(:,196)),inhib(y(TNC),rpar(:,196)))*ymax(syndecan4) - y(syndecan4))/tau(syndecan4); 
dydt(proMMP3) = (AND(rpar(:,157),inhib(y(smad3),rpar(:,157)),act(y(NFKB),rpar(:,157)),act(y(AP1),rpar(:,157)))*ymax(proMMP3) - y(proMMP3))/tau(proMMP3); 
dydt(proMMP8) = (AND(rpar(:,156),inhib(y(smad3),rpar(:,156)),act(y(NFKB),rpar(:,156)),act(y(AP1),rpar(:,156)))*ymax(proMMP8) - y(proMMP8))/tau(proMMP8); 
dydt(proMMP12) = (act(y(CREB),rpar(:,158))*ymax(proMMP12) - y(proMMP12))/tau(proMMP12); 
dydt(thrombospondin4) = (act(y(smad3),rpar(:,174))*ymax(thrombospondin4) - y(thrombospondin4))/tau(thrombospondin4); 
dydt(osteopontin) = (act(y(AP1),rpar(:,175))*ymax(osteopontin) - y(osteopontin))/tau(osteopontin); 
dydt(contractility) = (OR(AND(rpar(:,192),act(y(Factin),rpar(:,192)),act(y(MLC),rpar(:,192))),AND(rpar(:,193),act(y(aSMA),rpar(:,193)),act(y(MLC),rpar(:,193))))*ymax(contractility) - y(contractility))/tau(contractility); 
dydt(RhoGEF) = (AND(rpar(:,114),act(y(FAK),rpar(:,114)),act(y(Src),rpar(:,114)))*ymax(RhoGEF) - y(RhoGEF))/tau(RhoGEF); 
dydt(RhoGDI) = (OR(inhib(y(Src),rpar(:,115)),OR(act(y(PKA),rpar(:,119)),inhib(y(PKC),rpar(:,122))))*ymax(RhoGDI) - y(RhoGDI))/tau(RhoGDI); 
dydt(talin) = (OR(act(y(B1int),rpar(:,128)),act(y(B3int),rpar(:,129)))*ymax(talin) - y(talin))/tau(talin); 
dydt(vinculin) = (AND(rpar(:,197),act(y(contractility),rpar(:,197)),act(y(talin),rpar(:,197)))*ymax(vinculin) - y(vinculin))/tau(vinculin); 
dydt(paxillin) = (AND(rpar(:,127),act(y(FAK),rpar(:,127)),act(y(Src),rpar(:,127)),act(y(MLC),rpar(:,127)))*ymax(paxillin) - y(paxillin))/tau(paxillin); 
dydt(MLC) = (act(y(ROCK),rpar(:,131))*ymax(MLC) - y(MLC))/tau(MLC); 
dydt(AT2R) = (act(y(AngII),rpar(:,103))*ymax(AT2R) - y(AT2R))/tau(AT2R); 
dydt(E2) = (act(y(E2in),rpar(:,22))*ymax(E2) - y(E2))/tau(E2); 
dydt(E2in) = (rpar(1,11)*ymax(E2in) - y(E2in))/tau(E2in); 
dydt(ERX) = (act(y(E2),rpar(:,132))*ymax(ERX) - y(ERX))/tau(ERX); 
dydt(ERB) = (act(y(E2),rpar(:,133))*ymax(ERB) - y(ERB))/tau(ERB); 
dydt(GPR30) = (act(y(E2),rpar(:,134))*ymax(GPR30) - y(GPR30))/tau(GPR30); 
dydt(CyclinB1) = (inhib(y(GPR30),rpar(:,138))*ymax(CyclinB1) - y(CyclinB1))/tau(CyclinB1); 
dydt(CDK1) = (AND(rpar(:,139),act(y(AngII),rpar(:,139)),act(y(CyclinB1),rpar(:,139)))*ymax(CDK1) - y(CDK1))/tau(CDK1); 
dydt(LOX) = (act(y(Akt),rpar(:,178))*ymax(LOX) - y(LOX))/tau(LOX); 

% utility functions 
function fact = act(x,rpar) 
% hill activation function with parameters w (weight), n (Hill coeff), EC50 
    w = rpar(1); 
    n = rpar(2); 
    EC50 = rpar(3); 
    beta = (EC50.^n - 1)./(2*EC50.^n - 1); 
    K = (beta - 1).^(1./n); 
    fact = w.*(beta.*x.^n)./(K.^n + x.^n); 
    if fact>w,                 % cap fact(x)<= 1 
        fact = w; 
    end
 
function finhib = inhib(x,rpar) 
% inverse hill function with parameters w (weight), n (Hill coeff), EC50 
    finhib = rpar(1) - act(x,rpar);
 
function z = OR(x,y) 
% OR logic gate 
    z = x + y - x*y;
 
function z = AND(rpar,varargin) 
% AND logic gate, multiplying all of the reactants together 
    w = rpar(1); 
    if w == 0, 
        z = 0; 
    else 
        v = cell2mat(varargin); 
        z = prod(v)/w^(nargin-2);  
    end 

