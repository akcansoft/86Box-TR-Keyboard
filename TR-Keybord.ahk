; 86Box_TR_Keybord
; v1.0
; 02/12/2024

; Bu AutoHotkey v2 script, 86box emülatöründe Türkçe klavye düzenini etkinleştirmek ve uyarlamak için tasarlanmıştır.
; Script, US klavye düzenindeki tuşları Türkçe klavyedeki karakterlere eşleştirir ve Türkçe klavye kullanmayı mümkün kılar.
; Ek olarak, script Ctrl+V kombinasyonu ile panodaki (clipboard) bilgileri otomatik olarak emülatör içerisine yapıştırmayı destekler.
; Karakterlerin doğru şekilde aktarılması için panodaki Unicode metinler Türkçe DOS (IBM 857) kodlamasına dönüştürülür ve
; her karakter emülatöre gönderilir.
; Bu sayede hem daha hızlı hem de doğru bir yazma ve veri yapıştırma deneyimi sunar.

; Mesut Akcan
; makcan@gmail.com

; https://www.youtube.com/mesutakcan
; https://mesutakcan.blogspot.com

; Blog sayfam     : https://mesutakcan.blogSpot.com
; Youtube Kanalım : https://www.youtube.com/mesutakcan
; WhatsApp kanalım: https://www.whatsapp.com/channel/0029Va5h4cQ0LKZLuB9Dpy23
; Telegram kanalım: https://t.me/mesutakcan

#Requires AutoHotkey v2
#SingleInstance Force
ProcessSetPriority "R"

SetKeyDelay -1, 5
SendMode "Event"

; Kısayollar sadece 86Box programı aktif iken çalışır
#HotIf WinActive("ahk_exe 86Box.exe")
; " é <
;  "::PrintChr(34) ; "
SC029::PrintChr(34) ; "
;+"::PrintChr(130) ; é
+SC029::PrintChr(130) ; é
;<^>!"::+ö ; ALTGR " <
;<^>!SC029::PrintChr(60) ; ALTGR " <
;<^>!SC029::SC056 ; ALTGR " <

; 1
<^>!1::+ç ; ALTGR 1 >

; 2 SC003
+SC003::PrintChr(39) ; '
;<^>!2::PrintChr(156) ; £

; 3
+3::PrintChr(94) ; ^
<^>!3::+3 ; #

; 4
+4::PrintChr(43) ; +
<^>!4::+4 ; $

; 5
;<^>!5::PrintChr(171)  ; ½

; 6
+6::+7 ; &

; 7
+7::PrintChr(47) ; /
<^>!7::+ğ ; {

; 8
+8::+9 ; (
<^>!8::ğ ; [

; 9
+9::+0 ; )
<^>!9::ü ;Altgr 9 ]

; 0
+0::PrintChr(61) ; -
<^>!0::+ü ; Altgr 0 }

; *
*::+8 ; *
+*::+. ; ?
<^>!*::, ;Altgr * \

; -
-::* ; -
+-::+* ; _

; q
<^>!q::+2 ; AltGr q @

; ı
ı::PrintChr(141) ; ı

; ğ
ğ::PrintChr(167) ; ğ
+ğ::PrintChr(166) ; Ğ
;<^>!ğ::PrintChr(249) ; ¨
;<^>!SC1A::PrintChr(249)
;<^>!ğ::¨

; ü Ü ~
ü::PrintChr(129) ; ; ü
+ü::PrintChr(154) ; ; Ü
<^>!ü::+" ; ~
;<^>!ü::~

; a
;<^>!SC01E::PrintChr(145) ; æ
;<^>!SC01E::æ
;<^>!a::æ

; s
;<^>!s::PrintChr(225) ; ß

; ş Ş ´
ş::PrintChr(159) ; ş
+ş::PrintChr(158) ; Ş
<^>!ş::PrintChr(239) ; ´

; i İ
SC28::ı ; i
+SC28::PrintChr(152) ; İ

; , ; `
,::ö ; ,
+,::PrintChr(59) ; ;
;<^>!,::PrintChr(96) ; `

; < > |
SC056::+ç ;PrintChr(60) ; <
+SC056::+ö ;PrintChr(62) ; >
<^>!SC056::+, ; |

; ö Ö
ö::PrintChr(148) ; ö
Ö::PrintChr(153) ; Ö

; ç Ç
ç::PrintChr(135) ; ç
Ç::PrintChr(128) ; Ç

; . :
.::ç ; .
+.::+ş ; :

;  CRL+v YAPIŞTIR
^v::{
  pano := StrReplace(A_Clipboard, "`r`n", "`n") ;
  loop parse, pano, ""
  {
    PrintChr(ASC857(A_LoopField))
  }
}
#HotIf

; ASCII karakter kodunu karakter olarak yaz
PrintChr(ascii) {
  Send "{ASC " ascii "}"
}

; Karakterin Türkçe ASCII kodu
ASC857(Chr) { ; OEM Turkish; Turkish DOS = 857 (ibm857)
  Static Buff := Buffer(4, 0)
  Return (StrPut(Chr, Buff, 2, 857), NumGet(Buff, "UShort"))
}
