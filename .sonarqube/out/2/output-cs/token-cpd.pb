ˇ;
xC:\Users\amazi\OneDrive\Documents\Personal\SBA\athlete-app-backend\AthleteEventAPI\Controllers\AthleteEventController.cs
	namespace 	
AthleteEventAPI
 
. 
Controllers %
{ 
[ 
Route 

(
 
$str 
) 
] 
[ 
ApiController 
] 
public 

class "
AthleteEventController '
:( )
ControllerBase* 8
{ 
private 
readonly  
IAthleteEventService -
service. 5
;5 6
public "
AthleteEventController %
(% & 
IAthleteEventService& :
_service; C
)C D
{ 	
service 
= 
_service 
; 
} 	
[ 	
HttpPost	 
( 
$str )
)) *
]* +
[ 	
	Authorize	 
( 
Roles 
= 
$str '
)' (
]( )
public 
IActionResult 
Register %
(% &
AthleteEvent& 2
athleteEvent3 ?
)? @
{ 	
try 
{ 
return 
Ok 
( 
service !
.! "
Register" *
(* +
athleteEvent+ 7
)7 8
)8 9
;9 :
} 
catch   
(   )
AthleteEventNotFoundException   0
e  1 2
)  2 3
{!! 
return"" 
NotFound"" 
(""  
e""  !
.""! "
Message""" )
)"") *
;""* +
}## 
catch$$ 
($$ 
	Exception$$ 
e$$ 
)$$ 
{%% 
return&& 

BadRequest&& !
(&&! "
e&&" #
.&&# $
Message&&$ +
)&&+ ,
;&&, -
}'' 
}(( 	
[** 	
HttpPost**	 
(** 
$str** !
)**! "
]**" #
[++ 	
	Authorize++	 
(++ 
Roles++ 
=++ 
$str++ "
)++" #
]++# $
public,, 
IActionResult,, 
Add,,  
(,,  !
AthleteEvent,,! -
athleteEvent,,. :
),,: ;
{-- 	
try.. 
{// 
return00 
Ok00 
(00 
service00 !
.00! "
Add00" %
(00% &
athleteEvent00& 2
)002 3
)003 4
;004 5
}11 
catch22 
(22 .
"AthleteEventAlreadyExistsException22 5
e226 7
)227 8
{33 
return44 
Conflict44 
(44  
e44  !
.44! "
Message44" )
)44) *
;44* +
}55 
catch66 
(66 
	Exception66 
e66 
)66 
{77 
return88 

BadRequest88 !
(88! "
e88" #
.88# $
Message88$ +
)88+ ,
;88, -
}99 
}:: 	
[<< 	
HttpGet<<	 
(<< 
$str<< #
)<<# $
]<<$ %
[== 	
	Authorize==	 
(== 
Roles== 
=== 
$str== '
)==' (
]==( )
public>> 
IActionResult>> 
AllAthleteEvents>> -
(>>- .
)>>. /
{?? 	
try@@ 
{AA 
returnBB 
OkBB 
(BB 
serviceBB !
.BB! "
AllAthleteEventsBB" 2
(BB2 3
)BB3 4
)BB4 5
;BB5 6
}CC 
catchDD 
(DD 
	ExceptionDD 
eDD 
)DD 
{EE 
returnFF 

BadRequestFF !
(FF! "
eFF" #
.FF# $
MessageFF$ +
)FF+ ,
;FF, -
}GG 
}HH 	
[JJ 	
HttpGetJJ	 
(JJ 
$strJJ  
)JJ  !
]JJ! "
[KK 	
	AuthorizeKK	 
(KK 
RolesKK 
=KK 
$strKK '
)KK' (
]KK( )
publicLL 
IActionResultLL 
SearchLL #
(LL# $
stringLL$ *
nameLL+ /
)LL/ 0
{MM 	
tryNN 
{OO 
returnPP 
OkPP 
(PP 
servicePP !
.PP! "
SearchPP" (
(PP( )
namePP) -
)PP- .
)PP. /
;PP/ 0
}QQ 
catchRR 
(RR )
AthleteEventNotFoundExceptionRR 0
eRR1 2
)RR2 3
{SS 
returnTT 
NotFoundTT 
(TT  
eTT  !
.TT! "
MessageTT" )
)TT) *
;TT* +
}UU 
catchVV 
(VV 
	ExceptionVV 
eVV 
)VV 
{WW 
returnXX 

BadRequestXX !
(XX! "
eXX" #
.XX# $
MessageXX$ +
)XX+ ,
;XX, -
}YY 
}ZZ 	
[\\ 	

HttpDelete\\	 
(\\ 
$str\\ 5
)\\5 6
]\\6 7
[]] 	
	Authorize]]	 
(]] 
Roles]] 
=]] 
$str]] "
)]]" #
]]]# $
public^^ 
IActionResult^^ $
DeleteAthleteEventByName^^ 5
(^^5 6
string^^6 <
name^^= A
)^^A B
{__ 	
try`` 
{aa 
returnbb 
Okbb 
(bb 
servicebb !
.bb! "$
DeleteAthleteEventByNamebb" :
(bb: ;
namebb; ?
)bb? @
)bb@ A
;bbA B
}cc 
catchdd 
(dd )
AthleteEventNotFoundExceptiondd 0
edd1 2
)dd2 3
{ee 
returnff 
NotFoundff 
(ff  
eff  !
.ff! "
Messageff" )
)ff) *
;ff* +
}gg 
catchhh 
(hh 
	Exceptionhh 
ehh 
)hh 
{ii 
returnjj 

BadRequestjj !
(jj! "
ejj" #
.jj# $
Messagejj$ +
)jj+ ,
;jj, -
}kk 
}ll 	
[nn 	
HttpPutnn	 
(nn 
$strnn +
)nn+ ,
]nn, -
[oo 	
	Authorizeoo	 
(oo 
Rolesoo 
=oo 
$stroo "
)oo" #
]oo# $
publicpp 
IActionResultpp 
BlockAthleteEventpp .
(pp. /
stringpp/ 5
namepp6 :
)pp: ;
{qq 	
tryrr 
{ss 
returntt 
Oktt 
(tt 
servicett !
.tt! "
BlockAthleteEventtt" 3
(tt3 4
namett4 8
)tt8 9
)tt9 :
;tt: ;
}uu 
catchvv 
(vv )
AthleteEventNotFoundExceptionvv 0
evv1 2
)vv2 3
{ww 
returnxx 
NotFoundxx 
(xx  
exx  !
.xx! "
Messagexx" )
)xx) *
;xx* +
}yy 
catchzz 
(zz 
	Exceptionzz 
ezz 
)zz 
{{{ 
return|| 

BadRequest|| !
(||! "
e||" #
.||# $
Message||$ +
)||+ ,
;||, -
}}} 
}~~ 	
}
ÄÄ 
}ÅÅ ë
ÉC:\Users\amazi\OneDrive\Documents\Personal\SBA\athlete-app-backend\AthleteEventAPI\Exceptions\AthleteEventAlreadyExistsException.cs
	namespace 	
AthleteEventAPI
 
. 

Exceptions $
{ 
public 

class .
"AthleteEventAlreadyExistsException 3
:4 5
	Exception6 ?
{		 
public

 .
"AthleteEventAlreadyExistsException

 1
(

1 2
string

2 8
message

9 @
)

@ A
:

B C
base

D H
(

H I
message

I P
)

P Q
{ 	
} 	
} 
} Å
~C:\Users\amazi\OneDrive\Documents\Personal\SBA\athlete-app-backend\AthleteEventAPI\Exceptions\AthleteEventNotFoundException.cs
	namespace 	
AthleteEventAPI
 
. 

Exceptions $
{ 
public 

class )
AthleteEventNotFoundException .
:/ 0
	Exception1 :
{		 
public

 )
AthleteEventNotFoundException

 ,
(

, -
string

- 3
message

4 ;
)

; <
:

= >
base

? C
(

C D
message

D K
)

K L
{ 	
} 	
} 
} π

iC:\Users\amazi\OneDrive\Documents\Personal\SBA\athlete-app-backend\AthleteEventAPI\Models\AthleteEvent.cs
	namespace 	
AthleteEventAPI
 
. 
Models  
{		 
public

 

class

 
AthleteEvent

 
{ 
[ 	
BsonId	 
] 
public 
int 
Id 
{ 
get 
; 
set  
;  !
}" #
public 
string 
Name 
{ 
get  
;  !
set" %
;% &
}' (
public 
string 
Logo 
{ 
get  
;  !
set" %
;% &
}' (
public 
string 
	ContactNo 
{  !
get" %
;% &
set' *
;* +
}, -
public 
string 
ContactAddress $
{% &
get' *
;* +
set, /
;/ 0
}1 2
public 
bool 
	IsBlocked 
{ 
get  #
;# $
set% (
;( )
}* +
=, -
false. 3
;3 4
} 
} ¶
pC:\Users\amazi\OneDrive\Documents\Personal\SBA\athlete-app-backend\AthleteEventAPI\Models\AthleteEventContext.cs
	namespace		 	
AthleteEventAPI		
 
.		 
Models		  
{

 
public 

class 
AthleteEventContext $
{ 
MongoClient 
client 
; 
IMongoDatabase 
db 
; 
public 
AthleteEventContext "
(" #
IConfiguration# 1
configuration2 ?
)? @
{ 	
client 
= 
new 
MongoClient $
($ %
Environment% 0
.0 1"
GetEnvironmentVariable1 G
(G H
$strH \
)\ ]
)] ^
;^ _
db 
= 
client 
. 
GetDatabase #
(# $
Environment$ /
./ 0"
GetEnvironmentVariable0 F
(F G
$strG U
)U V
)V W
;W X
} 	
public 
IMongoCollection 
<  
AthleteEvent  ,
>, -
AthleteEvents. ;
=>< >
db? A
.A B
GetCollectionB O
<O P
AthleteEventP \
>\ ]
(] ^
$str^ m
)m n
;n o
} 
} ∫

]C:\Users\amazi\OneDrive\Documents\Personal\SBA\athlete-app-backend\AthleteEventAPI\Program.cs
	namespace

 	
AthleteEventAPI


 
{ 
public 

class 
Program 
{ 
public 
static 
void 
Main 
(  
string  &
[& '
]' (
args) -
)- .
{ 	
CreateHostBuilder 
( 
args "
)" #
.# $
Build$ )
() *
)* +
.+ ,
Run, /
(/ 0
)0 1
;1 2
} 	
public 
static 
IHostBuilder "
CreateHostBuilder# 4
(4 5
string5 ;
[; <
]< =
args> B
)B C
=>D F
Host 
.  
CreateDefaultBuilder %
(% &
args& *
)* +
. $
ConfigureWebHostDefaults )
() *

webBuilder* 4
=>5 7
{ 

webBuilder 
. 

UseStartup )
<) *
Startup* 1
>1 2
(2 3
)3 4
;4 5
} 
) 
; 
} 
} ﬁ2
wC:\Users\amazi\OneDrive\Documents\Personal\SBA\athlete-app-backend\AthleteEventAPI\Repository\AthleteEventRepository.cs
	namespace 	
AthleteEventAPI
 
. 

Repository $
{		 
public

 

class

 "
AthleteEventRepository

 '
:

( )#
IAthleteEventRepository

* A
{ 
private 
readonly 
AthleteEventContext ,
context- 4
;4 5
public "
AthleteEventRepository %
(% &
AthleteEventContext& 9
_context: B
)B C
{ 	
context 
= 
_context 
; 
} 	
public 
bool 
Add 
( 
AthleteEvent $
athleteEvent% 1
)1 2
{ 	
var 
res 
= 
Search 
( 
athleteEvent )
.) *
Name* .
). /
;/ 0
if 
( 
res 
== 
null 
) 
{ 
var 
topAthleteEvent #
=$ %
context& -
.- .
AthleteEvents. ;
.; <
Find< @
(@ A
xA B
=>C E
trueF J
)J K
.K L
SortByDescendingL \
(\ ]
x] ^
=>_ a
xb c
.c d
Idd f
)f g
.g h
FirstOrDefaulth v
(v w
)w x
;x y
if 
( 
topAthleteEvent #
==$ &
null' +
)+ ,
{ 
athleteEvent  
.  !
Id! #
=$ %
$num& *
;* +
} 
else 
{ 
athleteEvent  
.  !
Id! #
=$ %
topAthleteEvent& 5
.5 6
Id6 8
+9 :
$num; <
;< =
} 
context 
. 
AthleteEvents %
.% &
	InsertOne& /
(/ 0
athleteEvent0 <
)< =
;= >
return   
true   
;   
}!! 
return"" 
false"" 
;"" 
}## 	
public%% 
List%% 
<%% 
AthleteEvent%%  
>%%  !
AllAthleteEvents%%" 2
(%%2 3
)%%3 4
{&& 	
return'' 
context'' 
.'' 
AthleteEvents'' (
.''( )
Find'') -
(''- .
x''. /
=>''0 2
true''3 7
)''7 8
.''8 9
ToList''9 ?
(''? @
)''@ A
;''A B
}(( 	
public** 
bool** 
BlockAthleteEvent** %
(**% &
string**& ,
name**- 1
)**1 2
{++ 	
var,, 
res,, 
=,, 
Search,, 
(,, 
name,, !
),,! "
;,," #
if-- 
(-- 
res-- 
!=-- 
null-- 
)-- 
{.. 
var// 
filter// 
=// 
Builders// %
<//% &
AthleteEvent//& 2
>//2 3
.//3 4
Filter//4 :
.//: ;
Where//; @
(//@ A
x//A B
=>//C E
x//F G
.//G H
Name//H L
.//L M
Equals//M S
(//S T
name//T X
)//X Y
)//Y Z
;//Z [
var00 
update00 
=00 
Builders00 %
<00% &
AthleteEvent00& 2
>002 3
.003 4
Update004 :
.00: ;
Set00; >
(00> ?
x00? @
=>00A C
x00D E
.00E F
	IsBlocked00F O
,00O P
true00Q U
)00U V
;00V W
context11 
.11 
AthleteEvents11 %
.11% &
	UpdateOne11& /
(11/ 0
filter110 6
,116 7
update118 >
)11> ?
;11? @
return22 
true22 
;22 
}33 
return44 
false44 
;44 
}55 	
public77 
bool77 $
DeleteAthleteEventByName77 ,
(77, -
string77- 3
name774 8
)778 9
{88 	
var99 
res99 
=99 
Search99 
(99 
name99 !
)99! "
;99" #
if:: 
(:: 
res:: 
!=:: 
null:: 
):: 
{;; 
context<< 
.<< 
AthleteEvents<< %
.<<% &
	DeleteOne<<& /
(<</ 0
x<<0 1
=><<1 3
x<<3 4
.<<4 5
Name<<5 9
.<<9 :
Equals<<: @
(<<@ A
name<<A E
)<<E F
)<<F G
;<<G H
return== 
true== 
;== 
}>> 
return?? 
false?? 
;?? 
}@@ 	
publicBB 
boolBB 
RegisterBB 
(BB 
AthleteEventBB )
athleteEventBB* 6
)BB6 7
{CC 	
varDD 
resDD 
=DD 
SearchDD 
(DD 
athleteEventDD )
.DD) *
NameDD* .
)DD. /
;DD/ 0
ifEE 
(EE 
resEE 
!=EE 
nullEE 
&&EE 
resEE "
.EE" #
	IsBlockedEE# ,
==EE- /
falseEE0 5
)EE5 6
{FF 
returnGG 
trueGG 
;GG 
}HH 
returnII 
falseII 
;II 
}JJ 	
publicLL 
AthleteEventLL 
SearchLL "
(LL" #
stringLL# )
nameLL* .
)LL. /
{MM 	
returnNN 
contextNN 
.NN 
AthleteEventsNN (
.NN( )
FindNN) -
(NN- .
xNN. /
=>NN0 2
xNN3 4
.NN4 5
NameNN5 9
.NN9 :
EqualsNN: @
(NN@ A
nameNNA E
)NNE F
)NNF G
.NNG H
FirstOrDefaultNNH V
(NNV W
)NNW X
;NNX Y
}OO 	
}PP 
}QQ ç	
xC:\Users\amazi\OneDrive\Documents\Personal\SBA\athlete-app-backend\AthleteEventAPI\Repository\IAthleteEventRepository.cs
	namespace 	
AthleteEventAPI
 
. 

Repository $
{ 
public		 

	interface		 #
IAthleteEventRepository		 ,
{

 
bool 
Register 
( 
AthleteEvent "
athleteEvent# /
)/ 0
;0 1
bool 
Add 
( 
AthleteEvent 
athleteEvent *
)* +
;+ ,
List 
< 
AthleteEvent 
> 
AllAthleteEvents +
(+ ,
), -
;- .
AthleteEvent 
Search 
( 
string "
name# '
)' (
;( )
bool $
DeleteAthleteEventByName %
(% &
string& ,
name- 1
)1 2
;2 3
bool 
BlockAthleteEvent 
( 
string %
name& *
)* +
;+ ,
} 
} ù&
nC:\Users\amazi\OneDrive\Documents\Personal\SBA\athlete-app-backend\AthleteEventAPI\ServiceRegistryExtension.cs
	namespace		 	
AthleteEventAPI		
 
{

 
public 

static 
class $
ServiceRegistryExtension 0
{ 
public 
static 
IServiceCollection (
AddConsulConfig) 8
(8 9
this9 =
IServiceCollection> P
servicesQ Y
,Y Z
IConfiguration[ i!
configurationSettingsj 
)	 Ä
{ 	
services 
. 
AddSingleton !
<! "
IConsulClient" /
,/ 0
ConsulClient1 =
>= >
(> ?
p? @
=>A C
newD G
ConsulClientH T
(T U
consulConfigU a
=>b d
{ 
consulConfig 
. 
Address $
=% &
new' *
Uri+ .
(. /
Environment/ :
.: ;"
GetEnvironmentVariable; Q
(Q R
$strR a
)a b
)b c
;c d
} 
) 
) 
; 
return 
services 
; 
} 	
public 
static 
IApplicationBuilder )
	UseConsul* 3
(3 4
this4 8
IApplicationBuilder9 L
appM P
,P Q
IConfigurationR `!
configirationSettingsa v
)v w
{ 	
var 
consulClient 
= 
app "
." #
ApplicationServices# 6
.6 7
GetRequiredService7 I
<I J
IConsulClientJ W
>W X
(X Y
)Y Z
;Z [
var 
logger 
= 
app 
. 
ApplicationServices 0
.0 1
GetRequiredService1 C
<C D
ILoggerFactoryD R
>R S
(S T
)T U
.U V
CreateLoggerV b
(b c
$strc q
)q r
;r s
var 
lifetime 
= 
app 
. 
ApplicationServices 2
.2 3
GetRequiredService3 E
<E F$
IHostApplicationLifetimeF ^
>^ _
(_ `
)` a
;a b
var 
registration 
= 
new "$
AgentServiceRegistration# ;
(; <
)< =
{ 
ID## 
=## 
Environment##  
.##  !"
GetEnvironmentVariable##! 7
(##7 8
$str##8 K
)##K L
,##L M
Name$$ 
=$$ 
Environment$$ "
.$$" #"
GetEnvironmentVariable$$# 9
($$9 :
$str$$: M
)$$M N
,$$N O
Address%% 
=%% 
Environment%% %
.%%% &"
GetEnvironmentVariable%%& <
(%%< =
$str%%= P
)%%P Q
,%%Q R
Port&& 
=&& 
int&& 
.&& 
Parse&&  
(&&  !
Environment&&! ,
.&&, -"
GetEnvironmentVariable&&- C
(&&C D
$str&&D W
)&&W X
)&&X Y
}(( 
;(( 
logger** 
.** 
LogInformation** !
(**! "
$str**" ;
)**; <
;**< =
consulClient++ 
.++ 
Agent++ 
.++ 
ServiceDeregister++ 0
(++0 1
registration++1 =
.++= >
ID++> @
)++@ A
.++A B
ConfigureAwait++B P
(++P Q
true++Q U
)++U V
;++V W
consulClient,, 
.,, 
Agent,, 
.,, 
ServiceRegister,, .
(,,. /
registration,,/ ;
),,; <
.,,< =
ConfigureAwait,,= K
(,,K L
true,,L P
),,P Q
;,,Q R
lifetime.. 
... 
ApplicationStopped.. '
...' (
Register..( 0
(..0 1
(..1 2
)..2 3
=>..4 6
{// 
logger00 
.00 
LogInformation00 %
(00% &
$str00& G
)00G H
;00H I
consulClient11 
.11 
Agent11 "
.11" #
ServiceDeregister11# 4
(114 5
registration115 A
.11A B
ID11B D
)11D E
.11E F
ConfigureAwait11F T
(11T U
true11U Y
)11Y Z
;11Z [
}22 
)22 
;22 
return44 
app44 
;44 
}55 	
}66 
}77 „)
qC:\Users\amazi\OneDrive\Documents\Personal\SBA\athlete-app-backend\AthleteEventAPI\Service\AthleteEventService.cs
	namespace		 	
AthleteEventAPI		
 
.		 
Service		 !
{

 
public 

class 
AthleteEventService $
:% & 
IAthleteEventService' ;
{ 
private 
readonly #
IAthleteEventRepository 0
repo1 5
;5 6
public 
AthleteEventService "
(" ##
IAthleteEventRepository# :
_repo; @
)@ A
{ 	
repo 
= 
_repo 
; 
} 	
public 
bool 
Add 
( 
AthleteEvent $
athleteEvent% 1
)1 2
{ 	
var 
res 
= 
repo 
. 
Search !
(! "
athleteEvent" .
.. /
Name/ 3
)3 4
;4 5
if 
( 
res 
!= 
null 
) 
{ 
throw 
new .
"AthleteEventAlreadyExistsException <
(< =
$"= ?
$str? W
{W X
athleteEventX d
.d e
Namee i
}i j
$strj z
"z {
){ |
;| }
} 
return 
repo 
. 
Add 
( 
athleteEvent (
)( )
;) *
} 	
public 
List 
< 
AthleteEvent  
>  !
AllAthleteEvents" 2
(2 3
)3 4
{ 	
return 
repo 
. 
AllAthleteEvents (
(( )
)) *
;* +
}   	
public"" 
bool"" 
BlockAthleteEvent"" %
(""% &
string""& ,
name""- 1
)""1 2
{## 	
var$$ 
res$$ 
=$$ 
repo$$ 
.$$ 
Search$$ !
($$! "
name$$" &
)$$& '
;$$' (
if%% 
(%% 
res%% 
==%% 
null%% 
)%% 
{&& 
throw'' 
new'' )
AthleteEventNotFoundException'' 7
(''7 8
$"''8 :
$str'': R
{''R S
name''S W
}''W X
$str''X h
"''h i
)''i j
;''j k
}(( 
return)) 
repo)) 
.)) 
BlockAthleteEvent)) )
())) *
name))* .
))). /
;))/ 0
}** 	
public,, 
bool,, $
DeleteAthleteEventByName,, ,
(,,, -
string,,- 3
name,,4 8
),,8 9
{-- 	
var.. 
res.. 
=.. 
repo.. 
... 
Search.. !
(..! "
name.." &
)..& '
;..' (
if// 
(// 
res// 
==// 
null// 
)// 
{00 
throw11 
new11 )
AthleteEventNotFoundException11 7
(117 8
$"118 :
$str11: R
{11R S
name11S W
}11W X
$str11X h
"11h i
)11i j
;11j k
}22 
return33 
repo33 
.33 $
DeleteAthleteEventByName33 0
(330 1
name331 5
)335 6
;336 7
}44 	
public66 
bool66 
Register66 
(66 
AthleteEvent66 )
athleteEvent66* 6
)666 7
{77 	
var88 
res88 
=88 
repo88 
.88 
Search88 !
(88! "
athleteEvent88" .
.88. /
Name88/ 3
)883 4
;884 5
if99 
(99 
res99 
==99 
null99 
)99 
{:: 
throw;; 
new;; )
AthleteEventNotFoundException;; 7
(;;7 8
$";;8 :
$str;;: R
{;;R S
athleteEvent;;S _
.;;_ `
Name;;` d
};;d e
$str;;e u
";;u v
);;v w
;;;w x
}<< 
return== 
repo== 
.== 
Register==  
(==  !
athleteEvent==! -
)==- .
;==. /
}>> 	
public@@ 
AthleteEvent@@ 
Search@@ "
(@@" #
string@@# )
name@@* .
)@@. /
{AA 	
varBB 
resBB 
=BB 
repoBB 
.BB 
SearchBB !
(BB! "
nameBB" &
)BB& '
;BB' (
ifCC 
(CC 
resCC 
==CC 
nullCC 
)CC 
{DD 
throwEE 
newEE )
AthleteEventNotFoundExceptionEE 7
(EE7 8
$"EE8 :
$strEE: R
{EER S
nameEES W
}EEW X
$strEEX h
"EEh i
)EEi j
;EEj k
}FF 
returnGG 
resGG 
;GG 
}HH 	
}II 
}JJ Å	
rC:\Users\amazi\OneDrive\Documents\Personal\SBA\athlete-app-backend\AthleteEventAPI\Service\IAthleteEventService.cs
	namespace 	
AthleteEventAPI
 
. 
Service !
{ 
public		 

	interface		  
IAthleteEventService		 )
{

 
bool 
Register 
( 
AthleteEvent "
athleteEvent# /
)/ 0
;0 1
bool 
Add 
( 
AthleteEvent 
athleteEvent *
)* +
;+ ,
List 
< 
AthleteEvent 
> 
AllAthleteEvents +
(+ ,
), -
;- .
AthleteEvent 
Search 
( 
string "
name# '
)' (
;( )
bool $
DeleteAthleteEventByName %
(% &
string& ,
name- 1
)1 2
;2 3
bool 
BlockAthleteEvent 
( 
string %
name& *
)* +
;+ ,
} 
} ∫-
]C:\Users\amazi\OneDrive\Documents\Personal\SBA\athlete-app-backend\AthleteEventAPI\Startup.cs
	namespace 	
AthleteEventAPI
 
{ 
public 

class 
Startup 
{ 
public 
Startup 
( 
IConfiguration %
configuration& 3
)3 4
{ 	
Configuration 
= 
configuration )
;) *
} 	
public 
IConfiguration 
Configuration +
{, -
get. 1
;1 2
}3 4
public   
void   
ConfigureServices   %
(  % &
IServiceCollection  & 8
services  9 A
)  A B
{!! 	
services"" 
."" 
AddConsulConfig"" $
(""$ %
Configuration""% 2
)""2 3
;""3 4
services## 
.## 
AddControllers## #
(### $
)##$ %
.##% &
AddNewtonsoftJson##& 7
(##7 8
)##8 9
;##9 :
services&& 
.&& 
	AddScoped&& 
<&& 
AthleteEventContext&& 2
>&&2 3
(&&3 4
)&&4 5
;&&5 6
services'' 
.'' 
	AddScoped'' 
<'' #
IAthleteEventRepository'' 6
,''6 7"
AthleteEventRepository''8 N
>''N O
(''O P
)''P Q
;''Q R
services(( 
.(( 
	AddScoped(( 
<((  
IAthleteEventService(( 3
,((3 4
AthleteEventService((5 H
>((H I
(((I J
)((J K
;((K L
var++ 
key++ 
=++ 
new++  
SymmetricSecurityKey++ .
(++. /
Encoding++/ 7
.++7 8
UTF8++8 <
.++< =
GetBytes++= E
(++E F
$str++F c
)++c d
)++d e
;++e f
services,, 
.,, 
AddAuthentication,, &
(,,& '
options,,' .
=>,,/ 1
{-- 
options.. 
... %
DefaultAuthenticateScheme.. 1
=..2 3
JwtBearerDefaults..4 E
...E F 
AuthenticationScheme..F Z
;..Z [
options// 
.// "
DefaultChallengeScheme// .
=/// 0
JwtBearerDefaults//1 B
.//B C 
AuthenticationScheme//C W
;//W X
}00 
)00 
.00 
AddJwtBearer00 
(00 
o00 
=>00  
o00! "
.00" #%
TokenValidationParameters00# <
=00= >
new00? B%
TokenValidationParameters00C \
(00\ ]
)00] ^
{11 $
ValidateIssuerSigningKey22 (
=22) *
true22+ /
,22/ 0
IssuerSigningKey33  
=33! "
key33# &
,33& '
ValidateIssuer55 
=55  
true55! %
,55% &
ValidIssuer66 
=66 
$str66 '
,66' (
ValidateAudience88  
=88! "
true88# '
,88' (
ValidAudience99 
=99 
$str99  ,
}:: 
):: 
;:: 
services== 
.== 
AddCors== 
(== 
options== $
=>==% '
options==( /
.==/ 0
	AddPolicy==0 9
(==9 :
$str==: J
,==J K
policy==L R
=>==S U
policy==V \
.==\ ]
AllowAnyOrigin==] k
(==k l
)==l m
.==m n
AllowAnyHeader==n |
(==| }
)==} ~
.==~ 
AllowAnyMethod	== ç
(
==ç é
)
==é è
)
==è ê
)
==ê ë
;
==ë í
services@@ 
.@@ 
AddSwaggerGen@@ "
(@@" #
)@@# $
;@@$ %
}AA 	
publicDD 
voidDD 
	ConfigureDD 
(DD 
IApplicationBuilderDD 1
appDD2 5
,DD5 6
IWebHostEnvironmentDD7 J
envDDK N
)DDN O
{EE 	
ifFF 
(FF 
envFF 
.FF 
IsDevelopmentFF !
(FF! "
)FF" #
)FF# $
{GG 
appHH 
.HH %
UseDeveloperExceptionPageHH -
(HH- .
)HH. /
;HH/ 0
}II 
appKK 
.KK 
UseHttpsRedirectionKK #
(KK# $
)KK$ %
;KK% &
appMM 
.MM 
	UseConsulMM 
(MM 
ConfigurationMM '
)MM' (
;MM( )
appOO 
.OO 
UseCorsOO 
(OO 
$strOO (
)OO( )
;OO) *
appQQ 
.QQ 

UseSwaggerQQ 
(QQ 
)QQ 
;QQ 
appSS 
.SS 
UseSwaggerUISS 
(SS 
optionsSS $
=>SS% '
optionsSS( /
.SS/ 0
SwaggerEndpointSS0 ?
(SS? @
$strSS@ Z
,SSZ [
$strSS\ p
)SSp q
)SSq r
;SSr s
appUU 
.UU 

UseRoutingUU 
(UU 
)UU 
;UU 
appWW 
.WW 
UseAuthenticationWW !
(WW! "
)WW" #
.WW# $
UseAuthorizationWW$ 4
(WW4 5
)WW5 6
;WW6 7
appYY 
.YY 
UseEndpointsYY 
(YY 
	endpointsYY &
=>YY' )
{ZZ 
	endpoints[[ 
.[[ 
MapControllers[[ (
([[( )
)[[) *
;[[* +
}\\ 
)\\ 
;\\ 
}]] 	
}^^ 
}__ 