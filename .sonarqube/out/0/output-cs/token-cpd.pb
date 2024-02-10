û&
nC:\Users\amazi\OneDrive\Documents\Personal\SBA\athlete-app-backend\BookingAPI\Controllers\BookingController.cs
	namespace 	

BookingAPI
 
. 
Controllers  
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
] 
[ 
	Authorize 
( 
Roles 
= 
$str #
)# $
]$ %
public 

class 
BookingController "
:# $
ControllerBase% 3
{ 
private 
readonly 
IBookingService (
service) 0
;0 1
public 
BookingController  
(  !
IBookingService! 0
_service1 9
)9 :
{ 	
service 
= 
_service 
; 
} 	
[ 	
HttpPost	 
( 
$str 
) 
]  
public 
IActionResult 

Addbooking '
(' (
Booking( /
booking0 7
)7 8
{ 	
try 
{ 
return 
Ok 
( 
service !
.! "

AddBooking" ,
(, -
booking- 4
)4 5
)5 6
;6 7
} 
catch   
(   )
BookingAlreadyExistsException   0
e  1 2
)  2 3
{!! 
return"" 
Conflict"" 
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
[++ 	
HttpGet++	 
(++ 
$str++ "
)++" #
]++# $
public,, 
IActionResult,, 
History,, $
(,,$ %
string,,% +
email,,, 1
),,1 2
{-- 	
try.. 
{// 
return00 
Ok00 
(00 
service00 !
.00! "
History00" )
(00) *
email00* /
)00/ 0
)000 1
;001 2
}11 
catch22 
(22 $
BookingNotFoundException22 +
e22, -
)22- .
{33 
return44 
NotFound44 
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
[== 	

HttpDelete==	 
(== 
$str== %
)==% &
]==& '
public>> 
IActionResult>> 
Cancel>> #
(>># $
int>>$ '
id>>( *
,>>* +
Booking>>, 3
booking>>4 ;
)>>; <
{?? 	
try@@ 
{AA 
returnBB 
OkBB 
(BB 
serviceBB !
.BB! "
CancelBB" (
(BB( )
idBB) +
,BB+ ,
bookingBB- 4
)BB4 5
)BB5 6
;BB6 7
}CC 
catchDD 
(DD $
BookingNotFoundExceptionDD +
eDD, -
)DD- .
{EE 
returnFF 
NotFoundFF 
(FF  
eFF  !
.FF! "
MessageFF" )
)FF) *
;FF* +
}GG 
catchHH 
(HH 
	ExceptionHH 
eHH 
)HH 
{II 
returnJJ 

BadRequestJJ !
(JJ! "
eJJ" #
.JJ# $
MessageJJ$ +
)JJ+ ,
;JJ, -
}KK 
}LL 	
[OO 	
HttpGetOO	 
(OO 
$strOO !
)OO! "
]OO" #
publicPP 
IActionResultPP 
GetAllBookingsPP +
(PP+ ,
)PP, -
{QQ 	
tryRR 
{SS 
returnTT 
OkTT 
(TT 
serviceTT !
.TT! "
GetAllBookingsTT" 0
(TT0 1
)TT1 2
)TT2 3
;TT3 4
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
}\\ 
}]] ˜
yC:\Users\amazi\OneDrive\Documents\Personal\SBA\athlete-app-backend\BookingAPI\Exceptions\BookingAlreadyExistsException.cs
	namespace 	

BookingAPI
 
. 

Exceptions 
{ 
public 

class )
BookingAlreadyExistsException .
:/ 0
	Exception1 :
{		 
public

 )
BookingAlreadyExistsException
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
} Ë
tC:\Users\amazi\OneDrive\Documents\Personal\SBA\athlete-app-backend\BookingAPI\Exceptions\BookingNotFoundException.cs
	namespace 	

BookingAPI
 
. 

Exceptions 
{ 
public 

class $
BookingNotFoundException )
:* +
	Exception, 5
{		 
public

 $
BookingNotFoundException

 '
(

' (
string

( .
message

/ 6
)

6 7
:

8 9
base

: >
(

> ?
message

? F
)

F G
{ 	
} 	
} 
} µ

_C:\Users\amazi\OneDrive\Documents\Personal\SBA\athlete-app-backend\BookingAPI\Models\Booking.cs
	namespace 	

BookingAPI
 
. 
Models 
{		 
public

 

class

 
Booking

 
{ 
[ 	
Key	 
] 
[ 	
DatabaseGenerated	 
( #
DatabaseGeneratedOption 2
.2 3
None3 7
)7 8
]8 9
public 
int 
Id 
{ 
get 
; 
set  
;  !
}" #
public 
string 
EmailId 
{ 
get  #
;# $
set% (
;( )
}* +
public 
int 
AthleteEventNo !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 
string !
AthleteEventAttendees +
{, -
get. 1
;1 2
set3 6
;6 7
}8 9
public 
string 
Status 
{ 
get "
;" #
set$ '
;' (
}) *
=+ ,
$str- :
;: ;
} 
} ç
hC:\Users\amazi\OneDrive\Documents\Personal\SBA\athlete-app-backend\BookingAPI\Models\BookingDbContext.cs
	namespace 	

BookingAPI
 
. 
Models 
{ 
public		 

class		 
BookingDbContext		 !
:		" #
	DbContext		$ -
{

 
public 
BookingDbContext 
(  
DbContextOptions  0
options1 8
)8 9
:: ;
base< @
(@ A
optionsA H
)H I
{ 	
Database 
. 
EnsureCreated "
(" #
)# $
;$ %
} 	
public 
DbSet 
< 
Booking 
> 
Bookings &
{' (
get) ,
;, -
set. 1
;1 2
}3 4
} 
} ∞

XC:\Users\amazi\OneDrive\Documents\Personal\SBA\athlete-app-backend\BookingAPI\Program.cs
	namespace

 	

BookingAPI


 
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
} ö"
mC:\Users\amazi\OneDrive\Documents\Personal\SBA\athlete-app-backend\BookingAPI\Repository\BookingRepository.cs
	namespace 	

BookingAPI
 
. 

Repository 
{ 
public		 

class		 
BookingRepository		 "
:		# $
IBookingRepository		% 7
{

 
private 
readonly 
BookingDbContext )
	dbContext* 3
;3 4
public 
BookingRepository  
(  !
BookingDbContext! 1

_dbContext2 <
)< =
{ 	
	dbContext 
= 

_dbContext "
;" #
} 	
public 
int 

AddBooking 
( 
Booking %
booking& -
)- .
{ 	
var 

topBooking 
= 
	dbContext &
.& '
Bookings' /
./ 0
OrderByDescending0 A
(A B
xB C
=>D F
xG H
.H I
IdI K
)K L
.L M
FirstOrDefaultM [
([ \
)\ ]
;] ^
if 
( 

topBooking 
== 
null "
)" #
{ 
booking 
. 
Id 
= 
$num !
;! "
} 
else 
{ 
booking 
. 
Id 
= 

topBooking '
.' (
Id( *
++ ,
$num- .
;. /
} 
	dbContext 
. 
Bookings 
. 
Add "
(" #
booking# *
)* +
;+ ,
return 
	dbContext 
. 
SaveChanges (
(( )
)) *
;* +
} 	
public 
int 
Cancel 
( 
int 
id  
,  !
Booking" )
booking* 1
)1 2
{   	
var!! 
res!! 
=!! 
	dbContext!! 
.!!  
Bookings!!  (
.!!( )
Where!!) .
(!!. /
x!!/ 0
=>!!1 3
x!!4 5
.!!5 6
Id!!6 8
.!!8 9
Equals!!9 ?
(!!? @
id!!@ B
)!!B C
)!!C D
.!!D E
FirstOrDefault!!E S
(!!S T
)!!T U
;!!U V
	dbContext"" 
."" 
Bookings"" 
."" 
Remove"" %
(""% &
res""& )
)"") *
;""* +
return## 
	dbContext## 
.## 
SaveChanges## (
(##( )
)##) *
;##* +
}$$ 	
public&& 
List&& 
<&& 
Booking&& 
>&& 
GetAllBookings&& +
(&&+ ,
)&&, -
{'' 	
return(( 
	dbContext(( 
.(( 
Bookings(( %
.((% &
ToList((& ,
(((, -
)((- .
;((. /
})) 	
public++ 
Booking++ 
GetBookingById++ %
(++% &
int++& )
id++* ,
)++, -
{,, 	
return-- 
	dbContext-- 
.-- 
Bookings-- %
.--% &
Where--& +
(--+ ,
x--, -
=>--. 0
x--1 2
.--2 3
Id--3 5
.--5 6
Equals--6 <
(--< =
id--= ?
)--? @
)--@ A
.--A B
FirstOrDefault--B P
(--P Q
)--Q R
;--R S
}.. 	
public00 
List00 
<00 
Booking00 
>00 
History00 $
(00$ %
string00% +
email00, 1
)001 2
{11 	
return22 
	dbContext22 
.22 
Bookings22 %
.22% &
Where22& +
(22+ ,
x22, -
=>22. 0
x221 2
.222 3
EmailId223 :
.22: ;
Equals22; A
(22A B
email22B G
)22G H
)22H I
.22I J
ToList22J P
(22P Q
)22Q R
;22R S
}33 	
}44 
}55 Æ
nC:\Users\amazi\OneDrive\Documents\Personal\SBA\athlete-app-backend\BookingAPI\Repository\IBookingRepository.cs
	namespace 	

BookingAPI
 
. 

Repository 
{ 
public		 

	interface		 
IBookingRepository		 '
{

 
int 

AddBooking 
( 
Booking 
booking &
)& '
;' (
List 
< 
Booking 
> 
History 
( 
string $
email% *
)* +
;+ ,
int 
Cancel 
( 
int 
id 
, 
Booking "
booking# *
)* +
;+ ,
List 
< 
Booking 
> 
GetAllBookings $
($ %
)% &
;& '
Booking 
GetBookingById 
( 
int "
id# %
)% &
;& '
} 
} ì&
iC:\Users\amazi\OneDrive\Documents\Personal\SBA\athlete-app-backend\BookingAPI\ServiceRegistryExtension.cs
	namespace 	

BookingAPI
 
{ 
public 

static 
class $
ServiceRegistryExtension 0
{ 
public 
static 
IServiceCollection (
AddConsulConfig) 8
(8 9
this9 =
IServiceCollection> P
servicesQ Y
,Y Z
IConfiguration[ i!
configurationSettingsj 
)	 Ä
{ 	
services 
. 
AddSingleton !
<! "
IConsulClient" /
,/ 0
ConsulClient1 =
>= >
(> ?
p? @
=>A C
newD G
ConsulClientH T
(T U
consulConfigU a
=>b d
{ 
consulConfig 
. 
Address $
=% &
new' *
Uri+ .
(. /
Environment/ :
.: ;"
GetEnvironmentVariable; Q
(Q R
$strR a
)a b
)b c
;c d
} 
) 
) 
; 
return 
services 
; 
} 	
public 
static 
IApplicationBuilder )
	UseConsul* 3
(3 4
this4 8
IApplicationBuilder9 L
appM P
,P Q
IConfigurationR `!
configirationSettingsa v
)v w
{ 	
var 
consulClient 
= 
app "
." #
ApplicationServices# 6
.6 7
GetRequiredService7 I
<I J
IConsulClientJ W
>W X
(X Y
)Y Z
;Z [
var 
logger 
= 
app 
. 
ApplicationServices 0
.0 1
GetRequiredService1 C
<C D
ILoggerFactoryD R
>R S
(S T
)T U
.U V
CreateLoggerV b
(b c
$strc q
)q r
;r s
var 
lifetime 
= 
app 
. 
ApplicationServices 2
.2 3
GetRequiredService3 E
<E F$
IHostApplicationLifetimeF ^
>^ _
(_ `
)` a
;a b
var   
registration   
=   
new   "$
AgentServiceRegistration  # ;
(  ; <
)  < =
{!! 
ID&& 
=&& 
Environment&&  
.&&  !"
GetEnvironmentVariable&&! 7
(&&7 8
$str&&8 K
)&&K L
,&&L M
Name'' 
='' 
Environment'' "
.''" #"
GetEnvironmentVariable''# 9
(''9 :
$str'': M
)''M N
,''N O
Address(( 
=(( 
Environment(( %
.((% &"
GetEnvironmentVariable((& <
(((< =
$str((= P
)((P Q
,((Q R
Port)) 
=)) 
int)) 
.)) 
Parse))  
())  !
Environment))! ,
.)), -"
GetEnvironmentVariable))- C
())C D
$str))D W
)))W X
)))X Y
}++ 
;++ 
logger-- 
.-- 
LogInformation-- !
(--! "
$str--" ;
)--; <
;--< =
consulClient.. 
... 
Agent.. 
... 
ServiceDeregister.. 0
(..0 1
registration..1 =
...= >
ID..> @
)..@ A
...A B
ConfigureAwait..B P
(..P Q
true..Q U
)..U V
;..V W
consulClient// 
.// 
Agent// 
.// 
ServiceRegister// .
(//. /
registration/// ;
)//; <
.//< =
ConfigureAwait//= K
(//K L
true//L P
)//P Q
;//Q R
lifetime11 
.11 
ApplicationStopped11 '
.11' (
Register11( 0
(110 1
(111 2
)112 3
=>114 6
{22 
logger33 
.33 
LogInformation33 %
(33% &
$str33& G
)33G H
;33H I
consulClient44 
.44 
Agent44 "
.44" #
ServiceDeregister44# 4
(444 5
registration445 A
.44A B
ID44B D
)44D E
.44E F
ConfigureAwait44F T
(44T U
true44U Y
)44Y Z
;44Z [
}55 
)55 
;55 
return77 
app77 
;77 
}88 	
}99 
}:: ù
gC:\Users\amazi\OneDrive\Documents\Personal\SBA\athlete-app-backend\BookingAPI\Service\BookingService.cs
	namespace		 	

BookingAPI		
 
.		 
Service		 
{

 
public 

class 
BookingService 
:  !
IBookingService" 1
{ 
private 
readonly 
IBookingRepository +
repo, 0
;0 1
public 
BookingService 
( 
IBookingRepository 0
_repo1 6
)6 7
{ 	
repo 
= 
_repo 
; 
} 	
public 
int 

AddBooking 
( 
Booking %
booking& -
)- .
{ 	
var 
res 
= 
repo 
. 
GetBookingById )
() *
booking* 1
.1 2
Id2 4
)4 5
;5 6
if 
( 
res 
!= 
null 
) 
{ 
throw 
new )
BookingAlreadyExistsException 7
(7 8
$"8 :
$str: S
{S T
bookingT [
.[ \
Id\ ^
}^ _
$str_ n
"n o
)o p
;p q
} 
return 
repo 
. 

AddBooking "
(" #
booking# *
)* +
;+ ,
} 	
public 
int 
Cancel 
( 
int 
id  
,  !
Booking" )
booking* 1
)1 2
{ 	
var 
res 
= 
repo 
. 
GetBookingById )
() *
booking* 1
.1 2
Id2 4
)4 5
;5 6
if   
(   
res   
==   
null   
)   
{!! 
throw"" 
new"" $
BookingNotFoundException"" 2
(""2 3
$"""3 5
$str""5 N
{""N O
booking""O V
.""V W
Id""W Y
}""Y Z
$str""Z j
"""j k
)""k l
;""l m
}## 
return$$ 
repo$$ 
.$$ 
Cancel$$ 
($$ 
id$$ !
,$$! "
booking$$# *
)$$* +
;$$+ ,
}%% 	
public'' 
List'' 
<'' 
Booking'' 
>'' 
GetAllBookings'' +
(''+ ,
)'', -
{(( 	
return)) 
repo)) 
.)) 
GetAllBookings)) &
())& '
)))' (
;))( )
}** 	
public,, 
List,, 
<,, 
Booking,, 
>,, 
History,, $
(,,$ %
string,,% +
email,,, 1
),,1 2
{-- 	
return.. 
repo.. 
... 
History.. 
(..  
email..  %
)..% &
;..& '
}// 	
}00 
}11 £
hC:\Users\amazi\OneDrive\Documents\Personal\SBA\athlete-app-backend\BookingAPI\Service\IBookingService.cs
	namespace 	

BookingAPI
 
. 
Service 
{ 
public		 

	interface		 
IBookingService		 $
{

 
int 

AddBooking 
( 
Booking 
booking &
)& '
;' (
List 
< 
Booking 
> 
History 
( 
string $
email% *
)* +
;+ ,
int 
Cancel 
( 
int 
id 
, 
Booking "
booking# *
)* +
;+ ,
List 
< 
Booking 
> 
GetAllBookings $
($ %
)% &
;& '
} 
} ¢/
XC:\Users\amazi\OneDrive\Documents\Personal\SBA\athlete-app-backend\BookingAPI\Startup.cs
	namespace 	

BookingAPI
 
{ 
public 

class 
Startup 
{ 
public 
Startup 
( 
IConfiguration %
configuration& 3
)3 4
{ 	
Configuration 
= 
configuration )
;) *
} 	
public 
IConfiguration 
Configuration +
{, -
get. 1
;1 2
}3 4
public!! 
void!! 
ConfigureServices!! %
(!!% &
IServiceCollection!!& 8
services!!9 A
)!!A B
{"" 	
services## 
.## 
AddConsulConfig## $
(##$ %
Configuration##% 2
)##2 3
;##3 4
services$$ 
.$$ 
AddControllers$$ #
($$# $
)$$$ %
.$$% &
AddNewtonsoftJson$$& 7
($$7 8
)$$8 9
;$$9 :
services(( 
.(( 
AddDbContext(( !
<((! "
BookingDbContext((" 2
>((2 3
(((3 4
options((4 ;
=>((< >
options((? F
.((F G
UseSqlServer((G S
(((S T
Environment((T _
.((_ `"
GetEnvironmentVariable((` v
(((v w
$str	((w á
)
((á à
)
((à â
)
((â ä
;
((ä ã
services)) 
.)) 
	AddScoped)) 
<)) 
IBookingRepository)) 1
,))1 2
BookingRepository))3 D
>))D E
())E F
)))F G
;))G H
services** 
.** 
	AddScoped** 
<** 
IBookingService** .
,**. /
BookingService**0 >
>**> ?
(**? @
)**@ A
;**A B
var-- 
key-- 
=-- 
new--  
SymmetricSecurityKey-- .
(--. /
Encoding--/ 7
.--7 8
UTF8--8 <
.--< =
GetBytes--= E
(--E F
$str--F c
)--c d
)--d e
;--e f
services.. 
... 
AddAuthentication.. &
(..& '
options..' .
=>../ 1
{// 
options00 
.00 %
DefaultAuthenticateScheme00 1
=002 3
JwtBearerDefaults004 E
.00E F 
AuthenticationScheme00F Z
;00Z [
options11 
.11 "
DefaultChallengeScheme11 .
=11/ 0
JwtBearerDefaults111 B
.11B C 
AuthenticationScheme11C W
;11W X
}22 
)22 
.22 
AddJwtBearer22 
(22 
o22 
=>22  
o22! "
.22" #%
TokenValidationParameters22# <
=22= >
new22? B%
TokenValidationParameters22C \
(22\ ]
)22] ^
{33 $
ValidateIssuerSigningKey44 (
=44) *
true44+ /
,44/ 0
IssuerSigningKey55  
=55! "
key55# &
,55& '
ValidateIssuer77 
=77  
true77! %
,77% &
ValidIssuer88 
=88 
$str88 '
,88' (
ValidateAudience::  
=::! "
true::# '
,::' (
ValidAudience;; 
=;; 
$str;;  ,
}<< 
)<< 
;<< 
services?? 
.?? 
AddCors?? 
(?? 
options?? $
=>??% '
options??( /
.??/ 0
	AddPolicy??0 9
(??9 :
$str??: J
,??J K
policy??L R
=>??S U
policy??V \
.??\ ]
AllowAnyOrigin??] k
(??k l
)??l m
.??m n
AllowAnyHeader??n |
(??| }
)??} ~
.??~ 
AllowAnyMethod	?? ç
(
??ç é
)
??é è
)
??è ê
)
??ê ë
;
??ë í
servicesBB 
.BB 
AddSwaggerGenBB "
(BB" #
)BB# $
;BB$ %
}CC 	
publicFF 
voidFF 
	ConfigureFF 
(FF 
IApplicationBuilderFF 1
appFF2 5
,FF5 6
IWebHostEnvironmentFF7 J
envFFK N
)FFN O
{GG 	
ifHH 
(HH 
envHH 
.HH 
IsDevelopmentHH !
(HH! "
)HH" #
)HH# $
{II 
appJJ 
.JJ %
UseDeveloperExceptionPageJJ -
(JJ- .
)JJ. /
;JJ/ 0
}KK 
appMM 
.MM 
UseHttpsRedirectionMM #
(MM# $
)MM$ %
;MM% &
appOO 
.OO 
	UseConsulOO 
(OO 
ConfigurationOO '
)OO' (
;OO( )
appQQ 
.QQ 
UseCorsQQ 
(QQ 
$strQQ (
)QQ( )
;QQ) *
appSS 
.SS 

UseSwaggerSS 
(SS 
)SS 
;SS 
appUU 
.UU 
UseSwaggerUIUU 
(UU 
optionsUU $
=>UU% '
optionsUU( /
.UU/ 0
SwaggerEndpointUU0 ?
(UU? @
$strUU@ Z
,UUZ [
$strUU\ k
)UUk l
)UUl m
;UUm n
appWW 
.WW 

UseRoutingWW 
(WW 
)WW 
;WW 
appYY 
.YY 
UseAuthenticationYY !
(YY! "
)YY" #
.YY# $
UseAuthorizationYY$ 4
(YY4 5
)YY5 6
;YY6 7
app[[ 
.[[ 
UseEndpoints[[ 
([[ 
	endpoints[[ &
=>[[' )
{\\ 
	endpoints]] 
.]] 
MapControllers]] (
(]]( )
)]]) *
;]]* +
}^^ 
)^^ 
;^^ 
}__ 	
}`` 
}aa 