<?xml version="1.0"?>
<xsl:stylesheet version="1.0" 
           xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="text" />                                   <!-- A -->
<xsl:template match="WaterColorsPalette">                      <!-- B -->
    <xsl:value-of select="@country" />                         <!-- C -->
</xsl:template>
</xsl:stylesheet>
