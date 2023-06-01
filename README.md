# MarkupUK 2023
## Paged Media with the DocBook xslTNG Stylesheets

These are the materials I presented about DocBook xslTNG for paged
media in a short, ten minute “guest spot” during Tony Graham's
pre-conference talk at Markup UK 2023.

## Seeing the talk

I’ve published it in [GitHub pages](https://ndw.github.io/markupuk-2023-docbook/index.html).

## Building the talk

Running `./gradlew publish` should produce the HTML output in `build/docbook`.

Running `./gradlew publish.pdf` should produce the PDF output, though
it will require Antenna House Formatter and possibily fiddling with the
`antennahouse` setting in `gradle.properties`.

To be honest, this was thrown together quickly and isn’t really very flexible.
YMMV.
