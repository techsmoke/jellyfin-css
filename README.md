# jellyfin-css

Netflix-artige Custom-CSS fuer Jellyfin `10.11.x`.

Die Auslieferung erfolgt als genau eine einbindbare Datei:

- `dist/jellyfin.css`

## Ziel

Dieses Repo liefert eine dunkle, dichtere und filmischere Oberflaeche fuer Jellyfin, ohne JavaScript, ohne externe Bilder und ohne externe Fonts. Die CSS ist fuer die normale Jellyfin-Weboberflaeche, Login, Dashboard und Player gedacht.

## Einbindung in Jellyfin

In Jellyfin unter `Dashboard -> General -> Custom CSS` eintragen:

```css
@import url('https://cdn.jsdelivr.net/gh/techsmoke/jellyfin-css@main/dist/jellyfin.css');
```

Fuer spaetere stabile Versionen besser mit Tag statt `@main`, zum Beispiel:

```css
@import url('https://cdn.jsdelivr.net/gh/techsmoke/jellyfin-css@v1.0.0/dist/jellyfin.css');
```

## Empfohlene Basis

- Jellyfin Web `10.11.x`
- dunkles Jellyfin-Grundtheme

Andere eingebaute Jellyfin-Themes koennen funktionieren, sind aber nicht die Zielbasis fuer diese Version.

## Projektstruktur

- `src/scss/index.scss`: interner Einstiegspunkt
- `src/scss/_tokens.scss`: Farbpalette, Radius, Schatten, Abstaende
- `src/scss/_base.scss`: globale Grundflaechen, Buttons, Inputs, Dialoge
- `src/scss/_shell.scss`: Header, Drawer, Tabs, Shell
- `src/scss/_home.scss`: Startseite, Reihen, Karten, Scroller
- `src/scss/_details.scss`: Detailseiten, Hero-Bereich, Metadaten, Cast
- `src/scss/_login.scss`: Login-Oberflaeche
- `src/scss/_dashboard.scss`: Admin-Bereich
- `src/scss/_player.scss`: Video-OSD
- `src/scss/_responsive.scss`: Mobil- und kleine Viewports
- `dist/jellyfin.css`: fertige Ausgabedatei
- `scripts/build.ps1`: erzeugt `dist/jellyfin.css` aus den Quelldateien

## Build

Das Repo verwendet absichtlich kein zusaetzliches Node-Setup. Die Quelldateien sind SCSS-kompatibel aufgebaut, bleiben aber syntaktisch bewusst nah an normalem CSS. Der Build wird per PowerShell zusammengesetzt:

```powershell
pwsh -File .\scripts\build.ps1
```

## Designrichtung

- dunkle Kinoflaechen statt neutraler Admin-Anmutung
- staerkerer Fokus auf Poster, Backdrops und Reihenwirkung
- abgerundete Karten und Panels
- klare Kontraste fuer Interaktion, Lesbarkeit und Fokus
- konsistente Sprache zwischen Hauptoberflaeche, Login, Dashboard und Player

## Grenzen

- V1 ist auf CSS-Overrides begrenzt
- keine Assets ausserhalb der einen CSS-Datei
- keine Garantie fuer jedes kuenftige Jellyfin-Markup ausserhalb von `10.11.x`
