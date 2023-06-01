<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:db="http://docbook.org/ns/docbook"
                xmlns:m="http://docbook.org/ns/docbook/modes"
                xmlns:xs="http://www.w3.org/2001/XMLSchema"
                xmlns="http://www.w3.org/1999/xhtml"
                exclude-result-prefixes="#all"
                version="3.0">

<xsl:import href="docbook.xsl"/>
<xsl:import href="https://cdn.docbook.org/release/xsltng/current/xslt/docbook-paged.xsl"/>

<xsl:param name="output-media" select="'print'"/>

<xsl:template match="*" mode="m:html-head-last">
  <link rel="stylesheet" href="css/paged.css"/>
</xsl:template>

</xsl:stylesheet>
