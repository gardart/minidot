# minidot
dotfiles fyrir Linux þjóna

## Uppsetning
`sh -c "$(curl -fsSL https://raw.githubusercontent.com/gardart/minidot/main/bootstrap)"`

# Cheatsheet

## Vim

| Flýtivísun | Lýsing |
| -------- | ----------- |
| **`<Ctrl-hjkl>`** | Fara á milli glugga með hjkl án þess að þurfa að ýta líka á w (einnig hægt færa sig á milli tmux glugga) |
| **`,o`** | Loka öllum öðrum gluggum |
| **`,,`** | Opna síðasta "buffer" |
| **`<Shift-TAB>`** | Flakka á milli "buffera" |
| **`,d`** | Opna/Loka NERDTree |
| **`,<space>`** | Slökkva á highlighting (virkjast aftur í næstu leit) |
| **`,l`** | Velja hvort línur séu í númeraröð eða "relative numbers" |
| **`,1`** | Slökkva/kveikja á línunúmerum |
| **`,"`** | Setja gæsalappir eða eitthvað annað utan um valinn text |
| **`,'[{<`** | Virkar einnig með annarskonar hornklofum |
| **`,ev`** | Opna vimrc |
| **`,sv`** | Endurhlaða vimrc eftir breytingar |
| **`,t`** | Slökkva/kveikja á paste mode |
| **`ds / cs`** | Eyða eða breyta gæsalöppum með vim-surround |
| **`gcc`** | Setja inn eða taka út comment fyrir viðkomandi línu |
| **`gc`** | Setja inn eða taka út comment fyrir valinn texta (visual mode) |
| **`J/K`** | Færa valinn texta upp eða niður í "visual mode" |

## Search Replace í visual mode

Hægt er að velja texta og nota hann sem input í search/replace
Dæmi:
Vel texta með visual mode eins og gardar og keyri svo eftirfarandi skipun
```
:s//nafn=\1
```
Þá breytist gardar í nafn=gardar

Ef gardar inniheldur bil á undan þá þarf að taka út whitespace með regex
```
:s/\(\w.*\)/nafn=\1
```

Skipunin brotin niður:
```
:s = substitute -> :[range]s[ubstitute]/{pattern}/{string}/[flags] [count] 
\(\w.*\) = regex leit, sleppa whitespace í upphafi en hafa alla strengi með þar á eftir
nafn=\1 = \1 er niðurstaðan úr leitinni notuð aftur
```

## tmux
https://tmuxcheatsheet.com

Opna nýtt tmux session og gefa því ásamt glugganum nafn
```
tmux new -s podman -n containerA
```

|| Flýtivísun | Lýsing |
| -------- | -------- | ----------- |
| **`Ctrl`** | **`h j k l`** | Fara á milli gluggasvæða með hjkl án þess að þurfa að ýta á b líka, skilur einnig Vim splits |
| `Ctrl+b` | **`d`** | Aftengja tmux session |
| `Ctrl+b` | **`-`** | Skipta glugganum lárétt (einnig hægt með `"`) |
| `Ctrl+b` | **`ö`** | Skipta glugganum lóðrétt (einnig hægt með `%`) |
| `Ctrl+b` | **`c`** | Búa til nýjan tmux glugga og fara í sömu möppuna |
| `Ctrl+b` | **`b`** | Breyta gluggasvæðinu í sjálfstæðann glugga |
| `Ctrl+b` | **`n/p`** | Skipta yfir á næsta eða fyrri glugga |
| `Ctrl+b` | **`,`** | Endurskýra gluggann |
| `Ctrl+b` | **`↑ → ↓ ←`** | Stækka/minnka glugga |
  
