<?xml version="1.0"?>
<xsl:stylesheet version="1.0" 
           xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="text" />                                   

<xsl:template match="/">                                       <!-- A -->
    <xsl:apply-templates select="//OilPalette" />              <!-- B -->
</xsl:template>                                                <!-- C -->

<xsl:template match="WaterColorsPalette">                      <!-- D -->
    <xsl:text>WaterColorsPalette Selected</xsl:text>           <!-- E -->
</xsl:template>                                                <!-- F -->

<xsl:template match="OilPalette">                              <!-- G -->
    <xsl:text>OilPalette Selected</xsl:text>                   <!-- H -->
</xsl:template>                                                <!-- I -->

</xsl:stylesheet>
