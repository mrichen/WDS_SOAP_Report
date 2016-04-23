<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:param name="sample_worker"/>
	<xsl:param name="wss.usernametoken.username"/>
	<xsl:param name="wss.usernametoken.password"/>
	
	<xsl:template match="/">
		<env:Envelope
    		xmlns:env="http://schemas.xmlsoap.org/soap/envelope/"
    		xmlns:xsd="http://www.w3.org/2001/XMLSchema">
    		<env:Header>
    			<wsse:Security env:mustUnderstand="1" 
    						   xmlns:wsse="http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-secext-1.0.xsd">
                    <wsse:UsernameToken>
                        <wsse:Username>
                            <xsl:value-of select="$wss.usernametoken.username"/>
                        </wsse:Username>
                        <wsse:Password Type="http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-username-token-profile-1.0#PasswordText">
                            <xsl:value-of select="$wss.usernametoken.password"/>
                        </wsse:Password>
                    </wsse:UsernameToken>
                </wsse:Security>
    		</env:Header>
    		<env:Body>
        		<ns:Execute_Report xmlns:ns="urn:com.workday.report/Worker_Benefits_MCR">
            		<ns:Report_Parameters>
                		<ns:Worker>
                    		<ns:ID ns:type="Employee_ID"><xsl:value-of select="$sample_worker"/></ns:ID>
                		</ns:Worker>
            		</ns:Report_Parameters>
        		</ns:Execute_Report>
    		</env:Body>
</env:Envelope>
	</xsl:template>
</xsl:stylesheet>