//
//  NewsListHelper.swift
//  newsProject
//
//  Created by Büşra Güneş on 18.09.2022.
//

import UIKit

class NewsListHelper{
    func getNews()-> [NewsListModel] {
        var itemList = [NewsListModel]()
        
        itemList.append(NewsListModel(newsImage: UIImage(named:"kralice")!, newsTitle: "Kraliçe II. Elizabeth'in cenazesi Londra'ya ulaştı", newsDescription: "Geçtiğimiz perşembe günü İskoçya'daki Balmoral Kalesi'nde hayatını kaybeden İngiltere Kraliçesi II. Elizabeth'in cenazesi Buckingham Sarayı'na götürülmek üzere Londra'ya ulaştı. Kraliyet Hava Kuvvetleri uçağı ile taşınan cenazeye Kraliçe'nin kızı Prenses Anne ve eşi Koramiral Sir Tim Laurence eşlik etti. Kraliyet Hava Kuvvetleri'nin Northolt'daki pistine iniş yapan uçak, pistte Kraliyet askerleri tarafından karşılandı. Kraliyet askerleri tarafından cenaze aracına yerleştirilen Kraliçe II. Elizabeth'in tabutu, daha sonra Buckingham Sarayı'na doğru yola çıktı.", newsUrl: "https://www.cnnturk.com/dunya/ingiltere/kralice-ii-elizabethin-cenazesi-londraya-ulasti"))
        
        itemList.append(NewsListModel(newsImage: UIImage(named:"araç")!, newsTitle: "Araç alacaklara kritik 'fiyat' uyarısı!",newsDescription: "Ticaret Bakanlığından yapılan açıklamaya göre, 16 Ağustos 2022 tarihinde Ticaret Bakanlığınca yapılan düzenlemeye göre ticari faaliyet kapsamında otomobil ve arazi taşıtlarının pazarlanması veya satışı ancak ilk tescil tarihinden itibaren 6 ay ve 6 bin kilometre geçmiş olması koşuluyla yapılabilecek ve bu şart sağlanmadan doğrudan veya dolaylı olarak 1 Temmuz 2023 tarihine kadar pazarlama ve satış yapılamayacak.", newsUrl: "https://www.cnnturk.com/otomobil/arac-alacaklara-kritik-fiyat-uyarisi?page=1"))
        
        
        itemList.append(NewsListModel(newsImage: UIImage(named:"gökhanNesrin")!, newsTitle: "Nesrin Cavadzade ile Gökhan Alkan ayrılığının asıl sebebi ortaya çıktı!",newsDescription: "Nesrin Cavadzade ile Gökhan Alkan, Yasak Elma dizisinde başlayan arkadaşlıklarını aşka dönüştürmüşlerdi.Evlenmeleri beklenen Nesrin Cavadzade ile Gökhan Alkan, ayrılık kararları ile herkesi şaşırtmışlardı. Uzun zamandır aşk hayatlarında herhangi bir kimse olmayan Nesrin Cavadzade ile Gökhan Alkan'ın neden ayrıldıkları da merak ediliyordu.", newsUrl: "https://www.cnnturk.com/magazin/nesrin-cavadzade-ile-gokhan-alkan-ayriliginin-asil-sebebi-ortaya-cikti"))
        
        
        itemList.append(NewsListModel(newsImage: UIImage(named:"Hortum")!, newsTitle: "Marmara denizinde hortum!",newsDescription: "Marmara denizinde Adalar civarında çıkan hortum sahillerden görüntülendi. Vatandaşlar çektikleri hortum görüntülerini sosyal medyada paylaştı.", newsUrl: "https://www.cnnturk.com/turkiye/marmara-denizinde-hortum"))
        
        
        itemList.append(NewsListModel(newsImage: UIImage(named:"melisaÇayı")!, newsTitle: "Melisa çayının faydaları nelerdir?",newsDescription: "Stresten sindirim sistemi sorunlarına kadar birçok soruna iyi gelen melisa çayı tamamlayıcı tıpta ilaç olarak kullanılıyor. Bitki çayları arasında yatıştırıcı ve sakinleştirici etkisiyle bilinen melisa çayının günde 2 fincandan fazla tüketilmemesi gerekiyor. Melisa çayını tüketirken bazı kurallara uyulması büyük önem taşıyor. Diyet Bölümü’nden Dyt. Betül Merd, melisa bitkisi hakkında bilgi vererek, melisa çayının faydalarını anlattı.", newsUrl: "https://www.cnnturk.com/saglik/melisa-cayinin-faydalari-nelerdir12"))
        
        itemList.append(NewsListModel(newsImage: UIImage(named:"rıza")!, newsTitle: "Rıza Kayaalp, 5. kez dünya şampiyonu oldu!", newsDescription: "Milli güreşçi Rıza Kayaalp, Büyükler Dünya Güreş Şampiyonası grekoromen stilde 5'inci kez şampiyon olarak tarihe geçti. Rıza Kayaalp, Türkiye'nin en çok altın madalya kazanan güreşte sporcusu oldum. Cumhuriyet tarihimizin en çok madalya alan sporcu unvanını elde ettim. En çok madalya alan sporcusu olmak da gurur verici. Son 1.5 yılım kaldı. Onu en iyi şekilde değerlendirmek istiyorum. Ülkeme yeni başarılar kazandırmak istiyorum dedi.",newsUrl: "https://www.cnnturk.com/spor/diger-sporlar/riza-kayaalp-5-kez-dunya-sampiyonu-oldu"))
        
        
        itemList.append(NewsListModel(newsImage: UIImage(named:"sivrisinek")!, newsTitle: "Bir sır daha çözüldü: Sivrisinekler insanları nasıl buluyor?", newsDescription: "Bilim insanları, sivrisineklerde diğer hayvanlardan daha fazla bulunan koku reseptörleri keşfetti. Sivrisineklerin her nöronunda çok sayıda farklı koku reseptörü olduğu fark edildi.", newsUrl: "https://www.cnnturk.com/yasam/bir-sir-daha-cozuldu-sivrisinekler-insanlari-nasil-buluyor"))
        
        itemList.append(NewsListModel(newsImage: UIImage(named:"siyasi")!, newsTitle: "Milli Savunma Bakanı Akar, Azerbaycan Savunma Bakanı Hasanov ile görüştü", newsDescription: "Milli Savunma Bakanı Hulusi Akar, Azerbaycan Savunma Bakanı Zakir Hasanov ile yaptığı telefon görüşmesinde Azerbaycan-Ermenistan sınırındaki gerginlik hakkında görüştü.",newsUrl: "https://www.cnnturk.com/turkiye/milli-savunma-bakani-akar-azerbaycan-savunma-bakani-hasanov-ile-gorustu"))
        
        return itemList
        
    }
}

