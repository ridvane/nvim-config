# Neovim Konfigurasyonu - Kullanim Kilavuzu (macOS)

> **Leader tusu:** `Space` (LazyVim varsayilani)
>
> Bu dokumanda `<leader>` gordugunde `Space` tusuna bas.
> Ornek: `<leader>ff` = `Space` → `f` → `f`

> **Mac Tus Notasyonu:**
>
> | Dokumandaki | Mac Klavyede | Aciklama |
> |-------------|-------------|----------|
> | `Ctrl` | `Control ⌃` | Sol alt korede, `fn` yanindaki tus. **`Cmd ⌘` degil!** |
> | `Shift` | `Shift ⇧` | Buyuk harf tusu |
> | `Esc` | `Esc ⎋` veya `Caps Lock` (eger remap ettiysen) |
> | `Enter` | `Return ↩` | |
> | `Cmd` | `⌘` | Neovim'de genelde **kullanilmaz**, terminal uygulamasina gider |
>
> Ornek: `⌃ h` = `Control ⌃` basili tut + `h` bas
>
> **Dikkat:** `⌃` (Control) ile `⌘` (Command) farkli tuslar! Neovim hep `⌃` kullanir.

---

## Icindekiler

1. [Kurulum](#kurulum)
2. [Modlar (Normal, Insert, Visual, Terminal)](#modlar)
3. [Dosya Gezgini (Neo-tree)](#dosya-gezgini-neo-tree)
4. [Dosya ve Icerik Arama (Telescope)](#dosya-ve-icerik-arama-telescope)
5. [Kod Yazma ve Duzenleme](#kod-yazma-ve-duzenleme)
6. [Hizli Navigasyon (Flash)](#hizli-navigasyon-flash)
7. [Pencere ve Buffer Yonetimi](#pencere-ve-buffer-yonetimi)
8. [Kod Navigasyonu (LSP)](#kod-navigasyonu-lsp)
9. [Hatalar ve Uyarilar (Trouble)](#hatalar-ve-uyarilar-trouble)
10. [TODO Yorumlari](#todo-yorumlari)
11. [Claude Code (AI Asistani)](#claude-code-ai-asistani)
12. [Git Islemleri](#git-islemleri)
13. [Git Diff View](#git-diff-view)
14. [Multi Cursor](#multi-cursor)
15. [Not Tutma (Obsidian)](#not-tutma-obsidian)
16. [Zen Mode (Odaklanma)](#zen-mode-odaklanma)
17. [Oturum Yonetimi (Persistence)](#oturum-yonetimi-persistence)
18. [Plugin Yonetimi](#plugin-yonetimi)
19. [Mac Ozel Notlar ve Onkosuller](#mac-ozel-notlar-ve-onkosuller)
20. [Sik Kullanilan Senaryolar](#sik-kullanilan-senaryolar)

---

## Kurulum

```bash
# 1. Repo'yu klonla
git clone <repo-url> ~/.config/nvim

# 2. Veya install script'i calistir
cd nvim-config
chmod +x install.sh && ./install.sh

# 3. Claude Code CLI kur (AI entegrasyonu icin gerekli)
npm install -g @anthropic-ai/claude-code

# 4. Neovim'i ac, plugin'ler otomatik yuklenecek
nvim
```

Ilk acilista Lazy.nvim tum plugin'leri indirip kuracak. Bu birkaç dakika surebilir.

---

## Modlar

Neovim modal bir editor. Her zaman bir "mod" icinde olursun.

### Normal Mod (varsayilan)

Neovim'i actiginda buradasin. Komut verirsin, yazmazsin.

| Tus | Ne Yapar |
|-----|----------|
| `i` | Insert moda gec (imlecin oldugu yerde yazmaya basla) |
| `a` | Insert moda gec (imlecin bir sagi) |
| `o` | Alt satira yeni satir ac ve insert moda gec |
| `O` | Ust satira yeni satir ac ve insert moda gec |
| `A` | Satir sonuna git ve insert moda gec |
| `I` | Satir basina git ve insert moda gec |
| `v` | Visual moda gec (karakter bazli secim) |
| `V` | Visual Line moda gec (satir bazli secim) |
| `⌃ v` | Visual Block moda gec (blok secim) |
| `:` | Command moda gec |

### Insert Mod (yazma modu)

| Tus | Ne Yapar |
|-----|----------|
| `Esc` | Normal moda don |
| Tum tuslar | Normal sekilde yaz |

### Visual Mod (secim modu)

| Tus | Ne Yapar |
|-----|----------|
| `y` | Secimi kopyala |
| `d` | Secimi kes/sil |
| `p` | Secimin yerine yapistir |
| `>` | Secimi saga kaydir (indent) |
| `<` | Secimi sola kaydir (outdent) |
| `Esc` | Normal moda don |

### Terminal Mod

#### ToggleTerm ile Terminal Acma

| Tus | Mod | Ne Yapar |
|-----|-----|----------|
| `⌃ `` ` | Normal/Terminal | **Floating terminal** ac/kapat (varsayilan) |
| `<leader>tf` | Normal | **Floating** terminal ac |
| `<leader>th` | Normal | **Yatay (horizontal)** terminal ac (altta) |
| `<leader>tv` | Normal | **Dikey (vertical)** terminal ac (sagda) |

#### Terminal Icinde Navigasyon

| Tus | Ne Yapar |
|-----|----------|
| `Esc Esc` | Terminal modundan **normal moda** gec |
| `i` | Tekrar terminal moduna gir |
| `⌃ h` | Sol pencereye gec |
| `⌃ j` | Alt pencereye gec |
| `⌃ k` | Ust pencereye gec |
| `⌃ l` | Sag pencereye gec |

> **Not:** Floating terminal mavi kenarlikli, yuvarlatilmis bir pencerede acilir.
> Yatay terminal 15 satir yuksekliginde, dikey terminal ekranin %40'i genisliginde acilir.
> Her terminal tipi bagimsiz bir oturumdur (farkli komutlar calistirabilirsin).


## Temel Hareketler (her modda ise yarar)

### Imlec Hareketi

| Tus | Ne Yapar |
|-----|----------|
| `h` | Sola |
| `j` | Asagi |
| `k` | Yukari |
| `l` | Saga |
| `w` | Sonraki kelimenin basina |
| `b` | Onceki kelimenin basina |
| `e` | Kelimenin sonuna |
| `0` | Satir basina |
| `$` | Satir sonuna |
| `gg` | Dosyanin basina |
| `G` | Dosyanin sonuna |
| `{` | Onceki bos satira (paragraf yukari) |
| `}` | Sonraki bos satira (paragraf asagi) |
| `⌃ d` | Yarim sayfa asagi (ekran ortada kalir) |
| `⌃ u` | Yarim sayfa yukari (ekran ortada kalir) |
| `%` | Eslesik paranteze zipla `( )`, `{ }`, `[ ]` |

### Arama ile Hareket

| Tus | Ne Yapar |
|-----|----------|
| `/kelime` | Ileriye dogru ara |
| `?kelime` | Geriye dogru ara |
| `n` | Sonraki sonuc (ekran ortada kalir) |
| `N` | Onceki sonuc (ekran ortada kalir) |
| `*` | Imlec altindaki kelimeyi ileriye ara |
| `#` | Imlec altindaki kelimeyi geriye ara |

---

## Temel Duzenleme (Normal modda)

| Tus | Ne Yapar |
|-----|----------|
| `dd` | Satiri sil |
| `yy` | Satiri kopyala |
| `Y` | Imlecten satir sonuna kopyala |
| `p` | Altina yapistir |
| `P` | Ustune yapistir |
| `u` | Geri al (undo) |
| `⌃ r` | Ileri al (redo) |
| `x` | Imlec altindaki karakteri sil |
| `r` + karakter | Imlec altindaki karakteri degistir |
| `ciw` | Kelimeyi sil ve insert moda gec (change inner word) |
| `ci"` | Tirnak icini sil ve insert moda gec |
| `ci(` | Parantez icini sil ve insert moda gec |
| `diw` | Kelimeyi sil |
| `di"` | Tirnak icini sil |
| `.` | Son islemi tekrarla |
| `>>` | Satiri saga kaydir |
| `<<` | Satiri sola kaydir |

### Kaydetme ve Cikis

| Tus/Komut | Ne Yapar |
|-----------|----------|
| `:w` | Kaydet |
| `:q` | Cik |
| `:wq` veya `:x` | Kaydet ve cik |
| `:q!` | Kaydetmeden cik (zorla) |
| `:qa` | Tum buffer'lari kapat ve cik |
| `:wa` | Tum buffer'lari kaydet |

---

## Dosya Gezgini (Neo-tree)

Sol taraftaki dosya paneli.

### Acma/Kapatma

| Tus | Mod | Ne Yapar |
|-----|-----|----------|
| `<leader>e` | Normal | Dosya gezginini ac/kapat |
| `⌃ h` | Normal | Sol pencereye (Neo-tree'ye) gecis yap |

### Neo-tree Icinde Gezinme

| Tus | Ne Yapar |
|-----|----------|
| `j` / `k` | Asagi / yukari gezin |
| `Enter` | Dosya ac veya klasor ac/kapat |
| `l` | Klasoru ac / dosyayi ac |
| `h` | Klasoru kapat / ust klasore git |
| `?` | Yardim menusunu goster (tum kisa yollar) |

### Neo-tree Icinde Dosya Islemleri

| Tus | Ne Yapar |
|-----|----------|
| `a` | Yeni dosya olustur (sona `/` koyarsan klasor olusturur) |
| `d` | Sil |
| `r` | Yeniden adlandir |
| `c` | Kopyala |
| `m` | Tasi/adini degistir |
| `y` | Dosya adini kopyala |
| `Y` | Dosyanin tam yolunu kopyala |
| `x` | Kes |
| `p` | Yapistir |
| `H` | Gizli dosyalari goster/gizle |
| `R` | Yenile (refresh) |
| `q` | Neo-tree'yi kapat |
| `/` | Dosyalari filtrele |

> **Not:** Bu config'de dotfile'lar ve gitignore'lanan dosyalar varsayilan olarak gorunur.
> Neo-tree 40px genisliginde, sol tarafta acilir.

---

## Dosya ve Icerik Arama (Telescope)

Projedeki her seyi hizlica bulmani saglar.

### Arama Kisa Yollari

| Tus | Mod | Ne Yapar |
|-----|-----|----------|
| `<leader>ff` | Normal | **Dosya ara** (isim ile) |
| `<leader>fg` | Normal | **Icerik ara** (live grep - dosya icerigi) |
| `<leader>fs` | Normal | **Gelismis icerik ara** (case-insensitive, uzanti filtreli) |
| `<leader>fb` | Normal | **Acik buffer'lar** listele |
| `<leader>fh` | Normal | **Yardim dokumanlari** ara |
| `<leader><leader>` | Normal | **Son acilan dosyalar** |
| `<leader>sg` | Normal | **Grep** (LazyVim varsayilani) |
| `<leader>sk` | Normal | **Keymap'leri** ara |

### Telescope Penceresi Icinde

| Tus | Ne Yapar |
|-----|----------|
| `⌃ j` | Sonuclar listesinde asagi |
| `⌃ k` | Sonuclar listesinde yukari |
| `Return ↩` | Sec ve ac |
| `⌃ x` | Yatay split'te ac |
| `⌃ v` | Dikey split'te ac |
| `⌃ t` | Yeni tab'da ac |
| `⌃ u` | Preview'da yukari kaydir |
| `⌃ d` | Preview'da asagi kaydir |
| `Esc` | Kapat (normal moddaysan) |
| `⌃ c` | Kapat (insert moddaysan) |

### Gelismis Arama (`<leader>fs`) Ornekleri

Bu arama case-insensitive olarak calisir ve ozel ripgrep flag'leri alir:

```
login                             # "login" kelimesini her yerde ara
"user login"                      # Tam ifadeyi ara
login -g '*.ts'                   # Sadece .ts dosyalarinda ara
login -g '*.{js,ts,tsx}'          # .js, .ts ve .tsx dosyalarinda ara
TODO -g '!node_modules/**'        # node_modules klasoru haric ara
"function.*export" -g '*.ts'      # Regex ile ara
```

> **Ipucu:** Prompt ustte gorunur (ascending layout), sonuclar asagidan yukariya siralanir.

---

## Kod Yazma ve Duzenleme

### Ozel Keymap'ler

| Tus | Mod | Ne Yapar |
|-----|-----|----------|
| `J` | Visual | Secili satirlari **asagi** tasi |
| `K` | Visual | Secili satirlari **yukari** tasi |
| `Y` | Normal | Imlecten satir sonuna kopyala |
| `<leader>p` | Visual | Yapistir ama silinen metni register'a **almaz** |
| `<leader>s` | Normal | Imlec altindaki kelimeyi dosya capinda **bul-degistir** |
| `<leader>x` | Normal | Dosyanin calistirilabilirligini kaldir |

#### Satir Tasima Ornegi

1. `V` ile satirlari sec
2. `J` veya `K` ile yukari/asagi tasi
3. Otomatik olarak indent duzenlenir

#### Bul-Degistir Ornegi (`<leader>s`)

1. Imleci degistirmek istedigin kelimenin ustune koy
2. `<leader>s` bas
3. Komut satirinda `:%s/kelime/kelime/gI` seklinde hazir gelir
4. Yeni kelimeyi yaz, `Enter` bas

---

## Hizli Navigasyon (Flash)

Ekranda gorunen herhangi bir yere 2-3 tusla ziplama. Normal `/` aramasindan cok daha hizli.

### Temel Kullanim

| Tus | Mod | Ne Yapar |
|-----|-----|----------|
| `s` | Normal | **Flash Jump** - bir yer yaz, cikan harfe bas, orada ol |
| `S` | Normal | **Flash Treesitter** - kod bloklarini sec (fonksiyon, if, loop vb.) |

### Nasil Calisir?

1. Normal modda `s` bas
2. Gitmek istedigin yerdeki 1-2 karakter yaz (mesela `fu` → function icin)
3. Eslesen yerlerde renkli harfler belirir
4. O harfe bas → oradasin

### Ornek

```
Diyelim ekranda sunlar var:

  const [a]ddUser = () => {}
  const [d]eleteUser = () => {}
  const [u]pdateUser = () => {}

s bas → "up" yaz → updateUser'in yaninda [k] gibi bir harf cikar → k bas → oradasin
```

> **Ipucu:** `s` ile zipla, `S` ile kod blogunu sec (if blogu, fonksiyon blogu vb.)
> Flash, `/` arama ile de calisir - arama yaparken sonuclarin yaninda atlama harfleri gorunur.

---

## Pencere ve Buffer Yonetimi

### Pencere (Split) Islemleri

| Tus | Mod | Ne Yapar |
|-----|-----|----------|
| `<leader>-` | Normal | Yatay split (ust-alt) |
| `<leader>\|` | Normal | Dikey split (sol-sag) |
| `<leader>wd` | Normal | Aktif pencereyi kapat |
| `<leader>wm` | Normal | Pencereyi maximize et |

### Pencereler Arasi Gecis

| Tus | Ne Yapar |
|-----|----------|
| `⌃ h` | **Sol** pencereye gec |
| `⌃ j` | **Alt** pencereye gec |
| `⌃ k` | **Ust** pencereye gec |
| `⌃ l` | **Sag** pencereye gec |

Gorsel olarak:

```
                    ⌃ k
                     ↑
              ⌃ h ←  ●  → ⌃ l
                     ↓
                    ⌃ j
```

> **Onemli:** Bu tuslar Neo-tree, editor ve Claude Code terminal'i arasi gecis icin kullanilir.
>
> Tipik ekran duzeni:
>
> ```
> ┌──────────┬─────────────────────┐
> │          │                     │
> │ Neo-tree │   Editor            │  ⌃ h / ⌃ l ile sol-sag gecis
> │  (sol)   │   (sag ust)         │
> │          │                     │
> │          ├─────────────────────┤
> │          │                     │  ⌃ j / ⌃ k ile ust-alt gecis
> │          │   Claude Code       │
> │          │   (sag alt)         │
> └──────────┴─────────────────────┘
> ```

### Pencere Boyutlandirma

| Tus | Ne Yapar |
|-----|----------|
| `⌃ ↑` | Pencereyi yukari buyut |
| `⌃ ↓` | Pencereyi asagi kucult |
| `⌃ ←` | Pencereyi sola daralt |
| `⌃ →` | Pencereyi saga genislet |

### Buffer (Acik Dosya) Yonetimi

Buffer = acik dosya. Alttaki tab bar'da gorunur.

| Tus | Mod | Ne Yapar |
|-----|-----|----------|
| `H` | Normal | **Onceki** buffer'a gec |
| `L` | Normal | **Sonraki** buffer'a gec |
| `<leader>bb` | Normal | Buffer listesini ac |
| `<leader>bd` | Normal | Mevcut buffer'i kapat |
| `<leader>bo` | Normal | Diger tum buffer'lari kapat |

### Tab Yonetimi

| Tus | Mod | Ne Yapar |
|-----|-----|----------|
| `<leader><tab>l` | Normal | Son tab'a gec |
| `<leader><tab>f` | Normal | Ilk tab'a gec |
| `<leader><tab><tab>` | Normal | Yeni tab |
| `<leader><tab>d` | Normal | Tab'i kapat |
| `<leader><tab>]` | Normal | Sonraki tab |
| `<leader><tab>[` | Normal | Onceki tab |

---

## Kod Navigasyonu (LSP)

LSP (Language Server Protocol) sayesinde IDE benzeri ozellikler.

### Tanimina Gitme ve Referanslar

| Tus | Mod | Ne Yapar |
|-----|-----|----------|
| `gd` | Normal | **Tanimina git** (Go to Definition) |
| `gr` | Normal | **Referanslarini** listele |
| `gI` | Normal | **Implementasyona** git |
| `gy` | Normal | **Type definition'a** git |
| `gD` | Normal | **Declaration'a** git |
| `K` | Normal | **Hover** bilgisi goster (dokumantasyon) |

### Kod Aksiyonlari

| Tus | Mod | Ne Yapar |
|-----|-----|----------|
| `<leader>ca` | Normal | **Code Action** (otomatik duzeltme, import ekleme vb.) |
| `<leader>cr` | Normal | **Rename** (sembolun adini degistir - tum dosyalarda) |
| `<leader>cf` | Normal | **Format** (dosyayi formatla) |
| `<leader>cd` | Normal | Satirdaki **hatayi/uyariyi** goster |

### Hatalar Arasi Gezinme

| Tus | Mod | Ne Yapar |
|-----|-----|----------|
| `]d` | Normal | **Sonraki** hataya/uyariya git |
| `[d` | Normal | **Onceki** hataya/uyariya git |
| `]e` | Normal | Sonraki **error'a** git |
| `[e` | Normal | Onceki **error'a** git |
| `]w` | Normal | Sonraki **warning'e** git |
| `[w` | Normal | Onceki **warning'e** git |

### Symbols Outline

| Tus | Mod | Ne Yapar |
|-----|-----|----------|
| `⌃ ⇧ o` | Normal | **Symbols Outline** panelini ac/kapat (fonksiyonlar, class'lar listesi) |

### Desteklenen Diller

| Dil | LSP Server | Formatter | Linter |
|-----|-----------|-----------|--------|
| TypeScript/JavaScript | ts_ls | prettier | eslint_d |
| Go | gopls | gofumpt | golangci-lint |
| Rust | rust-analyzer | rustfmt | - |
| Python | pyright | black | ruff |
| Java | jdtls | - | - |
| Lua | lua_ls (LazyVim) | stylua | - |

> Tum server/formatter/linter'lar Mason ile yonetilir. `:Mason` ile paneli acabilirsin.

---

## Hatalar ve Uyarilar (Trouble)

Projedeki tum hatalari, uyarilari ve diagnostik mesajlari tek bir panelde gor.

| Tus | Mod | Ne Yapar |
|-----|-----|----------|
| `<leader>xx` | Normal | **Tum hatalar/uyarilar** panelini ac/kapat |
| `<leader>xX` | Normal | **Sadece bu dosyadaki** hatalar |
| `<leader>xs` | Normal | **Semboller** listesi |
| `<leader>xq` | Normal | **Quickfix** listesi |

Trouble paneli icinde:

| Tus | Ne Yapar |
|-----|----------|
| `j` / `k` | Hatalar arasi gezin |
| `Enter` | Hatanin oldugu satira git |
| `q` | Paneli kapat |
| `o` | Hatayi ac (jump) |

> **Ipucu:** `Space x x` ile tum projedeki hatalari gor, `Enter` ile dogrudan o satira zipla.

---

## TODO Yorumlari

Kodda yazdgin `TODO`, `FIXME`, `HACK`, `WARN`, `NOTE`, `PERF` yorumlari otomatik renkli olarak vurgulanir.

### Desteklenen Etiketler

| Etiket | Renk | Kullanim |
|--------|------|----------|
| `TODO` | Mavi | Yapilacak is |
| `FIX` / `FIXME` / `BUG` | Kirmizi | Duzeltilecek hata |
| `HACK` | Turuncu | Gecici/kirli cozum |
| `WARN` / `WARNING` | Sari | Dikkat edilecek sey |
| `NOTE` / `INFO` | Yesil | Bilgi notu |
| `PERF` / `OPTIMIZE` | Mor | Performans iyilestirmesi |
| `TEST` | Pembe | Test ile ilgili |

### Kisa Yollar

| Tus | Mod | Ne Yapar |
|-----|-----|----------|
| `]t` | Normal | **Sonraki** TODO'ya git |
| `[t` | Normal | **Onceki** TODO'ya git |
| `<leader>st` | Normal | **Tum TODO'lari** Telescope ile listele |
| `<leader>sT` | Normal | Sadece **TODO/FIX/FIXME** listele |

### Ornek

```java
// TODO: Bu fonksiyonu refactor et
// FIXME: Null pointer exception oluyor
// HACK: Gecici cozum, sprint sonunda duzelt
// NOTE: Bu API v2'de kalkacak
// PERF: Bu sorgu cok yavas, index ekle
```

Yukaridaki yorumlar editorde farkli renklerde vurgulanir ve `]t` / `[t` ile aralarinda gezinebilirsin.

---

## Claude Code (AI Asistani)

Neovim icinden Claude Code AI asistanini kullanabilirsin.

### Onkosul

```bash
npm install -g @anthropic-ai/claude-code
```

### Kisa Yollar

| Tus | Mod | Ne Yapar |
|-----|-----|----------|
| `<leader>ac` | Normal | Claude Code terminal'ini **ac/kapat** |
| `⌃ \` | Terminal | Claude Code terminal'ini **ac/kapat** |
| `<leader>cC` | Normal | **Son konusmaya devam et** (--continue) |
| `<leader>cV` | Normal | **Verbose modda** ac (detayli cikti) |

### Komutlar

| Komut | Ne Yapar |
|-------|----------|
| `:ClaudeCode` | Terminal'i toggle et |
| `:ClaudeCodeContinue` | Son konusmaya devam et |
| `:ClaudeCodeResume` | Konusma listesinden sec |
| `:ClaudeCodeVerbose` | Detayli loglama ile ac |

### Claude Code Terminal'i Icinde

| Tus | Ne Yapar |
|-----|----------|
| `⌃ h` | Sol pencereye gec |
| `⌃ j` | Alt pencereye gec |
| `⌃ k` | Ust pencereye gec |
| `⌃ l` | Sag pencereye gec |
| `⌃ f` | Terminal'de sayfa asagi |
| `⌃ b` | Terminal'de sayfa yukari |
| `i` | Kaydirdiktan sonra tekrar yazmaya basla |

### Calisma Sekli

1. `Space a c` ile Claude Code'u ac
2. Claude ile sohbet et, kod yaz, soru sor
3. Claude dosya degistirirse **buffer'lar otomatik yenilenir** (bildirim ciktisindan gorursun)
4. `Space a c` ile tekrar kapat veya `⌃ \` ile toggle et
5. Konusmaya devam etmek icin `Space c C` (continue flag'i ile acar)

> Claude Code, git root'unu otomatik algilar ve oradan calisir.
> Terminal ekranin altinda %35 yukseklikte acilir.

---

## Git Islemleri

### LazyGit (Tam Git Arayuzu)

| Tus | Mod | Ne Yapar |
|-----|-----|----------|
| `<leader>gg` | Normal | **LazyGit'i ac** (tam ekran git yonetimi) |

LazyGit icinde commit atma, branch degistirme, push/pull, stash ve daha fazlasini yapabilirsin. `q` ile cikarsik.

### Gitsigns (Satir Bazli Git)

#### Git Gutter Isaretleri

Editorde sol tarafta gorunen isaretler:

| Isaret | Renk | Anlam |
|--------|------|-------|
| `▎` | Yesil | Yeni eklenen satir |
| `▎` | Mavi | Degisen satir |
| `` | Kirmizi | Silinen satir |
| `▎` | Mor | Takip edilmeyen (untracked) satir |

#### Git Hunk Islemleri

| Tus | Mod | Ne Yapar |
|-----|-----|----------|
| `]h` | Normal | Sonraki degisiklige (hunk) git |
| `[h` | Normal | Onceki degisiklige git |
| `<leader>ghs` | Normal | Hunk'i **stage'e** al |
| `<leader>ghr` | Normal | Hunk'i **geri al** (revert) |
| `<leader>ghp` | Normal | Hunk'i **onizle** (preview) |
| `<leader>ghb` | Normal | Satirin **blame'ini** gor |
| `<leader>ghd` | Normal | **Diff** goster |

---

## Git Diff View

Hangi dosyalar degismis, hangi satirlar eklenmis/silinmis, commit gecmisi - hepsini tek ekranda gor.

### Kisa Yollar

| Tus | Mod | Ne Yapar |
|-----|-----|----------|
| `<leader>gd` | Normal | **Diff View ac** - tum degisiklikleri gor (staged + unstaged) |
| `<leader>gD` | Normal | **Son commit ile karsilastir** (HEAD~1) |
| `<leader>gf` | Normal | **Bu dosyanin git gecmisi** (tum commit'leri) |
| `<leader>gF` | Normal | **Tum dosyalarin git gecmisi** |
| `<leader>gq` | Normal | **Diff View kapat** |

### Diff View Icinde

| Tus | Ne Yapar |
|-----|----------|
| `Tab` | Sonraki degisen dosyaya gec |
| `Shift+Tab` | Onceki degisen dosyaya gec |
| `-` | Dosyayi stage'e al / stage'den cikar |
| `X` | Dosyadaki degisikligi geri al (revert) |
| `R` | Diff'i yenile |
| `j` / `k` | Dosya listesinde gezin |
| `Enter` | Dosyanin diff'ini gor |
| `q` | Diff View'i kapat |

### Kullanim Ornekleri

```vim
:DiffviewOpen                    " Mevcut degisiklikleri gor
:DiffviewOpen HEAD~3             " Son 3 commit'in degisikliklerini gor
:DiffviewOpen origin/main...HEAD " PR'daki tum degisiklikleri gor (main ile karsilastir)
:DiffviewFileHistory %           " Su anki dosyanin tum gecmisi
:DiffviewFileHistory             " Tum repo'nun gecmisi
:DiffviewClose                   " Kapat
```

> **Ipucu:** `Space g d` ile Diff View ac, sol panelde degisen dosyalari gor,
> `Tab` ile dosyalar arasi gec, sag tarafta satir satir ne degismis gor.
> PR gondermeden once `Space g D` ile son commit'i kontrol et.

---

## Multi Cursor (vim-visual-multi)

Birden fazla imlec ile ayni anda duzenleme.

### Temel Kullanim

| Tus | Mod | Ne Yapar |
|-----|-----|----------|
| `⌃ n` | Normal | Imlec altindaki kelimeyi sec, tekrar basinca sonraki eslesmede yeni cursor |
| `⌃ ↓` | Normal | Asagiya bir cursor daha ekle |
| `⌃ ↑` | Normal | Yukariya bir cursor daha ekle |

### Multi-Cursor Modundayken

| Tus | Ne Yapar |
|-----|----------|
| `n` | Sonraki eslesmeye cursor ekle |
| `N` | Onceki eslesmeye cursor ekle |
| `q` | Bu eslemeyi atla, sonrakine gec |
| `Q` | Mevcut cursor'u kaldir |
| `Esc` | Multi-cursor modundan cik |

### Ornek Senaryo

1. Degistirmek istedigin degisken adinin ustune gel
2. `⌃ n` bas → kelime secilir
3. `⌃ n` tekrar bas → bir sonraki ayni kelime de secilir
4. Istedigin kadar tekrarla
5. `c` bas → hepsini ayni anda sil ve yeni adi yaz
6. `Esc` ile cik

---

## Not Tutma (Obsidian)

Neovim icinden Obsidian vault'unda not tut, daily note olustur, notlar arasi linkle.

### Onkosul

```bash
mkdir -p ~/notes/inbox ~/notes/daily
```

> Obsidian uygulamasinin kurulu olmasina **gerek yok**. Plugin direkt markdown dosyalari ile calisir.
> Ama Obsidian kuruluysa ikisi birlikte kullanilabilir (graph view vb. icin).

### Kisa Yollar

| Tus | Mod | Ne Yapar |
|-----|-----|----------|
| `<leader>nn` | Normal | **Yeni not** olustur |
| `<leader>nf` | Normal | **Not ara** (hizli gecis) |
| `<leader>ns` | Normal | **Notlarda icerik ara** |
| `<leader>nd` | Normal | **Bugunun notu** (daily note) |
| `<leader>nb` | Normal | Bu nota **baglanti verenler** (backlinks) |
| `<leader>nt` | Normal | **Etiketlere** gore ara |
| `<leader>nc` | Normal | **Checkbox** toggle (yapildi/yapilmadi) |
| `<leader>nl` | Normal | Bu nottaki **linkleri** listele |
| `<leader>np` | Normal | Panodan **resim yapistir** |
| `<leader>no` | Normal | Notu **Obsidian uygulamasinda** ac |

### Not Icinde Navigasyon

| Tus | Ne Yapar |
|-----|----------|
| `gf` | Link uzerindeyken linke git (wiki link `[[not]]`) |
| `Return ↩` | Akilli aksiyon (link ise ac, checkbox ise toggle) |
| `[[` yaz | Not adi otomatik tamamla |
| `#` yaz | Etiket otomatik tamamla |

### Ornek Is Akisi

1. `Space n d` → bugunun daily note'u acilir (`2026-02-25.md`)
2. Toplanti notlarini yaz
3. `[[proje-adi]]` ile baska notlara linkle
4. `- [ ] Yapilacak is` ile todo yaz, `Space n c` ile check/uncheck
5. `Space n f` ile herhangi bir nota hizlica gec

> Notlar `~/notes/inbox/` altinda olusturulur, daily note'lar `~/notes/daily/` altinda.

---

## Zen Mode (Odaklanma)

Dikkat dagitici her seyi gizle, sadece kod/yazi ile kal.

| Tus | Mod | Ne Yapar |
|-----|-----|----------|
| `<leader>z` | Normal | **Zen Mode** ac/kapat |

Zen Mode acildiginda:

- Satir numaralari gizlenir
- Sign column (git isaretleri) gizlenir
- Cursor line vurgusu kalkar
- Pencere 120 karakter genisliginde ortalanir
- Dikkat dagitici tum UI elemanları kaldırılır

Tekrar `Space z` ile normal gorunume don.

> **Ipucu:** Uzun bir kod yazarken veya markdown dosyasi duzenlerken muhtesem.

---

## Oturum Yonetimi (Persistence)

Neovim'i kapatip actiginda kaldigin yerden devam et. Acik dosyalar, pencere duzeni, tab'lar kaydedilir.

| Tus | Mod | Ne Yapar |
|-----|-----|----------|
| `<leader>qs` | Normal | **Bu klasorun oturumunu yukle** (en son kayit) |
| `<leader>ql` | Normal | **Son oturumu yukle** (herhangi bir klasor) |
| `<leader>qd` | Normal | **Oturum kaydetmeyi durdur** (bu seferlik) |

### Nasil Calisir?

- Neovim'den ciktiginda oturum **otomatik kaydedilir**
- Ayni klasorde `nvim` ile actiginda `Space q s` ile kaldigin yerden devam et
- Acik dosyalar, pencere duzeni ve cursor pozisyonlari geri gelir

---

## Plugin Yonetimi

### Lazy.nvim (Plugin Manager)

| Komut | Ne Yapar |
|-------|----------|
| `:Lazy` | Plugin yonetim panelini ac |
| `:Lazy sync` | Tum plugin'leri guncelle |
| `:Lazy health` | Saglik kontrolu yap |
| `:Lazy clean` | Kullanilmayan plugin'leri temizle |
| `:Lazy profile` | Performans bilgisi gor |

### Mason (LSP/Formatter/Linter Yoneticisi)

| Komut | Ne Yapar |
|-------|----------|
| `:Mason` | Mason panelini ac |
| `:MasonInstall <paket>` | Paket kur |
| `:MasonUninstall <paket>` | Paket kaldir |
| `:MasonUpdate` | Tum paketleri guncelle |

> Mason panelinde `i` ile kurulum, `X` ile kaldirma, `u` ile guncelleme yapabilirsin.

---

## Mac Ozel Notlar ve Onkosuller

### Gerekli Yazilimlar

```bash
# Homebrew ile kur
brew install neovim           # Neovim (0.10+)
brew install ripgrep           # Telescope arama icin gerekli
brew install node              # LSP server'lari icin gerekli
brew install git               # Git entegrasyonu
brew install lazygit           # LazyGit arayuzu

# Nerd Font kur (ikonlar icin sart)
brew install --cask font-jetbrains-mono-nerd-font

# Claude Code kur
npm install -g @anthropic-ai/claude-code
```

### Terminal Ayarlari

- **Font:** Terminal uygulamanda fontu **JetBrains Mono Nerd Font** (veya baska bir Nerd Font) olarak ayarla. Yoksa ikonlar bozuk gorunur.
- **True Color:** iTerm2, Kitty, WezTerm, Alacritty hepsi destekler. macOS varsayilan Terminal.app **desteklemez**.
- **Clipboard:** Config'de `unnamedplus` aktif. Neovim'de `y` ile kopyaladigin `⌘ V` ile baska yere yapistirabilirsin, tersi de gecerli.

### Onerilen Terminal Uygulamalari

| Uygulama | Ozellik |
|----------|---------|
| **iTerm2** | En yaygin, genis ozellik seti |
| **Kitty** | GPU hizlandirmali, hizli |
| **WezTerm** | Lua ile konfigure edilebilir |
| **Alacritty** | Minimal, en hizli |

---

## Sik Kullanilan Senaryolar

### "Bir dosya acmak istiyorum"

```
Space f f  →  dosya adini yaz  →  Enter
```

### "Projede bir kelime aramak istiyorum"

```
Space f g  →  kelimeyi yaz  →  sonuclardan sec
```

### "Belirli uzantidaki dosyalarda aramak istiyorum"

```
Space f s  →  kelime -g '*.ts'  →  Enter
```

### "Fonksiyonun tanimina gitmek istiyorum"

```
Imleci fonksiyon adinin ustune koy  →  gd
```

### "Degisken adini tum projede degistirmek istiyorum (LSP)"

```
Imleci degisken ustune koy  →  Space c r  →  yeni adi yaz  →  Enter
```

### "Degisken adini sadece bu dosyada degistirmek istiyorum"

```
Imleci degisken ustune koy  →  Space s  →  yeni adi yaz  →  Enter
```

### "Satirlarin yerini degistirmek istiyorum"

```
V ile satirlari sec  →  J (asagi) veya K (yukari) ile tasi
```

### "Dosya gezgininden dosya olusturmak istiyorum"

```
Space e  →  a  →  dosya adini yaz  →  Enter
(klasor olusturmak icin sona / koy: components/)
```

### "AI'dan yardim almak istiyorum"

```
Space a c  →  Claude Code acilir  →  soruyu yaz
```

### "Git commit atmak istiyorum"

```
Space g g  →  LazyGit acilir  →  stage, commit, push
```

### "Hangi dosyalar degismis gormek istiyorum"

```
Space g d  →  Diff View acilir  →  sol panelde degisen dosyalar, sagda diff
Tab ile dosyalar arasi gec  →  Space g q ile kapat
```

### "Projedeki tum TODO'lari gormek istiyorum"

```
Space s t  →  Telescope ile tum TODO/FIXME/HACK listesi  →  Enter ile git
```

### "Tum hatalari tek yerde gormek istiyorum"

```
Space x x  →  Trouble paneli acilir  →  j/k ile gezin  →  Enter ile git
```

### "Ekranda uzak bir yere hizlica gitmek istiyorum"

```
s bas  →  gitmek istedigin yerdeki 2 harf yaz  →  cikan etikete bas
```

### "Odaklanmak istiyorum, dikkat dagitici seyleri kaldir"

```
Space z  →  Zen Mode acilir  →  tekrar Space z ile kapat
```

### "Not almak istiyorum"

```
Space n d  →  bugunun daily note'u  →  yaz  →  :w ile kaydet
Space n n  →  yeni not olustur
Space n f  →  notlar arasi gec
```

### "Dun nerde kalmistim?"

```
nvim ile projeyi ac  →  Space q s  →  son oturum yuklenir (dosyalar, pencereler)
```

### "Dosyalar arasi hizlica gecis yapmak istiyorum"

```
H  →  onceki buffer
L  →  sonraki buffer
Space f b  →  buffer listesi
```

### "Neo-tree'ye gecip dosya islemleri yapmak istiyorum"

```
⌃ h  →  Neo-tree'ye gecis
j/k ile gezin  →  a ile yeni dosya  →  d ile sil  →  r ile adini degistir
⌃ l  →  editore geri don
```

---

## Which-Key

Herhangi bir anda `Space` tusuna basip bekle - **which-key** paneli acilir ve tum mumkun kisa yollari kategorize sekilde gosterir. Nereden basla bilmiyorsan `Space` bas ve kesfet.

| Kok Tus | Kategori |
|---------|----------|
| `<leader>f` | **Find** - dosya ve icerik arama |
| `<leader>g` | **Git** - git islemleri, diff view, blame |
| `<leader>c` | **Code** - code action, rename, format |
| `<leader>b` | **Buffer** - buffer yonetimi |
| `<leader>w` | **Window** - pencere yonetimi |
| `<leader>a` | **AI** - Claude Code |
| `<leader>s` | **Search** - arama, TODO listesi |
| `<leader>x` | **Trouble** - hatalar, uyarilar, diagnostics |
| `<leader>n` | **Notes** - not tutma (Obsidian) |
| `<leader>q` | **Session** - oturum kaydet/yukle |
| `<leader>z` | **Zen** - odaklanma modu |
| `<leader><tab>` | **Tab** - tab yonetimi |

> **Ipucu:** Yeni baslayanlar icin en iyi yontem: `Space` basip which-key'in gosterdiklerine bakmak.
