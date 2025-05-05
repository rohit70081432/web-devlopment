<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl: output method="html"/>

    <xsl:template match="/">
        <html>
            <head>
                <title>Bookstore</title>
                <link rel="stylesheet" type="text/css" href="Rule.css"/>
            </head>
            <body>
                <h2>Bookstore Inventory</h2>
                <table border="1">
                    <tr bgcolor="#add8e6">
                        <th>Category</th>
                        <th>Title</th>
                        <th>Language</th>
                        <th>Author(s)</th>
                        <th>Year</th>
                        <th>Price</th>
                        <th>Cover</th>
                    </tr>
                    
                    <!-- Match all book elements (book, book2, book3, book4) -->
                    <xsl:for-each select="bookstore/book">
                        <tr>
                            <td><xsl:value-of select="@category"/></td>
                            <td><xsl:value-of select="title"/></td>
                            <td><xsl:value-of select="title/@lang"/></td>
                            <td>
                                <xsl:for-each select="author">
                                    <xsl:value-of select="."/>
                                    <xsl:if test="position() != last()">, </xsl:if>
                                </xsl:for-each>
                            </td>
                            <td><xsl:value-of select="year"/></td>
                            <td><xsl:value-of select="price"/></td>
                            <td>
                                <xsl:choose>
                                    <xsl:when test="@cover">
                                        <xsl:value-of select="@cover"/>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        N/A
                                    </xsl:otherwise>
                                </xsl:choose>
                            </td>
                        </tr>
                    </xsl:for-each>
                    
                </table>
            </body>
        </html>
    </xsl:template>

</xsl:stylesheet>
