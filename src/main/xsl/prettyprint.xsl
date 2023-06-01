<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xs="http://www.w3.org/2001/XMLSchema"
                xmlns:h="http://www.w3.org/1999/xhtml"
		exclude-result-prefixes="#all"
                version="2.0">

<xsl:output method="xml" indent="yes"/>
<xsl:strip-space elements="*"/>

<xsl:param name="unordered" as="xs:decimal" select="0"/>
<xsl:param name="discardns" as="xs:decimal" select="0"/>
<xsl:param name="discardscript" as="xs:decimal" select="0"/>
<xsl:param name="discardstyle" as="xs:decimal" select="0"/>

<xsl:template match="h:script[$discardscript != 0]"
              priority="10"/>

<xsl:template match="h:style[$discardstyle != 0]"
              priority="10"/>

<xsl:template match="*[$discardns = 0]">
  <xsl:copy>
    <xsl:copy-of select="@id"/>
    <xsl:copy-of select="@xml:id"/>
    <xsl:for-each select="@* except (@id|@xml:id)">
      <xsl:sort select="namespace-uri(.)"/>
      <xsl:sort select="local-name(.)"/>
      <xsl:copy-of select="."/>
    </xsl:for-each>

    <xsl:choose>
      <xsl:when test="$unordered != 0 and * and empty(./text())">
        <xsl:for-each select="*">
          <xsl:sort select="concat(namespace-uri(.),' ',local-name(.))"/>
          <xsl:apply-templates select="."/>
        </xsl:for-each>
      </xsl:when>
      <xsl:when test="$unordered != 0 and *">
        <xsl:message>Text in <xsl:value-of select="local-name(.)"/></xsl:message>
        <xsl:apply-templates/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:apply-templates/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:copy>
</xsl:template>

<xsl:template match="*[$discardns != 0]">
  <xsl:element name="{local-name(.)}">
    <xsl:copy-of select="@id"/>
    <xsl:copy-of select="@xml:id"/>
    <xsl:for-each select="@* except (@id|@xml:id)">
      <xsl:sort select="namespace-uri(.)"/>
      <xsl:sort select="local-name(.)"/>
      <xsl:copy-of select="."/>
    </xsl:for-each>

    <xsl:choose>
      <xsl:when test="$unordered != 0 and * and empty(./text())">
        <xsl:for-each select="*">
          <xsl:sort select="local-name(.)"/>
          <xsl:apply-templates select="."/>
        </xsl:for-each>
      </xsl:when>
      <xsl:when test="$unordered != 0 and *">
        <xsl:message>Text in <xsl:value-of select="local-name(.)"/></xsl:message>
        <xsl:apply-templates/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:apply-templates/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:element>
</xsl:template>

<xsl:template match="comment()">
  <xsl:if test="not(preceding-sibling::node()[1][self::comment()])">
    <xsl:text>&#10;</xsl:text>
    <xsl:text>&#10;</xsl:text>
  </xsl:if>
  <xsl:copy/>
  <xsl:text>&#10;</xsl:text>
</xsl:template>

<xsl:template match="processing-instruction()">
  <xsl:if test="not(preceding-sibling::node()[1][self::processing-instruction()])">
    <xsl:text>&#10;</xsl:text>
  </xsl:if>
  <xsl:copy/>
  <xsl:text>&#10;</xsl:text>
</xsl:template>

</xsl:stylesheet>
