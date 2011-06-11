<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:output method="text"/>

<xsl:variable name="nl"><xsl:text>&#xa;</xsl:text></xsl:variable>
<xsl:variable name="tab"><xsl:text>    </xsl:text></xsl:variable>

<xsl:template name="type">
    <xsl:param name="input" />
    <xsl:choose>
    <xsl:when test="$input/text()='Text'">string(</xsl:when>
    <xsl:when test="$input/text()='URL'">url(</xsl:when>
    <xsl:when test="$input/text()='Date'">date(</xsl:when>
    <xsl:when test="$input/text()='Boolean'">boolean(</xsl:when>
    <xsl:when test="$input/text()='Number'">number(</xsl:when>
    <xsl:otherwise>embed(
    <xsl:value-of select="$tab" />type: <xsl:value-of select="$input" />
    </xsl:otherwise>
    </xsl:choose>
</xsl:template>

<xsl:template match="/">
<xsl:variable name="thing" select="//h1[@class='page-title']/a[position()=last()]/@href" />
<xsl:variable name="super" select="//h1[@class='page-title']/a[position()=last()-1]/@href" />
<xsl:value-of select="$super" /> = require './<xsl:value-of select="$super" />'

class <xsl:value-of select="$thing"/> extends <xsl:value-of select="$super" /><xsl:value-of select="$nl" />
<xsl:for-each select="//tbody[@class='supertype'][position()=last()]/tr">
    <xsl:value-of select="$tab" /><xsl:value-of select="th[@class='prop-nam']/code/text()" /> = fields.<xsl:call-template name="type"><xsl:with-param name="input" select="td[@class='prop-ect']" /></xsl:call-template>
    <xsl:value-of select="$nl" />
    <xsl:value-of select="$tab" /><xsl:value-of select="$tab" />description: "<xsl:value-of select="td[@class='prop-desc']" />"
    )<xsl:value-of select="$nl" />
</xsl:for-each>

module.exports = <xsl:value-of select="$thing" />
</xsl:template>

</xsl:stylesheet>
