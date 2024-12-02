# 86Box-TR-Keyboard

**86box emülatöründe Türkçe klavye desteği ve panodan yapıştırma fonksiyonu.**

Bu AutoHotkey v2 script, **86box emülatöründe Türkçe klavye düzenini etkinleştirmek** için tasarlanmıştır.  
Script, US klavye düzenindeki tuşları Türkçe klavyedeki karakterlerle eşleştirerek Türkçe klavye kullanmayı mümkün kılar. 

Ek olarak, **Ctrl+V kombinasyonu** ile panodaki (clipboard) bilgileri emülatör içerisine otomatik olarak yapıştırmayı destekler.  
Karakterlerin doğru şekilde aktarılması için panodaki Unicode metinler, Türkçe DOS (IBM 857) kodlamasına dönüştürülür ve her karakter emülatöre gönderilir.  
Bu sayede daha hızlı ve doğru bir yazma ile veri yapıştırma deneyimi sunar.

Bu script, [AutoHotkey v2](https://www.autohotkey.com/) kullanılarak hazırlanmıştır ve özellikle **86box** emülatöründe çalışan sistemler için optimize edilmiştir.

## Özellikler

- **Türkçe Klavye Düzeni**: US klavye düzenini Türkçe klavye düzenine çevirir. 
- **Panodan Yapıştırma**: Panodaki Unicode metinleri Türkçe DOS (IBM 857) kodlamasına dönüştürerek 86box emülatöründe yapıştırır.
- **Düşük Gecikme**: Tuş basışlarına hızlı tepki vermesi için optimize edilmiştir.

## Gereksinimler

- **86box emülatörü**: [86box resmi sitesi](https://86box.net/)
- **AutoHotkey v2**: [AutoHotkey v2 indir](https://www.autohotkey.com/)

## Kurulum ve Kullanım

1. **AutoHotkey v2**'yi sisteminize yükleyin.
2. Scripti çalıştırmak için ahk dosyaya çift tıklayın.
3. **86box** emülatörünüzü başlatın.
4. Script, yalnızca **86box** penceresi aktif olduğunda çalışır.<br>
Diğer emülatör programlarında denemek için script kodlarındaki<br>
<code>#HotIf WinActive("ahk_exe 86Box.exe")</code><br>
satırındaki <code>86Box.exe</code> yerine program dosyası adını yazın.<br>
VirtualBox ve PCem programlarında denenmiştir. Bu programlar klavye kontrolünü öncelikli ele aldığı için bu script çalışmamaktadır.

## Tuş Kombinasyonları

- **Türkçe Karakterler**:
  - `ç`, `ş`, `ğ`, `ı`, `ö`, `ü` gibi karakterler Türkçe klavyeye uygun şekilde eşlenmiştir.
  - Büyük harfler için `Shift` tuşunu kullanabilirsiniz.
  
- **Panodan Yapıştırma**:
  - **Ctrl+V**: Panodaki metni Türkçe DOS (IBM 857) kodlaması ile emülatör penceresine yapıştırır.

## Kod Açıklaması

### Karakter Eşlemeleri

Script, **US klavye düzenindeki tuşları Türkçe karakterlerle eşleştirmek** için çeşitli tuş kombinasyonlarını yeniden tanımlar.<br>
Örneğin:
- `Shift + 3` tuşu ile `^` işareti,
- `AltGr + Q` tuşu ile `@` işareti yazılır.

### Panodan Yapıştırma

Panodaki Unicode karakterleri Türkçe DOS kodlamasına çevirir ve her bir karakteri sırayla emülatöre gönderir:

## Bilinen sorunlar
- **Bazı Tuş Kombinasyonları Çalışmıyor**<br>
Belirli tuş kombinasyonlarıyla özel karakterler doğru şekilde yazılamayabilir.<br>
Örneğin:<br>
`AltGr` + `A` tuşlarına basıldığında `æ` karakteri yazılmaz.
- **Türkçeye özgü karakterler**<br>
86box emülatöründeki sanal sistemde Türkçeye özgü karakter bulunmuyorsa, Türkçe karakterler yerine ASCII tablosundaki karşılıkları yazılır.<br>
Örneğin: `Ğ`,`ğ`,`İ`,`ı`,`Ş`,`ş` karakterleri.
- **Caps Lock tuşu**<br>
Türkçeye özgü karakterlerde (`ü`, `ğ`, `ı`, `ş`, `ç`, `ö`) `Caps Lock` tuşu etkisizdir.<br>
Bu karakterlerin büyük hali yalnızca `Shift` tuşu kullanılarak yazılabilir.

## Katkıda Bulunma
Herhangi bir sorun ya da öneriniz varsa, GitHub üzerinden bir Issue oluşturabilir veya bir Pull Request gönderebilirsiniz.
