<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl = 
          "http://www.w3.org/1999/XSL/Transform" version = "1.0" > 
<xsl:output method = "text" indent = "yes" /> 

<xsl:template match = "/" >                                    <!-- A -->
    <xsl:apply-templates select = "//BBB" />                   <!-- B -->
</xsl:template>                                                <!-- C -->

<xsl:template match = "BBB" >                                  <!-- D -->
    <xsl:apply-templates select = "//CCC" />                     <!-- E -->
</xsl:template>                                                <!-- F -->

<xsl:template match = "CCC" >                                  <!-- G -->
    <xsl:value-of select = "." />                              <!-- H -->
</xsl:template>                                                <!-- I -->

</xsl:stylesheet> 
