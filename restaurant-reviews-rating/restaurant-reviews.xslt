<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl"
>
    <xsl:output method="xml" indent="yes"/>
    <xsl:param name="minRating">0</xsl:param>
    <xsl:template match="/">
      <div>
        <xsl:choose>
          <xsl:when test="count(restaurants/restaurant[rating &gt; $minRating]) &gt; 0">
            <xsl:apply-templates select="restaurants/restaurant[rating &gt; $minRating]">
              <xsl:sort select="rating" order="descending"/>
            </xsl:apply-templates>
          </xsl:when>
          <xsl:otherwise>
            <p class="text-center">No restaurants found with rating above <xsl:value-of select="$minRating"/>.</p>
          </xsl:otherwise>
        </xsl:choose>
      </div>
    </xsl:template>
    <xsl:template match="restaurant">
      <h2><xsl:value-of select="name"/></h2>
      <div>
        <ul>
          <li>Address: <xsl:value-of select="location/address"/>,
                       <xsl:value-of select="location/city"/>,
                       <xsl:value-of select="location/province"/>,
                       <xsl:value-of select="location/postalCode"/></li>
          <li>Phone: (<xsl:value-of select="phone/areaCode"/>) <xsl:value-of select="phone/number"/></li>
        </ul>
        <h3>Summary:</h3>
        <div class="text-center"><xsl:value-of select="summary"/></div>
        <h3>Rating:</h3>
        <div class="text-center"><xsl:value-of select="rating"/></div>
        <h3>Menu:</h3>
        <div>
          <table class="custom-table">
            <tr>
              <th>Description</th>
              <th>Quantity</th>
              <th>Price</th>
            </tr>
            <tr>
              <th colspan="3">Appetizers</th>
            </tr>
            <xsl:for-each select="menu/appetizers/appetizer">
              <xsl:sort select="price" data-type="number"/>
              <tr>
                <td><xsl:value-of select="name"/></td>
                <td><xsl:choose>
                    <xsl:when test="price/@quantity">
                      <xsl:value-of select="price/@quantity"/>
                    </xsl:when>
                    <xsl:otherwise>
                      1
                    </xsl:otherwise>
                </xsl:choose></td>
                <td><xsl:value-of select="price"/></td>
              </tr>
            </xsl:for-each>
            <tr>
              <th colspan="3">Entrees</th>
            </tr>
            <xsl:for-each select="menu/entrees/entree">
              <xsl:sort select="price" data-type="number"/>
              <tr>
                <td><xsl:value-of select="name"/></td>
                <td><xsl:choose>
                    <xsl:when test="price/@quantity">
                      <xsl:value-of select="price/@quantity"/>
                    </xsl:when>
                    <xsl:otherwise>
                      1
                    </xsl:otherwise>
                </xsl:choose></td>
                <td>
                  <xsl:value-of select="price"/>
                </td>
              </tr>
            </xsl:for-each>
          </table>
        </div>
      </div>
    </xsl:template>  
</xsl:stylesheet>
