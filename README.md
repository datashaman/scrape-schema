The XSLT stylesheet scrapes the metadata for the schema definitions
found on [schema.org](http://schema.org/), transforming them into CoffeeScript class
definitions.

A shell script is provided, which uses xsltproc to effect a transform.

Use it like so:
    ./scrape-schema.sh http://schema.org/Person > Person.coffee

Downloading the HTML file and working on a local copy would be polite!
:)

The fields module is not supplied, since I didn't want this version to be
too system-specific. It's based on the [Kanso fields module](http://kansojs.org/docs.html#fields), date type is
the only addon field for now.
