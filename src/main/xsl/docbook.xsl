<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:db="http://docbook.org/ns/docbook"
                xmlns:f="http://docbook.org/ns/docbook/functions"
                xmlns:fp="http://docbook.org/ns/docbook/functions/private"
                xmlns:h="http://www.w3.org/1999/xhtml"
                xmlns:m="http://docbook.org/ns/docbook/modes"
                xmlns:mp="http://docbook.org/ns/docbook/modes/private"
                xmlns:rddl="http://www.rddl.org/"
                xmlns:t="http://docbook.org/ns/docbook/templates"
                xmlns:tp="http://docbook.org/ns/docbook/templates/private"
                xmlns:v="http://docbook.org/ns/docbook/variables"
                xmlns:xs="http://www.w3.org/2001/XMLSchema"
                xmlns="http://www.w3.org/1999/xhtml"
                exclude-result-prefixes="#all"
                version="3.0">

<xsl:import href="https://cdn.docbook.org/release/xsltng/current/xslt/docbook.xsl"/>

<xsl:param name="component-numbers" select="'false'"/>

<xsl:variable name="v:custom-localizations">
  <locale xmlns="http://docbook.org/ns/docbook/l10n/source"
          language="en"
          english-language-name="English">
    <group name="title-unnumbered">
      <template match="self::db:chapter">%c</template>
    </group>
  </locale>
</xsl:variable>

<xsl:variable name="v:templates" as="document-node()">
  <xsl:document xmlns:tmp="http://docbook.org/ns/docbook/templates">
    <db:book>
      <header>
        <tmp:apply-templates select="db:title">
          <h1><tmp:content/></h1>
        </tmp:apply-templates>
        <tmp:apply-templates select="db:subtitle">
          <h2><tmp:content/></h2>
        </tmp:apply-templates>
        <tmp:apply-templates select="db:authorgroup">
          <div class="authorgroup">
            <tmp:apply-templates select="db:author">
              <div class="author">
                <h3><tmp:content/></h3>
              </div>
            </tmp:apply-templates>
            <tmp:apply-templates select="db:editor">
              <div class="author">
                <h3><tmp:content/></h3>
              </div>
            </tmp:apply-templates>
          </div>
        </tmp:apply-templates>
        <tmp:apply-templates select="db:author">
          <div class="author">
            <h3><tmp:content/></h3>
          </div>
        </tmp:apply-templates>
        <tmp:apply-templates select="db:editor">
          <div class="editor">
            <h3><tmp:content/></h3>
          </div>
        </tmp:apply-templates>
        <tmp:apply-templates select="db:releaseinfo">
          <p class="releaseinfo">
            <tmp:content/>
          </p>
        </tmp:apply-templates>
        <tmp:apply-templates select="db:pubdate">
          <p class="pubdate"><tmp:content/></p>
        </tmp:apply-templates>
        <tmp:apply-templates select="db:legalnotice"/>
        <tmp:apply-templates select="db:abstract"/>
        <tmp:apply-templates select="db:copyright"/>
      </header>
    </db:book>
  </xsl:document>
</xsl:variable>

<xsl:template match="*" mode="m:html-head-last">
  <link rel="stylesheet" href="css/presentation.css"/>
</xsl:template>

<xsl:param name="chunk-exclude"
           select="('self::db:partintro',
                    'self::*[ancestor::db:partintro]',
                    'self::db:annotation',
                    'self::db:section',
                    'self::db:toc')"/>

</xsl:stylesheet>
