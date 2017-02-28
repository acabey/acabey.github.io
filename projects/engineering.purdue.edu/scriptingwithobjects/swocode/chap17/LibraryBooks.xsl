<?xml version="1.0"?>
<xsl:stylesheet version="1.0" 
           xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" />                                   <!-- A -->

<xsl:template match="/">                                       <!-- B -->
<HTML>                                     
<HEAD>                                     
<TITLE>My Library of Books and CDs</TITLE> 
</HEAD>                                    
<BODY BGCOLOR="white">                     
<PRE>                                      
</PRE>                                     
<TABLE BORDER="5" CELLPADDING="4" CELLSPACING="2">             <!-- J -->
<TR>                                       
<TD>Title</TD><TD>Author or Artist Name</TD>
</TR>                                                          <!-- K -->
<xsl:for-each select="//BOOK" >                                <!-- L -->
<!-- <xsl:sort select="AUTHOR/LASTNAME" />  -->
<xsl:sort />
<TR>
<TD>
    <xsl:value-of select="TITLE" />                            <!-- M -->
    </TD>
    <TD>
        <xsl:value-of select="AUTHOR/FIRSTNAME" />             <!-- N -->
        <xsl:text> </xsl:text>                                 <!-- O -->
        <xsl:value-of select="AUTHOR/LASTNAME" />              <!-- P -->
    </TD>
    </TR>
</xsl:for-each>                                                <!-- Q -->
</TABLE>
</BODY>
</HTML>
</xsl:template> 
</xsl:stylesheet>