# Huisstijl Lab023

Gedeelde stijl voor alle sites (mijnverbruik, mijnradar, en verder).
Eén bron voor lettertype, kleuren en de kop "Mijn + thema".

## Bestanden

- `huisstijl.css` — het gedeelde stijlbestand (de bron).
- `voorbeeld.html` — toont de kop voor Weer, Verbruik en Radar.
- `verspreid-huisstijl.ps1` — kopieert `huisstijl.css` naar elke deelnemende site.

## De kop gebruiken

In de `<head>` van elke site:

```html
<link rel="stylesheet" href="huisstijl.css">
```

De site-inhoud in het paneel zetten en de kop plaatsen:

```html
<main class="app">
  <h1 class="merk">Mijn<em>Verbruik</em></h1>
  <div class="merk-sub">Bijgewerkt: ...</div>
  ...
</main>
```

Alleen het woord tussen `<em>` verandert per site (Weer, Verbruik, Radar).
Dat woord krijgt automatisch de blauwe themakleur. Voor kaarten is er de
klasse `kaart` met de glaslook.

## Stijl wijzigen en verspreiden

Pas alleen `huisstijl.css` in deze map aan. Verspreid de wijziging daarna naar
elke deelnemende site met het script (PowerShell):

```
cd C:\Lab023\huisstijl
.\verspreid-huisstijl.ps1
```

Het script werkt alleen sitemappen bij waar al een `huisstijl.css` in staat.
Een nieuwe site laat je meedoen door er eenmalig een `huisstijl.css` in te zetten.

Na het verspreiden moeten de bijgewerkte sites nog naar de webserver (`scp`)
en naar GitHub (`git push`). Dat blijft bewust een aparte stap per site.

## Kleuren

Het blauw van het thema staat in `--accent` (`#4dabf7`). De overige kleuren
(achtergrond, panelen, randen, tekst) staan in hetzelfde `:root`-blok bovenin.
