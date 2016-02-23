<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns="http://www.w3.org/2000/svg" xmlns:x="http://ns.adobe.com/Extensibility/1.0/"
	xmlns:i="http://ns.adobe.com/AdobeIllustrator/10.0/"
	xmlns:graph="http://ns.adobe.com/Graphs/1.0/" xmlns:xlink="http://www.w3.org/1999/xlink"
	xmlns:sfw="http://ns.adobe.com/SaveForWeb/1.0/">
	<xsl:output method="xml" indent="yes" standalone="no" doctype-public="-//W3C//DTD SVG 1.1//EN"
		doctype-system="http://www.w3.org/Graphics/SVG/1.1/DTD/svg11.dtd" media-type="image/svg"/>
	<xsl:strip-space elements="*" />
	<!-- http://media.britishhorseracing.com/images/bha_silks/?id=331702151702101702&size=300&type=&builder=true&part=  bodyid,bodycolorid,bodypatterncolorid,sleeveid,sleevecolorid,sleevepatterncolorid, hatid, hatcolorid, hatpatterncolorid-->
	<!-- colour text translate template -->
	<xsl:template name="colourtexttorgb">
		<xsl:param name="name"/>
		<xsl:choose>
			<xsl:when test="$name = 'beige'"><xsl:text>#FFF2C7</xsl:text></xsl:when><!-- data code 01 -->
			<xsl:when test="$name = 'black'"><xsl:text>#12242f</xsl:text></xsl:when><!-- data code 02 -->
			<xsl:when test="$name = 'brown'"><xsl:text>#794440</xsl:text></xsl:when><!-- data code 03 -->
			<xsl:when test="$name = 'dark blue'"><xsl:text>#004890</xsl:text></xsl:when><!-- data code 04 -->
			<xsl:when test="$name = 'dark green'"><xsl:text>#006351</xsl:text></xsl:when><!-- data code 05 -->
			<xsl:when test="$name = 'emerald green'"><xsl:text>#1fb259</xsl:text></xsl:when><!-- data code 06 -->
			<xsl:when test="$name = 'grey'"><xsl:text>#959ca1</xsl:text></xsl:when><!-- data code 07 -->
			<xsl:when test="$name = 'light blue'"><xsl:text>#a0cced</xsl:text></xsl:when><!-- data code 08 -->
			<xsl:when test="$name = 'light green'"><xsl:text>#6db43e</xsl:text></xsl:when><!-- data code 09 -->
			<xsl:when test="$name = 'maroon'"><xsl:text>#b30337</xsl:text></xsl:when><!-- data code 10 -->
			<xsl:when test="$name = 'mauve'"><xsl:text>#b3a1cd</xsl:text></xsl:when><!-- data code 11 -->
			<xsl:when test="$name = 'orange'"><xsl:text>#f78e1e</xsl:text></xsl:when><!-- data code 12 -->
			<xsl:when test="$name = 'pink'"><xsl:text>#fac8ca</xsl:text></xsl:when><!-- data code 13 -->
			<xsl:when test="$name = 'purple'"><xsl:text>#542989</xsl:text></xsl:when><!-- data code 14 -->
			<xsl:when test="$name = 'red'"><xsl:text>#ee2e23</xsl:text></xsl:when><!-- data code 15 -->
			<xsl:when test="$name = 'royal blue'"><xsl:text>#0068b3</xsl:text></xsl:when><!-- data code 16 -->
			<xsl:when test="$name = 'white'"><xsl:text>#ffffff</xsl:text></xsl:when><!-- data code 17 -->
			<xsl:when test="$name = 'yellow'"><xsl:text>#fff352</xsl:text></xsl:when><!-- data code 18 -->
			<xsl:when test="starts-with($name,'#')">
				<xsl:value-of select="$name"/>
			</xsl:when>
			<xsl:otherwise><xsl:text>#ffffff</xsl:text></xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="primaryfill">
		<xsl:attribute name="fill">
			<xsl:choose>
				<xsl:when test="colour">
					<xsl:call-template name="colourtexttorgb">
						<xsl:with-param name="name" select="colour"/>
					</xsl:call-template>
				</xsl:when>
				<xsl:otherwise>
					<xsl:call-template name="colourtexttorgb">
						<xsl:with-param name="name" select="//colour[1]"/>
					</xsl:call-template>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:attribute>
	</xsl:template>
	<xsl:template name="patternfill">
		<xsl:attribute name="fill">
			<xsl:choose>
				<xsl:when test="patterncolour">
					<xsl:call-template name="colourtexttorgb">
						<xsl:with-param name="name" select="patterncolour"/>
					</xsl:call-template>
				</xsl:when>
				<xsl:otherwise>
					<xsl:call-template name="colourtexttorgb">
						<xsl:with-param name="name" select="//patterncolour[1]"/>
					</xsl:call-template>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:attribute>
	</xsl:template>
	<!-- start the body templates -->
	<xsl:template name="basebody" match="body" mode="basebody">
		<xsl:param name="fillcolor"/>
		<g>
			<xsl:attribute name="id">
				<xsl:text>body_01</xsl:text>
			</xsl:attribute>
			<xsl:call-template name="primaryfill"/>
			<path 
				d="M32.315,46.586l0.074,1.677l6.156,0.872l2.565-19.243c-0.991-8.17-1.68-11.721-6.431-18.534l-8.99-3.312
				c-0.012-2.547-2.759-3.933-4.964-3.933c-2.203,0-4.952,1.386-4.961,3.933l-8.99,3.312c-4.75,6.812-5.437,10.363-6.429,18.534
				l2.565,19.245l6.158-0.872l0.074-1.679c3.684,1.437,7.663,1.928,11.584,1.928C24.642,48.514,28.647,48.019,32.315,46.586
				L32.315,46.586z"
			/>
		</g>
	</xsl:template>
	<xsl:template match="body[pattern = 'plain' or not(pattern)]">
	</xsl:template>
	<xsl:template match="body[pattern = 'seams']">
		<xsl:param name="fillcolor"/>
		<g>
			<xsl:attribute name="id">
				<xsl:text>body_02</xsl:text>
			</xsl:attribute>
			<xsl:attribute name="display">
				<xsl:text>inline</xsl:text>
			</xsl:attribute>
			<xsl:call-template name="patternfill"/>
			<path  d="M23.524,11.974c-0.496,0.425-1.179,0.716-1.84,0.999c-1.281,0.546-2.606,1.112-2.647,2.71l0.1-0.099h-0.1
				c-0.002,0-0.002,0.102-0.002,0.102v0.778l-0.004,31.915v0.102h0.1h0.399h0.1v-0.102l0.004-31.915v-0.734
				c0.014-1.235,1.067-1.687,2.287-2.206c0.702-0.301,1.43-0.611,1.994-1.093l0.076-0.065l-0.063-0.076l-0.262-0.303l-0.064-0.076
				L23.524,11.974z"/>
			<path d="M10.313,19.22l-0.078-0.156c-0.022-0.057-2.431-5.373-3.539-7.26l0.863-0.545
				c1.13,1.929,3.336,7.41,3.43,7.642L10.313,19.22z"/>
			<path d="M31.09,19.22L31.09,19.22c0.021-0.058,2.472-5.587,3.579-7.478l-0.705-0.389
				c-1.13,1.928-3.392,7.338-3.487,7.571L31.09,19.22z"/>
			<path d="M7.254,11.938l-0.047,0.037l8.719-3.199l0.096-0.035l-0.037-0.095l-0.158-0.408l-0.035-0.092L15.7,8.179
				l-8.759,3.255c-0.006,0.003-0.026,0.185-0.026,0.185l0.008-0.067l-0.008,0.067"/>
			<path d="M34.764,11.587l-0.018-0.022l-0.023-0.012l-0.27-0.123c-0.008-0.002-8.621-3.249-8.621-3.249l-0.094-0.035
				l-0.033,0.092l-0.158,0.407L25.51,8.741l0.096,0.034l8.72,3.199l-0.049-0.038"/>
			<path d="M19.851,13.138c-1.126,0.882-1.309,0.884-1.593,2.404l0.1-0.099h-0.1c-0.002,0-0.002,0.102-0.002,0.102
				v0.778L18.252,48.34v-0.102l0,0v0.102h0.599v-0.102l0.004-31.915v-0.734c0.246-1.07,0.752-1.668,1.515-2.267"/>
		</g>
	</xsl:template>
	<xsl:template match="body[pattern = 'epaulets' or pattern = 'epaulettes']">
		<xsl:param name="fillcolor"/>
		<g>
			<xsl:attribute name="id">
				<xsl:text>body_03</xsl:text>
			</xsl:attribute>
			<xsl:attribute name="display">
				<xsl:text>inline</xsl:text>
			</xsl:attribute>
			<xsl:call-template name="patternfill"/>
			<path display="inline"  d="M9.041,10.476c0,0-0.024,1.326,0.027,2.988c0,0,1.455,2.337,2.857-0.104V9.413
				L9.041,10.476z"/>
			<path display="inline"  d="M32.426,10.552c0,0,0,1.08-0.052,2.742c0,0-1.455,2.338-2.856-0.104V9.481L32.426,10.552z
				"/>
		</g>
	</xsl:template>
	<xsl:template match="body[pattern = 'stripe']">
		<xsl:param name="fillcolor"/>
		<g>
			<xsl:attribute name="id">
				<xsl:text>body_04</xsl:text>
			</xsl:attribute>
			<xsl:attribute name="display">
				<xsl:text>inline</xsl:text>
			</xsl:attribute>
			<xsl:call-template name="patternfill"/>
			<path display="inline"  d="M20.73,48.516c1.211,0,2.431-0.055,3.647-0.163v-37.17
				c-2.797,2.947-5.395,2.149-7.393-0.117v37.28C18.231,48.459,19.483,48.516,20.73,48.516z"/>
		</g>
	</xsl:template>
	<xsl:template match="body[pattern = 'braces']">
		<xsl:param name="fillcolor"/>
		<g>
			<xsl:attribute name="id">
				<xsl:text>body_05</xsl:text>
			</xsl:attribute>
			<xsl:attribute name="display">
				<xsl:text>inline</xsl:text>
			</xsl:attribute>
			<xsl:call-template name="patternfill"/>
			<path display="inline" 
				d="M27.945,47.848c1.057-0.213,2.101-0.483,3.123-0.82V10.028l-3.123-1.15V47.848z"/>
			<path display="inline" 
				d="M10.364,47.02c1.024,0.338,2.067,0.611,3.122,0.824V8.887l-3.122,1.15V47.02z"/>
		</g>
	</xsl:template>
	<xsl:template match="body[pattern = 'stripes']">
		<xsl:param name="fillcolor"/>
		<g>
			<xsl:attribute name="id">
				<xsl:text>body_06</xsl:text>
			</xsl:attribute>
			<xsl:attribute name="display">
				<xsl:text>inline</xsl:text>
			</xsl:attribute>
			<xsl:call-template name="patternfill"/>
			<path  d="M26.372,8.298l-0.679-0.25c-0.001-0.149-0.013-0.293-0.031-0.434h-3.186v40.842h0.378
				c1.175-0.058,2.351-0.165,3.518-0.337V8.298z"/>
			<path  d="M33.965,11.094l-3.896-1.435v37.668c0.759-0.216,1.511-0.457,2.246-0.745l0.078,1.677l-1.302-29.024
				l2.874-6.3V11.094z"/>
			<path  d="M11.161,47.263V9.746l-3.896,1.435v1.232l3.11,6.821L9.147,46.588
				C9.809,46.846,10.482,47.063,11.161,47.263z"/>
			<path  d="M15.773,8.048l-0.915,0.337V48.09c1.238,0.192,2.487,0.305,3.738,0.366h0.158V7.614h-2.95
				C15.785,7.755,15.773,7.899,15.773,8.048z"/>
		</g>
	</xsl:template>
	<xsl:template match="body[pattern = 'hoop']">
		<xsl:param name="fillcolor"/>
		<g>
			<xsl:attribute name="id">
				<xsl:text>body_07</xsl:text>
			</xsl:attribute>
			<xsl:attribute name="display">
				<xsl:text>inline</xsl:text>
			</xsl:attribute>
			<xsl:call-template name="patternfill"/> 
			<polygon display="inline"  points="31.404,26.413 10.137,26.5 9.73,35.591 31.817,35.62 	"/>
		</g>
	</xsl:template>
	<xsl:template match="body[pattern = 'hoops']">
		<xsl:param name="fillcolor"/>
		<g>
			<xsl:attribute name="id">
				<xsl:text>body_08</xsl:text>
			</xsl:attribute>
			<xsl:attribute name="display">
				<xsl:text>inline</xsl:text>
			</xsl:attribute>
			<xsl:call-template name="patternfill"/>
			<g display="inline">
				<path  d="M32.006,40.173c-7.495,0.956-15.061,0.854-22.544-0.295l-0.226,5.038
					c7.631,1.163,15.349,1.224,22.991,0.197L32.006,40.173z"/>
				<path  d="M31.769,34.891l-0.231-5.224c-7.181,1.038-14.437,1.03-21.615-0.018l-0.231,5.159
					C17.021,35.925,24.434,35.952,31.769,34.891z"/>
				<path  d="M10.37,19.638l-0.23,5.124c7.03,1.084,14.138,1.053,21.173-0.084l-0.228-5.039l0.118-0.259
					c-6.973,1.067-14.019,1.042-20.988-0.076L10.37,19.638z"/>
			</g>
		</g>
	</xsl:template>
	<xsl:template match="body[pattern = 'halves']">
		<xsl:param name="fillcolor"/>
		<g>
			<xsl:attribute name="id">
				<xsl:text>body_09</xsl:text>
			</xsl:attribute>
			<xsl:attribute name="display">
				<xsl:text>inline</xsl:text>
			</xsl:attribute>
			<xsl:call-template name="patternfill"/>
			<path display="inline"  d="M15.836,9.293c-0.104-0.349-0.162-0.68-0.18-1.052l-8.688,3.2l0.862,1.892
		c0.087,0.188,2.682,5.749,2.672,5.973L9.288,46.483c1.101,0.421,2.327,0.784,3.654,1.076c1.798,0.395,3.777,0.656,5.869,0.756
		c0.005-9.097,0.003-18.193,0.003-27.291c0-1.747,0-3.493,0-5.241c0-1.052,0.665-1.956,1.542-2.459
		c-0.901-0.31-1.675-0.604-2.444-1.184C17.738,12.011,15.908,9.53,15.836,9.293z"/>
		</g>
	</xsl:template>
	<xsl:template match="body[pattern = 'quartered']">
		<xsl:param name="fillcolor"/>
		<g>
			<xsl:attribute name="id">
				<xsl:text>body_10</xsl:text>
			</xsl:attribute>
			<xsl:attribute name="display">
				<xsl:text>inline</xsl:text>
			</xsl:attribute>
			<xsl:call-template name="patternfill"/>
			<path display="inline"  d="M15.652,8.104L6.82,11.359c0,0,0.826,1.812,0.891,1.954
				c-0.039,0.054-0.063,0.107-0.063,0.157c0,0.048,0.014,0.092,0.03,0.129l2.556,5.609c0.043,0.096,0.102,0.147,0.168,0.184
				c-0.008,0.188-0.53,11.852-0.53,11.852l0.136,0.012c0.049,0.006,4.859,0.446,8.869,0l0.128-0.014V15.781
				c0-0.92,0.563-1.813,1.47-2.334l0.274-0.156l-0.3-0.104c-0.868-0.299-1.646-0.592-2.406-1.164
				c-0.205-0.173-1.944-2.558-2.022-2.772c-0.103-0.347-0.156-0.66-0.173-1.018l-0.009-0.196L15.652,8.104z M19.157,30.971h-0.143
				L19.01,48.47l1.754,0.034c2.745,0,5.372-0.271,7.807-0.808c1.324-0.29,2.56-0.655,3.674-1.083l0.098-0.037l-0.698-15.605
				l-0.137-0.002C31.441,30.969,24.842,30.92,19.157,30.971z"/>
		</g>
	</xsl:template>
	<xsl:template match="body[pattern = 'sash']">
		<xsl:param name="fillcolor"/>
		<g>
			<xsl:attribute name="id">
				<xsl:text>body_11</xsl:text>
			</xsl:attribute>
			<xsl:attribute name="display">
				<xsl:text>inline</xsl:text>
			</xsl:attribute>
			<xsl:call-template name="patternfill"/>
			<path display="inline"  d="M23.078,30.775c5.011-6.638,8.65-14.417,10.438-19.769l-0.325-0.199l-6.682-2.461
		c-0.818,2.383-2.897,7.632-6.998,13.513c-2.593,4.193-5.892,7.839-9.772,11.53L9.216,45.057
		C11.46,43.25,17.605,38.021,23.078,30.775z"/>
		</g>
	</xsl:template>
	<xsl:template match="body[pattern = 'cross belts' or pattern = 'cross sashes']">
		<xsl:param name="fillcolor"/>
		<g>
			<xsl:attribute name="id">
				<xsl:text>body_12</xsl:text>
			</xsl:attribute>
			<xsl:attribute name="display">
				<xsl:text>inline</xsl:text>
			</xsl:attribute>
			<xsl:call-template name="patternfill"/>
			<path display="inline"  d="M31.089,19.091l3.593-7.876l-3.591-1.323c-2.47,5.016-6.293,12.241-10.033,17.156
				c-3.832-4.989-7.712-12.366-10.152-17.354l-4.125,1.521l3.591,7.876l-0.052,1.167c2.375,3.98,4.973,8.135,7.233,11.295
				c-2.305,2.785-4.711,5.132-8.092,7.852l-0.315,7.039c0.216,0.084,0.437,0.154,0.655,0.232c1.993-1.562,6.027-4.981,11.273-10.766
				c5.149,5.658,9.114,9.024,11.099,10.582c0.048-0.018,0.096-0.032,0.143-0.051l-0.345-7.695c-2.964-2.438-5.25-4.668-7.398-7.221
				c2.068-2.918,4.413-6.653,6.611-10.322L31.089,19.091z"/>
		</g>
	</xsl:template>
	<xsl:template match="body[pattern = 'chevron']">
		<xsl:param name="fillcolor"/>
		<g>
			<xsl:attribute name="id">
				<xsl:text>body_13</xsl:text>
			</xsl:attribute>
			<xsl:attribute name="display">
				<xsl:text>inline</xsl:text>
			</xsl:attribute>
			<xsl:call-template name="patternfill"/>
			<polygon display="inline"  points="20.671,24.716 13.72,8.803 8.246,10.819 20.991,40.038 32.466,10.544 
				27.102,8.569 	"/>
		</g>
	</xsl:template>
	<xsl:template match="body[pattern = 'chevrons']">
		<xsl:param name="fillcolor"/>
		<g>
			<xsl:attribute name="id">
				<xsl:text>body_14</xsl:text>
			</xsl:attribute>
			<xsl:attribute name="display">
				<xsl:text>inline</xsl:text>
			</xsl:attribute>
			<xsl:call-template name="patternfill"/>
			<polygon display="inline" 
				points="20.378,19.69 31.425,26.692 31.207,21.82 20.385,14.962 10.282,21.328 
		10.063,26.189 	"/>
			<polygon display="inline" 
				points="20.378,28.88 31.85,36.149 31.631,31.278 20.385,24.152 9.857,30.786 
		9.639,35.647 	"/>
			<polygon display="inline" 
				points="20.378,38.072 32.273,45.615 32.056,40.742 20.385,33.346 9.432,40.246 
		9.213,45.107 	"
			/>
		</g>
	</xsl:template>
	<xsl:template match="body[pattern = 'check']">
		<xsl:param name="fillcolor"/>
		<g>
			<xsl:attribute name="id">
				<xsl:text>body_15</xsl:text>
			</xsl:attribute>
			<xsl:attribute name="display">
				<xsl:text>inline</xsl:text>
			</xsl:attribute>
			<xsl:call-template name="patternfill"/>
			<path display="inline"  d="M23.624,27.532h5.284v5.229h2.789l0.235,5.239h-3.028v-5.229h-5.25v5.229h-5.253v5.229
				h-5.283v-5.239h5.253v-5.229h5.252V27.532z M28.906,27.52h2.556l-0.234-5.242h-2.321V27.52z M18.352,27.509h-5.283v5.237h5.283
				V27.509z M28.859,9.215l-3.166-1.166c-0.002-0.574-0.149-1.086-0.392-1.54h-1.725v5.239h5.283V9.215z M18.321,17.009h-5.284v5.24
				h5.284V17.009z M28.958,38.018h-5.284v5.229h-5.251v5.203c0.243,0.013,0.485,0.028,0.728,0.037h3.15
				c0.468-0.017,0.937-0.04,1.405-0.073l-0.001-5.157h5.249v4.365c1.143-0.272,2.269-0.607,3.362-1.035l0.076,1.675l-0.225-5.015
				h-3.21V38.018z M13.004,11.756h5.284V6.517h-2.127c-0.241,0.452-0.386,0.961-0.388,1.532l-2.769,1.02V11.756z M13.042,22.263H10.24
				l-0.235,5.238h3.038V22.263z M13.074,32.762H9.768l-0.235,5.239h3.542V32.762z M13.124,43.246H9.297l-0.15,3.342
				c1.294,0.505,2.625,0.888,3.977,1.179V43.246z M23.623,22.263H18.34v5.238h5.283V22.263z M28.872,11.755v5.239h3.241l2.039-4.47
				v-0.77H28.872z M9.368,17.026h3.639l0.001-5.238H7.725v1.633L9.368,17.026z M23.61,22.257h5.285v-5.239H23.61V22.257z
				M18.305,16.994h5.285v-5.239h-5.285V16.994z"/>
		</g>
	</xsl:template>
	<xsl:template match="body[pattern = 'diamonds']">
		<xsl:param name="fillcolor"/>
		<g>
			<xsl:attribute name="id">
				<xsl:text>body_16</xsl:text>
			</xsl:attribute>
			<xsl:attribute name="display">
				<xsl:text>inline</xsl:text>
			</xsl:attribute>
			<xsl:call-template name="patternfill"/>
			<polygon display="inline"  points="21.329,29.086 23.815,25.805 21.329,22.525 18.842,25.805 	"/>
			<path display="inline"  d="M32.172,43.348l-0.936-1.234l-2.484,3.279l1.438,1.899
				c0.718-0.208,1.43-0.436,2.126-0.708l0.028,0.626l0.001-0.001L32.172,43.348z"/>
			<polygon display="inline"  points="31.24,22.565 28.795,25.791 31.282,29.072 31.518,28.761 	"/>
			<polygon display="inline"  points="31.549,29.438 31.279,29.082 28.794,32.364 31.279,35.643 31.796,34.962 	"/>
			<polygon display="inline"  points="31.861,36.414 31.271,35.636 28.789,38.916 31.271,42.195 32.073,41.138 	"/>
			<polygon display="inline"  points="31.282,15.938 28.795,19.218 31.234,22.436 31.091,19.235 32.102,17.019 	"/>
			<polygon display="inline"  points="33.803,12.741 32.008,10.373 30.928,9.976 28.832,12.741 31.316,16.022 	"/>
			<path display="inline"  d="M28.727,45.393l-2.484-3.279l-2.485,3.279l2.116,2.792
				c0.275-0.036,0.55-0.069,0.824-0.113L28.727,45.393z"/>
			<path display="inline"  d="M13.831,45.393l2.158,2.848c0.201,0.023,0.402,0.047,0.604,0.067l2.211-2.915
				l-2.487-3.279L13.831,45.393z"/>
			<path display="inline"  d="M9.986,46.884c0.733,0.256,1.475,0.48,2.226,0.669l1.626-2.146l-2.486-3.28l-2.131,2.813
				l-0.04,0.884L9.986,46.884z"/>
			<polygon display="inline"  points="26.286,29.072 28.771,25.791 26.286,22.51 23.799,25.791 	"/>
			<path display="inline"  d="M21.147,48.507c0.092-0.001,0.185-0.003,0.277-0.005l2.346-3.096l-2.487-3.28l-2.485,3.28
				L21.147,48.507z"/>
			<polygon display="inline"  points="11.396,35.657 13.882,32.378 11.396,29.098 9.84,31.15 9.736,33.468 	"/>
			<polygon display="inline"  points="11.396,29.086 13.882,25.805 11.396,22.525 10.154,24.163 10.015,27.263 	"/>
			<polygon display="inline"  points="13.876,25.791 16.362,29.072 18.848,25.791 16.362,22.51 	"/>
			<polygon display="inline"  points="7.683,11.027 6.784,11.358 8,14.025 8.978,12.735 	"/>
			<polygon display="inline"  points="26.284,35.643 28.771,32.364 26.284,29.082 23.798,32.364 	"/>
			<polygon display="inline"  points="13.876,32.364 16.362,35.643 18.848,32.364 16.362,29.082 	"/>
			<polygon display="inline"  points="21.329,35.657 23.815,32.378 21.329,29.098 18.842,32.378 	"/>
			<polygon display="inline"  points="26.277,42.195 28.764,38.916 26.277,35.636 23.794,38.916 	"/>
			<polygon display="inline"  points="11.389,42.21 13.874,38.93 11.389,35.65 9.528,38.104 9.458,39.663 	"/>
			<polygon display="inline"  points="13.868,38.916 16.353,42.195 18.841,38.916 16.353,35.636 	"/>
			<polygon display="inline"  points="21.322,42.21 23.807,38.93 21.322,35.65 18.835,38.93 	"/>
			<polygon display="inline"  points="26.286,22.499 28.771,19.218 26.286,15.938 23.799,19.218 	"/>
			<path display="inline"  d="M27.031,8.541l-1.338-0.493c-0.004-1.096-0.517-1.975-1.272-2.623l-0.579,0.764
				l2.484,3.28L27.031,8.541z"/>
			<polygon display="inline"  points="26.322,16.022 28.807,12.741 26.322,9.462 23.837,12.741 	"/>
			<polygon display="inline"  points="31.282,15.938 28.795,19.218 31.234,22.436 31.091,19.235 32.102,17.019 	"/>
			<polygon display="inline"  points="10.375,19.234 10.293,21.056 11.396,22.511 13.882,19.231 11.396,15.951 
				9.824,18.025 	"/>
			<polygon display="inline"  points="13.876,19.218 16.362,22.499 18.848,19.218 16.362,15.938 	"/>
			<polygon display="inline"  points="21.329,22.511 23.815,19.231 21.329,15.951 18.842,19.231 	"/>
			<path display="inline"  d="M15.773,8.048l-0.348,0.128l0.98,1.293l2.486-3.28L17.88,4.854
				C16.689,5.508,15.778,6.585,15.773,8.048z"/>
			<path display="inline"  d="M23.858,6.202l-1.376-1.815c-0.582-0.179-1.182-0.271-1.748-0.271
				c-0.09,0-0.182,0.006-0.273,0.011l-1.573,2.076l2.485,3.282L23.858,6.202z"/>
			<polygon display="inline"  points="33.803,12.741 32.008,10.373 30.928,9.976 28.832,12.741 31.316,16.022 	"/>
			<polygon display="inline"  points="13.919,12.756 11.534,9.609 11.254,9.712 8.946,12.756 11.433,16.037 	"/>
			<polygon display="inline"  points="13.912,12.741 16.398,16.022 18.884,12.741 16.398,9.462 	"/>
			<polygon display="inline"  points="21.366,16.037 23.852,12.756 21.366,9.476 18.879,12.756 	"/>
		</g>
	</xsl:template>
	<xsl:template match="body[pattern = 'spots']">
		<xsl:param name="fillcolor"/>
		<g>
			<xsl:attribute name="id">
				<xsl:text>body_17</xsl:text>
			</xsl:attribute>
			<xsl:attribute name="display">
				<xsl:text>inline</xsl:text>
			</xsl:attribute>
			<xsl:call-template name="patternfill"/>
			<path display="inline"  d="M13.146,45.504c0-1.672-1.323-3.027-2.956-3.027c-0.303,0-0.589,0.061-0.865,0.147
				l-0.178,3.964c1.04,0.406,2.105,0.729,3.184,0.994C12.833,47.039,13.146,46.311,13.146,45.504z"/>
			<ellipse display="inline"  cx="20.732" cy="19.968" rx="2.956" ry="3.026"/>
			<path display="inline"  d="M34.354,12.071c0-0.312-0.06-0.606-0.145-0.889l-4.438-1.634
				c-0.8,0.542-1.329,1.468-1.329,2.523c0,1.671,1.324,3.026,2.957,3.026c0.735,0,1.399-0.285,1.917-0.74l1.037-2.273
				C34.353,12.079,34.354,12.075,34.354,12.071z"/>
			<path display="inline"  d="M10.898,15.098c1.633,0,2.956-1.355,2.956-3.027c0-1.192-0.679-2.213-1.658-2.707
				l-3.991,1.47c-0.167,0.378-0.264,0.795-0.264,1.237C7.942,13.743,9.266,15.098,10.898,15.098z"/>
			<ellipse display="inline"  cx="13.396" cy="25.12" rx="2.956" ry="3.026"/>
			<ellipse display="inline"  cx="28.006" cy="24.964" rx="2.956" ry="3.027"/>
			<ellipse display="inline"  cx="20.732" cy="31.177" rx="2.956" ry="3.026"/>
			<ellipse display="inline"  cx="13.396" cy="37.23" rx="2.956" ry="3.027"/>
			<ellipse display="inline"  cx="20.732" cy="42.477" rx="2.956" ry="3.027"/>
			<ellipse display="inline"  cx="28.006" cy="37.231" rx="2.956" ry="3.027"/>
			<path display="inline"  d="M28.297,45.504c0,0.807,0.313,1.536,0.816,2.079c1.088-0.267,2.16-0.591,3.203-0.999
				l0.076,1.675l-0.252-5.628c-0.282-0.092-0.576-0.154-0.888-0.154C29.621,42.477,28.297,43.832,28.297,45.504z"/>
		</g>
	</xsl:template>
	<xsl:template match="body[pattern = 'stars']">
		<xsl:param name="fillcolor"/>
		<g>
			<xsl:attribute name="id">
				<xsl:text>body_18</xsl:text>
			</xsl:attribute>
			<xsl:attribute name="display">
				<xsl:text>inline</xsl:text>
			</xsl:attribute>
			<xsl:call-template name="patternfill"/>
			<polygon display="inline"  points="21.511,37.902 23.802,39.572 22.924,36.861 25.227,35.217 22.389,35.217 
				21.512,32.518 20.646,35.211 17.797,35.211 20.11,36.885 19.221,39.572 	"/>
			<polygon display="inline"  points="21.451,22.067 23.742,23.738 22.866,21.025 25.167,19.382 22.33,19.382 
				21.451,16.682 20.586,19.373 17.737,19.373 20.05,21.049 19.161,23.738 	"/>
			<polygon display="inline"  points="10.182,16.4 12.472,14.729 14.763,16.4 13.886,13.687 16.188,12.047 
				13.35,12.047 12.472,9.345 11.607,12.038 8.758,12.038 11.071,13.712 	"/>
			<polygon display="inline"  points="33.849,13.19 31.066,13.19 30.191,10.487 29.326,13.18 26.477,13.18 
				28.787,14.854 27.896,17.544 30.188,15.873 32.017,17.207 32.223,16.754 31.602,14.831 33.823,13.247 	"/>
			<polygon display="inline"  points="14.1,41.846 13.222,39.15 12.357,41.838 9.507,41.838 11.82,43.516 
				10.931,46.204 13.221,44.533 15.512,46.204 14.635,43.492 16.937,41.846 	"/>
			<polygon display="inline"  points="32.091,41.534 30.407,41.534 29.533,38.836 28.668,41.523 25.818,41.523 
				28.129,43.203 27.24,45.891 29.531,44.221 31.818,45.891 30.943,43.178 32.127,42.333 	"/>
			<polygon display="inline"  points="13.932,26.412 13.055,23.713 12.19,26.404 10.054,26.404 10.031,26.905 
				11.653,28.081 10.764,30.77 13.054,29.098 15.345,30.77 14.467,28.055 16.769,26.412 	"/>
			<polygon display="inline"  points="30.279,24.332 29.415,27.023 26.564,27.023 28.876,28.7 27.986,31.389 
				30.277,29.716 31.604,30.685 31.44,27.033 31.156,27.033 	"/>
		</g>
	</xsl:template>
	<xsl:template match="body[pattern = 'cross of lorraine']">
		<xsl:param name="fillcolor"/>
		<g>
			<xsl:attribute name="id">
				<xsl:text>body_19</xsl:text>
			</xsl:attribute>
			<xsl:attribute name="display">
				<xsl:text>inline</xsl:text>
			</xsl:attribute>
			<xsl:call-template name="patternfill"/>
			<path display="inline"  d="M28.973,34.054h-6.095v-8.792h3.247v-4.295h-3.247V17.57h-4.296v3.396h-3.247v4.295h3.247
				v8.792h-6.094v4.297h6.094v3.297h4.296v-3.297h6.095V34.054z"/>
		</g>
	</xsl:template>
	<xsl:template match="body[pattern = 'maltese cross']">
		<xsl:param name="fillcolor"/>
		<g>
			<xsl:attribute name="id">
				<xsl:text>maltese_cross</xsl:text>
			</xsl:attribute>
			<xsl:attribute name="display">
				<xsl:text>inline</xsl:text>
			</xsl:attribute>
			<xsl:call-template name="patternfill"/>
			<path display="inline"  d="M28.973,34.054h-6.095v-8.792h3.247v-4.295h-3.247V17.57h-4.296v3.396h-3.247v4.295h3.247
				v8.792h-6.094v4.297h6.094v3.297h4.296v-3.297h6.095V34.054z"/>
		</g>
	</xsl:template>
	<xsl:template match="body[pattern = 'diamond']">
		<xsl:param name="fillcolor"/>
		<g>
			<xsl:attribute name="id">
				<xsl:text>body_20</xsl:text>
			</xsl:attribute>
			<xsl:attribute name="display">
				<xsl:text>inline</xsl:text>
			</xsl:attribute>
			<xsl:call-template name="patternfill"/>
			<path display="inline"  d="M29.425,29.688l-8.697,12.443l-8.693-12.438l8.696-12.443L29.425,29.688z"/>
		</g>
	</xsl:template>
	<xsl:template match="body[pattern = 'star']">
		<xsl:param name="fillcolor"/>
		<g>
			<xsl:attribute name="id">
				<xsl:text>body_21</xsl:text>
			</xsl:attribute>
			<xsl:attribute name="display">
				<xsl:text>inline</xsl:text>
			</xsl:attribute>
			<xsl:call-template name="patternfill"/>
			<path display="inline"  d="M20.733,19.567l-2.268,7.048h-7.456l6.055,4.383l-2.325,7.038l5.994-4.373l5.993,4.373
				l-2.295-7.097l6.022-4.295h-7.426L20.733,19.567z"/>
		</g>
	</xsl:template>
	<xsl:template match="body[pattern = 'disc']">
		<xsl:param name="fillcolor"/>
		<g>
			<xsl:attribute name="id">
				<xsl:text>body_22</xsl:text>
			</xsl:attribute>
			<xsl:attribute name="display">
				<xsl:text>inline</xsl:text>
			</xsl:attribute>
			<xsl:call-template name="patternfill"/>
			<ellipse display="inline"  cx="20.732" cy="27.363" rx="7.272" ry="7.015"/>
		</g>
	</xsl:template>
	<xsl:template match="body[pattern = 'inverted triangle']">
		<xsl:param name="fillcolor"/>
		<g>
			<xsl:attribute name="id">
				<xsl:text>body_23</xsl:text>
			</xsl:attribute>
			<xsl:attribute name="display">
				<xsl:text>inline</xsl:text>
			</xsl:attribute>
			<xsl:call-template name="patternfill"/>
			<path display="inline"  d="M20.625,37.275L12.2,21.752l17.061,0.129L20.625,37.275z"/>
		</g>
	</xsl:template>
	<xsl:template match="body[pattern = 'diabolo']">
		<xsl:param name="fillcolor"/>
		<g>
			<xsl:attribute name="id">
				<xsl:text>body_24</xsl:text>
			</xsl:attribute>
			<xsl:attribute name="display">
				<xsl:text>inline</xsl:text>
			</xsl:attribute>
			<xsl:call-template name="patternfill"/>
			<path display="inline"  d="M9.146,46.586l22.764,0.144c0.109-0.04,0.222-0.075,0.331-0.118L20.105,28.454
				L9.146,46.586z"/>
			<polygon display="inline"  points="32.32,46.732 32.322,46.732 32.32,46.729 	"/>
			<path display="inline"  d="M20.082,28.454l14.531-17.119l-8.926-3.288c-0.004-2.548-2.752-3.933-4.958-3.933
				c-2.203,0-4.952,1.387-4.961,3.933l-8.659,3.19L20.082,28.454z"/>
			<path display="inline"  d="M9.256,46.628c3.653,1.404,7.591,1.888,11.472,1.888c3.873,0,7.837-0.489,11.478-1.892
				v-0.101H9.256V46.628z"/>
		</g>
	</xsl:template>
	<xsl:template match="body[pattern = 'large spots']">
		<xsl:param name="fillcolor"/>
		<g>
			<xsl:attribute name="id">
				<xsl:text>body_25</xsl:text>
			</xsl:attribute>
			<xsl:attribute name="display">
				<xsl:text>inline</xsl:text>
			</xsl:attribute>
			<xsl:call-template name="patternfill"/>
			<circle display="inline"  cx="20.726" cy="27.023" r="3.497"/>
			<circle display="inline"  cx="13.978" cy="17.061" r="3.497"/>
			<circle display="inline"  cx="27.486" cy="36.967" r="3.497"/>
		</g>
	</xsl:template>
	<xsl:template match="body[pattern = 'triple diamond']">
		<xsl:param name="fillcolor"/>
		<g>
			<xsl:attribute name="id">
				<xsl:text>body_26</xsl:text>
			</xsl:attribute>
			<xsl:attribute name="display">
				<xsl:text>inline</xsl:text>
			</xsl:attribute>
			<xsl:call-template name="patternfill"/>
			<path display="inline"  d="M31.348,27.642l-3.546,5.986l-3.544-5.986l3.544-5.986L31.348,27.642z"/>
			<path display="inline"  d="M17.203,27.642l-3.544,5.986l-3.545-5.986l3.545-5.986L17.203,27.642z"/>
			<path display="inline"  d="M24.258,27.642l-3.544,5.986l-3.545-5.986l3.545-5.986L24.258,27.642z"/>
		</g>
	</xsl:template>
	<xsl:template match="body[pattern = 'hollow box']">
		<xsl:param name="fillcolor"/>
		<g>
			<xsl:attribute name="id">
				<xsl:text>body_27</xsl:text>
			</xsl:attribute>
			<xsl:attribute name="display">
				<xsl:text>inline</xsl:text>
			</xsl:attribute>
			<xsl:call-template name="patternfill"/>
			<path display="inline"  d="M27.607,34.842H13.854V21.09h13.753V34.842L27.607,34.842z M25.101,23.808h-8.529v8.529
				h8.529V23.808z"/>
		</g>
	</xsl:template>
	<xsl:template match="body[pattern = 'panel']">
		<xsl:param name="fillcolor"/>
		<g>
			<xsl:attribute name="id">
				<xsl:text>body_27</xsl:text>
			</xsl:attribute>
			<xsl:attribute name="display">
				<xsl:text>inline</xsl:text>
			</xsl:attribute>
			<xsl:call-template name="patternfill"/>
			<path display="inline"  d="M27.607,34.842H13.854V21.09h13.753V34.842L27.607,34.842z"/>
		</g>
	</xsl:template>
	<!-- start sleeve templates -->
	<xsl:template name="basesleeve" match="sleeve" mode="basesleeve">
		<xsl:param name="fillcolor"/>
		<g>
			<xsl:attribute name="id">
				<xsl:text>sleeve_01</xsl:text>
			</xsl:attribute>
			<xsl:call-template name="primaryfill"/>
			<path 
				d="M34.685,11.353l-3.595,7.881l1.302,29.026l6.156,0.87l2.567-19.243
				C40.123,21.717,39.436,18.166,34.685,11.353L34.685,11.353z M6.78,11.353l3.594,7.881L9.072,48.261l-6.158,0.87L0.348,29.888
				C1.34,21.717,2.026,18.166,6.78,11.353L6.78,11.353z"
			/>
		</g>
	</xsl:template>
	<xsl:template match="sleeve[pattern = 'plain' or not(pattern)]">
	</xsl:template>
	<xsl:template match="sleeve[pattern = 'armlet']">
		<xsl:param name="fillcolor"/>
		<g>
			<xsl:attribute name="id">
				<xsl:text>sleeve_02</xsl:text>
			</xsl:attribute>
			<xsl:attribute name="display">
				<xsl:text>inline</xsl:text>
			</xsl:attribute>
			<xsl:call-template name="patternfill"/>
			<path display="inline"  d="M41.004,30.717l0.111-0.832c-0.225-1.852-0.436-3.458-0.68-4.927
				c-0.004-0.018-0.008-0.041-0.008-0.041l-9.016,1.301l0.01,0.409l0.216,4.812C32.631,31.372,40.472,30.848,41.004,30.717z"/>
			<path display="inline"  d="M10.06,26.193l-9.027-1.266c-0.247,1.478-0.459,3.094-0.685,4.958l0.113,0.846
				c1,0.154,8.662,0.661,9.364,0.707L10.06,26.193z"/>
		</g>
	</xsl:template>
	<xsl:template match="sleeve[pattern = 'hooped']">
		<xsl:param name="fillcolor"/>
		<g>
			<xsl:attribute name="id">
				<xsl:text>sleeve_03</xsl:text>
			</xsl:attribute>
			<xsl:attribute name="display">
				<xsl:text>inline</xsl:text>
			</xsl:attribute>
			<xsl:call-template name="patternfill"/>
			<path display="inline"  d="M40.973,28.736l-9.422,0.777l0.242,5.382l8.738-0.635l0.574-4.306l0.004-0.072
				l0.004-0.015C41.065,29.478,41.02,29.106,40.973,28.736z"/>
			<path display="inline"  d="M39.139,44.699l0.733-5.493l-7.855,0.671l0.229,5.122
				C33.917,44.935,37.709,44.935,39.139,44.699z"/>
			<path display="inline"  d="M38.816,18.736l-7.642,0.312l-0.085,0.186l0.252,5.622l8.943-0.754
				C39.927,22.154,39.479,20.441,38.816,18.736z"/>
			<path display="inline"  d="M1.166,24.17l8.955,0.682l0.252-5.618l-0.078-0.17l-7.658-0.302
				C1.972,20.479,1.524,22.204,1.166,24.17z"/>
			<path display="inline"  d="M0.483,28.798c-0.044,0.355-0.089,0.711-0.134,1.086l0,0.002l0,0.013l0.598,4.482
				l8.723,0.507l0.243-5.414L0.483,28.798z"/>
			<path display="inline"  d="M2.31,44.602c1.403,0.282,5.602,0.313,6.906,0.424l0.229-5.103l-7.857-0.744L2.31,44.602z
				"/>
		</g>
	</xsl:template>
	<xsl:template match="sleeve[pattern = 'striped']">
		<xsl:param name="fillcolor"/>
		<g>
			<xsl:attribute name="id">
				<xsl:text>sleeve_04</xsl:text>
			</xsl:attribute>
			<xsl:attribute name="display">
				<xsl:text>inline</xsl:text>
			</xsl:attribute>
			<xsl:call-template name="patternfill"/>
			<polygon display="inline"  points="35.059,31.412 32.566,16.093 31.113,19.235 33.359,31.913 33.561,48.296 
				34.739,48.591 35.158,48.65 	"/>
			<path display="inline"  d="M39.109,43.85l0.168-13.295l-4.059-18.417c-0.176-0.26-0.347-0.517-0.535-0.786
				l-0.792,1.736l-0.329,0.838l3.793,16.585l0.086,18.462l1.016,0.144L39.109,43.85z"/>
			<path display="inline"  d="M6.497,11.766c-0.174,0.253-0.35,0.508-0.513,0.753L2.073,30.357L2.241,43.65l0.66,5.324
				l1.008-0.168l0.085-18.494l3.797-16.583l-0.41-1.054L6.8,11.401L6.497,11.766z"/>
			<polygon display="inline"  points="8.79,16.025 6.292,31.211 6.192,48.495 7.756,48.359 7.988,31.71 10.236,19.033 	
				"/>
		</g>
	</xsl:template>
	<xsl:template match="sleeve[pattern = 'chevrons']">
		<xsl:param name="fillcolor"/>
		<g>
			<xsl:attribute name="id">
				<xsl:text>sleeve_05</xsl:text>
			</xsl:attribute>
			<xsl:attribute name="display">
				<xsl:text>inline</xsl:text>
			</xsl:attribute>
			<xsl:call-template name="patternfill"/>
			<path display="inline" d="M31.494,28.271l0.233,5.248l3.913-2.956l4.835,3.965l0.64-4.653
				c-0.021-0.176-0.043-0.342-0.063-0.509l-5.276-4.329L31.494,28.271z"/>
			<path display="inline" d="M33.6,48.476l4.831,0.937l0.018-0.121l-2.843-2.33L33.6,48.476z"/>
			<path display="inline" d="M37.004,14.962l-1.116-0.916l-0.102,0.076l-3.621,2.736l-1.076,2.359l0.172,3.834
				l4.516-3.413l4.34,3.561C39.508,20.259,38.642,17.816,37.004,14.962z"/>
			<path display="inline" d="M31.96,38.658l0.238,5.329l3.31-2.501l3.602,2.956l0.702-5.11l-4.191-3.44L31.96,38.658z"
			/>
			<path display="inline" d="M0.424,29.252c-0.024,0.205-0.05,0.409-0.075,0.618l0.589,4.422l4.934-3.729l3.85,3.161
				l0.244-5.438l-3.961-3.252L0.424,29.252z"/>
			<path display="inline" d="M3,49.102l4.644-0.657l-1.809-1.483L3,49.102z"/>
			<path display="inline" d="M9.149,16.534l-3.032-2.488l-0.101,0.076L4.13,15.546
				c-1.417,2.594-2.208,4.887-2.773,7.606l4.647-3.513l4.195,3.442l0.173-3.863L9.149,16.534z"/>
			<path display="inline" d="M1.582,39.117l0.667,5.005l3.49-2.636l3.508,2.878l0.245-5.485l-3.641-2.987L1.582,39.117
				z"/>
		</g>
	</xsl:template>
	<xsl:template match="sleeve[pattern = 'seams']">
		<xsl:param name="fillcolor"/>
		<g>
			<xsl:attribute name="id">
				<xsl:text>sleeve_06</xsl:text>
			</xsl:attribute>
			<xsl:attribute name="display">
				<xsl:text>inline</xsl:text>
			</xsl:attribute>
			<xsl:call-template name="patternfill"/>
			<path  d="M40.344,29.969l-2.571,18.891l0,0l0.241,0.051l0.383,0.051l0.103,0.018l0.017-0.104l2.549-18.893v-0.008
				v-0.007l0.002-0.051v-0.01L41.063,29.9c-1.004-8.247-1.599-11.862-6.312-18.619l-0.017-0.022l-0.027-0.011l-0.038,0.174
				c-0.006-0.002-0.344,0.552-0.344,0.552v0.13C38.438,19.172,39.354,21.958,40.344,29.969l0.114-0.046L40.344,29.969z"/>
			<path  d="M9.625,19.604L9.625,19.604c-0.024-0.057-2.294-5.433-3.486-7.32l0.556-0.634
				c1.216,1.929,3.591,7.41,3.691,7.642L9.625,19.604z"/>
			<path  d="M31.738,19.522L31.738,19.522c0.021-0.058,2.442-5.638,3.552-7.529l-0.583-0.354
				c-1.129,1.928-3.521,7.3-3.617,7.532L31.738,19.522z"/>
			<path  d="M6.915,11.911l-0.344-0.261c-0.006,0.002,0.182-0.501,0.182-0.501L6.729,11.16l-0.016,0.023
				c-4.715,6.753-5.308,10.372-6.308,18.618l-0.001,0.01v0.006v0.052v0.008l0.001,0.006l2.548,19.011l0.012,0.086h0.087h0.392h0.113
				l0.129-0.11L1.208,29.875l0,0c1.005-8.27,1.75-10.813,5.958-17.521L6.915,11.911z"/>
		</g>
	</xsl:template>
	<xsl:template match="sleeve[pattern = 'stars']">
		<xsl:param name="fillcolor"/>
		<g>
			<xsl:attribute name="id">
				<xsl:text>sleeve_07</xsl:text>
			</xsl:attribute>
			<xsl:attribute name="display">
				<xsl:text>inline</xsl:text>
			</xsl:attribute>
			<xsl:call-template name="patternfill"/>
			<path 
				d="M36.341,26.625l-0.793,2.463h-2.605l2.117,1.533l-0.813,2.46l2.095-1.528l2.095,1.528L37.634,30.6
		l2.105-1.501h-2.596L36.341,26.625z"/>
			<path 
				d="M35.343,17.878l-0.793,2.463h-2.605l2.117,1.532l-0.813,2.46l2.095-1.529l2.095,1.529l-0.802-2.481
		l2.105-1.501h-2.596L35.343,17.878z"/>
			<path 
				d="M35.758,36.541l-0.793,2.463h-2.605l2.117,1.533l-0.813,2.461l2.095-1.529l2.095,1.529l-0.802-2.482
		l2.105-1.5h-2.596L35.758,36.541z"/>
			<path 
				d="M4.924,26.625l-0.793,2.463H1.526l2.117,1.533l-0.813,2.46l2.095-1.528l2.095,1.528L6.217,30.6l2.105-1.501
		H5.727L4.924,26.625z"/>
			<path 
				d="M6.008,17.878l-0.793,2.463H2.609l2.117,1.532l-0.813,2.46l2.095-1.529l2.095,1.529l-0.802-2.481
		l2.105-1.501H6.811L6.008,17.878z"/>
			<path 
				d="M5.675,36.541l-0.793,2.463H2.276l2.117,1.533L3.58,42.998l2.095-1.529l2.095,1.529l-0.802-2.482l2.105-1.5
		H6.478L5.675,36.541z"
			/>
		</g>
	</xsl:template>
	<xsl:template match="sleeve[pattern = 'spots']">
		<xsl:param name="fillcolor"/>
		<g>
			<xsl:attribute name="id">
				<xsl:text>sleeve_08</xsl:text>
			</xsl:attribute>
			<xsl:attribute name="display">
				<xsl:text>inline</xsl:text>
			</xsl:attribute>
			<xsl:call-template name="patternfill"/>
			<path display="inline"  d="M39.213,20.62c0,1.372-1.112,2.483-2.484,2.483c-1.371,0-2.48-1.111-2.48-2.483
				s1.109-2.484,2.48-2.484C38.101,18.136,39.213,19.248,39.213,20.62z M38.369,28.392c-1.372,0-2.483,1.111-2.483,2.481
				c0,1.372,1.11,2.484,2.483,2.484c1.372,0,2.482-1.112,2.482-2.484C40.852,29.503,39.74,28.392,38.369,28.392z M36.729,40.382
				c-1.371,0-2.483,1.112-2.483,2.483c0,1.37,1.112,2.482,2.483,2.482c1.372,0,2.481-1.112,2.481-2.482
				C39.212,41.494,38.101,40.382,36.729,40.382z M2.251,20.753c0,1.372,1.112,2.484,2.483,2.484s2.483-1.112,2.483-2.484
				c0-1.372-1.112-2.483-2.483-2.483S2.251,19.381,2.251,20.753z M0.612,31.01c0,1.372,1.111,2.482,2.483,2.482
				c1.372,0,2.483-1.11,2.483-2.482s-1.112-2.484-2.483-2.484C1.723,28.525,0.612,29.638,0.612,31.01z M2.251,43.002
				c0,1.37,1.112,2.482,2.483,2.482s2.483-1.11,2.483-2.482c0-1.374-1.112-2.486-2.483-2.486S2.251,41.628,2.251,43.002z"/>
		</g>
	</xsl:template>
	<xsl:template match="sleeve[pattern = 'mismatched']">
		<xsl:param name="fillcolor"/>
		<g>
			<xsl:attribute name="id">
				<xsl:text>sleeve_09</xsl:text>
			</xsl:attribute>
			<xsl:attribute name="display">
				<xsl:text>inline</xsl:text>
			</xsl:attribute>
			<xsl:call-template name="patternfill"/>
			<path display="inline"  d="M34.683,11.353l-3.593,7.881l1.3,29.026l6.158,0.87l2.567-19.243
		C40.122,21.717,39.436,18.166,34.683,11.353L34.683,11.353z"/>
		</g>
	</xsl:template>
	<xsl:template match="sleeve[pattern = 'halves']">
		<xsl:param name="fillcolor"/>
		<g>
			<xsl:attribute name="id">
				<xsl:text>sleeve_10</xsl:text>
			</xsl:attribute>
			<xsl:attribute name="display">
				<xsl:text>inline</xsl:text>
			</xsl:attribute>
			<xsl:call-template name="patternfill"/>
			<path  d="M0.482,29.46v-0.787c-0.045,0.358-0.09,0.716-0.136,1.094l2.565,19.245l6.158-0.87L9.907,29.46H0.482z"/>
			<path  d="M40.976,28.648v0.812h-9.424l0.838,18.682l6.156,0.87l2.568-19.245C41.067,29.381,41.021,29.015,40.976,28.648z"/>
		</g>
	</xsl:template>
	<xsl:template match="sleeve[pattern = 'diabolo']">
		<xsl:param name="fillcolor"/>
		<g>
			<xsl:attribute name="id">
				<xsl:text>sleeve_11</xsl:text>
			</xsl:attribute>
			<xsl:attribute name="display">
				<xsl:text>inline</xsl:text>
			</xsl:attribute>
			<xsl:call-template name="patternfill"/>
			<path display="inline" 
				d="M5.159,30.251L2.195,19.99c-0.917,2.796-1.344,5.751-1.847,9.896l1.801,13.511
		L5.159,30.251z"/>
			<polygon display="inline" 
				points="9.122,47.115 10.372,19.235 9.373,17.043 5.158,30.253 	"/>
			<polygon display="inline" 
				points="31.09,19.234 32.276,45.663 32.394,48.26 32.61,48.291 35.93,30.253 
		32.104,17.013 	"/>
			<path display="inline" 
				d="M41.115,29.885c-0.509-4.192-0.941-7.167-1.88-9.992l-3.306,10.36l3.378,13.181
		L41.115,29.885z"
			/>
		</g>
	</xsl:template>
	<xsl:template match="sleeve[pattern = 'diamonds']">
		<xsl:param name="fillcolor"/>
		<g>
			<xsl:attribute name="id">
				<xsl:text>sleeve_12</xsl:text>
			</xsl:attribute>
			<xsl:attribute name="display">
				<xsl:text>inline</xsl:text>
			</xsl:attribute>
			<xsl:call-template name="patternfill"/>
			<polygon display="inline"  points="2.489,45.96 2.491,45.979 5.231,48.804 5.342,48.788 7.403,45.002 4.589,42.102 	
				"/>
			<path display="inline"  d="M3.138,28.646l2.107-3.869L2.43,21.873l-1.274,2.341c-0.118,0.65-0.228,1.333-0.333,2.046
				L3.138,28.646z"/>
			<polygon display="inline"  points="5.952,31.561 3.138,28.658 1.033,32.527 3.847,35.427 	"/>
			<path display="inline"  d="M2.429,21.861l2.105-3.869l-1.08-1.115c-0.707,1.463-1.227,2.869-1.634,4.355
				L2.429,21.861z"/>
			<polygon display="inline"  points="6.668,38.325 3.855,35.422 1.748,39.291 4.562,42.193 	"/>
			<polygon display="inline"  points="9.136,46.761 9.376,41.417 7.427,44.998 	"/>
			<polygon display="inline"  points="10.166,23.785 7.374,20.904 5.267,24.771 8.081,27.676 10.163,23.853 	"/>
			<polygon display="inline"  points="9.907,29.569 8.083,27.688 5.977,31.557 8.791,34.462 9.768,32.668 	"/>
			<polygon display="inline"  points="9.39,41.105 9.648,35.33 8.798,34.452 6.691,38.32 	"/>
			<polygon display="inline"  points="9.256,16.79 6.665,14.119 4.558,17.987 7.374,20.89 9.415,17.14 	"/>
			<path display="inline"  d="M6.637,14.215l0.787-1.444l-0.646-1.417c-0.433,0.621-0.821,1.207-1.19,1.779
				L6.637,14.215z"/>
			<path display="inline"  d="M2.429,21.861l2.105-3.869l-1.08-1.115c-0.707,1.463-1.227,2.869-1.634,4.355
				L2.429,21.861z"/>
			<polygon display="inline"  points="36.884,42.372 33.98,45.1 36.001,48.534 38.904,45.807 	"/>
			<path display="inline"  d="M40.883,28.052c-0.111-0.86-0.224-1.674-0.343-2.44l-0.974-1.657l-2.902,2.729l2.02,3.437
				L40.883,28.052z"/>
			<polygon display="inline"  points="40.637,33.457 38.682,30.13 35.777,32.859 37.798,36.294 40.611,33.651 	"/>
			<polygon display="inline"  points="39.803,39.708 37.792,36.291 34.889,39.02 36.909,42.454 39.799,39.737 	"/>
			<path display="inline"  d="M40.15,23.398c-0.303-1.505-0.671-2.877-1.17-4.234l-1.43,1.345l2.02,3.435L40.15,23.398z
				"/>
			<polygon display="inline"  points="32.107,41.952 32.318,46.641 33.96,45.098 	"/>
			<polygon display="inline"  points="31.719,25.975 33.738,29.412 36.643,26.682 34.621,23.246 	"/>
			<polygon display="inline"  points="31.634,31.4 31.736,33.687 32.854,35.587 35.756,32.859 33.734,29.425 	"/>
			<polygon display="inline"  points="31.863,36.507 32.093,41.624 34.867,39.016 32.848,35.582 	"/>
			<polygon display="inline"  points="32.602,19.8 34.623,23.237 37.525,20.506 35.505,17.071 	"/>
			<path display="inline"  d="M33.67,13.574l-0.105,0.233l1.97,3.351l1.758-1.657c-0.58-1.057-1.267-2.167-2.083-3.375
				L33.67,13.574z"/>
			<path display="inline"  d="M40.15,23.398c-0.303-1.505-0.671-2.877-1.17-4.234l-1.43,1.345l2.02,3.435L40.15,23.398z
				"/>
			<polygon display="inline"  points="31.606,18.097 31.088,19.234 31.175,21.173 32.618,19.817 	"/>
		</g>
	</xsl:template>
	<xsl:template match="sleeve[pattern = 'check']">
		<xsl:param name="fillcolor"/>
		<g>
			<xsl:attribute name="id">
				<xsl:text>sleeve_13</xsl:text>
			</xsl:attribute>
			<xsl:call-template name="patternfill"/>
			<path  d="M34.544,11.663l0.392,0.058c1.492,2.169,2.566,4.017,3.37,5.8l-4.925-0.733l0.566-3.816L34.544,11.663z
				M36.314,33.166l-4.63-0.688l0.239,5.334l3.622,0.54L36.314,33.166z M31.545,29.362l0.318-2.146l-0.418-0.063L31.545,29.362z
				M39.9,38.994l-4.344-0.645l-0.771,5.182l4.422,0.66L39.9,38.994z M37.965,22.741l2.095,0.226
				c-0.354-1.663-0.801-3.175-1.429-4.699L37.965,22.741z M40.961,28.64l-3.873-0.66l0.77-5.184l-5.224-0.777l-0.772,5.185
				l5.186,0.772l-0.77,5.181l4.304,0.734l0.534-4.007C41.063,29.455,41.012,29.045,40.961,28.64z M32.393,48.26l1.689,0.238
				l0.738-4.958l-2.657-0.395L32.393,48.26z M33.396,16.812l-1.125-0.167l-1.182,2.589l0.114,2.55l1.423,0.212L33.396,16.812z
				M6.885,43.398l-0.772-5.183l-4.564,0.679l0.692,5.195L6.885,43.398z M6.606,11.608c-1.502,2.173-2.586,4.022-3.398,5.801
				l5.08-0.755l-0.44-2.957l-0.971-2.13L6.606,11.608z M9.305,43.044L6.849,43.41l0.752,5.059l1.47-0.208L9.305,43.044z M9.97,28.198
				l0.051-1.148l-0.217,0.032L9.97,28.198z M3,17.873c-0.732,1.691-1.23,3.351-1.619,5.198l2.322-0.465L3,17.873z M5.39,33.021
				L4.618,27.84l5.188-0.77l-0.772-5.183l-5.226,0.778l0.773,5.18L0.518,28.52c-0.056,0.441-0.112,0.895-0.169,1.366l0.518,3.884
				L5.39,33.021z M9.042,21.862l1.221-0.182l0.109-2.445l-1.225-2.687l-0.876,0.131L9.042,21.862z M6.125,38.214l3.419-0.508
				l0.239-5.333l-4.43,0.658L6.125,38.214z"/>
		</g>
	</xsl:template>
	<!-- cap templates start here -->
	<xsl:template name="basecap" match="cap" mode="basecap">
		<xsl:param name="fillcolor"/>
		<g>
			<xsl:attribute name="id">
				<xsl:text>cap_01</xsl:text>
			</xsl:attribute>
			<xsl:call-template name="primaryfill"/>
			<path 
				d="M49.712,10.988c0,3.714-2.862,6.74-6.37,6.74c-3.512,0-6.373-3.025-6.373-6.74c0-1.196,0-2.313,0-3.51
				c0-3.713,2.861-6.74,6.373-6.74c3.508,0,6.37,3.027,6.37,6.74C49.712,8.674,49.712,9.792,49.712,10.988L49.712,10.988z"
			/>
		</g>
	</xsl:template>
	<xsl:template match="cap[pattern = 'plain' or not(pattern)]">
	</xsl:template>
	<xsl:template match="cap[pattern = 'hooped']">
		<xsl:param name="fillcolor"/>
		<g>
			<xsl:attribute name="id">
				<xsl:text>cap_02</xsl:text>
			</xsl:attribute>
			<xsl:attribute name="display">
				<xsl:text>inline</xsl:text>
			</xsl:attribute>
			<xsl:call-template name="patternfill"/>
			<path display="inline" 
				d="M43.34,1.813c-3.001,0-5.442,2.508-5.442,5.592c0,3.083,2.441,5.592,5.442,5.592
		c3.003,0,5.444-2.509,5.444-5.592S46.343,1.813,43.34,1.813z M43.34,11.986c-2.459,0-4.461-2.056-4.461-4.581
		c0-2.526,2.002-4.582,4.461-4.582c2.46,0,4.462,2.056,4.462,4.582C47.802,9.933,45.8,11.986,43.34,11.986z"/>
			<path display="inline" 
				d="M43.34,3.833c-1.916,0-3.476,1.603-3.476,3.572c0,1.97,1.56,3.571,3.476,3.571
		c1.918,0,3.476-1.602,3.476-3.571C46.816,5.436,45.258,3.833,43.34,3.833z M43.34,9.966c-1.374,0-2.492-1.148-2.492-2.561
		s1.118-2.56,2.492-2.56c1.375,0,2.493,1.147,2.493,2.56S44.715,9.966,43.34,9.966z"
			/>
		</g>
	</xsl:template>
	<xsl:template match="cap[pattern = 'striped']">
		<xsl:param name="fillcolor"/>
		<g>
			<xsl:attribute name="id">
				<xsl:text>cap_03</xsl:text>
			</xsl:attribute>
			<xsl:attribute name="display">
				<xsl:text>inline</xsl:text>
			</xsl:attribute>
			<xsl:call-template name="patternfill"/>
			<path display="inline"  d="M44.141,14.022V0.88c-0.276-0.04-0.557-0.067-0.846-0.067
				c-0.232,0-0.461,0.014-0.686,0.04v13.196c0.225,0.026,0.453,0.04,0.686,0.04C43.584,14.089,43.864,14.062,44.141,14.022z"/>
			<path display="inline"  d="M48.669,10.855c0.582-1.018,0.917-2.191,0.917-3.405c0-1.212-0.335-2.385-0.917-3.401
				V10.855z"/>
			<path display="inline"  d="M39.545,12.758c0.463,0.369,0.976,0.671,1.531,0.895V1.25
				c-0.556,0.224-1.068,0.527-1.531,0.896V12.758z"/>
			<path display="inline"  d="M38.014,3.884c-0.642,1.053-1.01,2.289-1.01,3.566c0,1.279,0.368,2.516,1.01,3.57V3.884z"
			/>
			<path display="inline"  d="M47.137,2.22c-0.461-0.382-0.974-0.698-1.531-0.934v12.33
				c0.558-0.235,1.07-0.551,1.531-0.933V2.22z"/>
		</g>
	</xsl:template>
	<xsl:template match="cap[pattern = 'check']">
		<xsl:param name="fillcolor"/>
		<g>
			<xsl:attribute name="id">
				<xsl:text>cap_04</xsl:text>
			</xsl:attribute>
			<xsl:attribute name="display">
				<xsl:text>inline</xsl:text>
			</xsl:attribute>
			<xsl:call-template name="patternfill"/>
			<path display="inline" 
				d="M46.449,10.395h1.998v0.897c-0.258,0.399-0.555,0.768-0.887,1.101h-1.111V10.395z
				M37.184,8.397c0.089,0.698,0.282,1.371,0.566,1.998h0.707V8.397H37.184z M40.455,8.397v1.998h1.998V8.397H40.455z M44.451,10.395
				h1.998V8.397h-1.998V10.395z M48.447,8.397v1.998h0.487c0.285-0.627,0.479-1.3,0.568-1.998H48.447z M40.455,13.418
				c0.607,0.346,1.279,0.586,1.998,0.696v-1.721h-1.998V13.418z M49.469,6.399c-0.115-0.701-0.332-1.375-0.644-1.998h-0.378v1.998
				H49.469z M42.453,8.397h1.998V6.399h-1.998V8.397z M40.455,6.399h-1.998v1.998h1.998V6.399z M44.451,4.401V2.403h-1.998v1.998
				H44.451z M46.449,1.752c-0.604-0.379-1.275-0.649-1.998-0.79v1.44h1.998V1.752z M42.453,0.925
				c-0.719,0.111-1.391,0.351-1.998,0.698v0.78h1.998V0.925z M44.451,14.077c0.723-0.14,1.395-0.411,1.998-0.79v-0.894h-1.998V14.077z
				M46.449,8.397h1.998V6.399h-1.998V8.397z M37.861,4.401c-0.312,0.623-0.528,1.297-0.644,1.998h1.239V4.401H37.861z M42.453,4.401
				h-1.998v1.998h1.998V4.401z M40.455,2.403h-1.081c-0.339,0.306-0.646,0.649-0.917,1.022v0.976h1.998V2.403z M48.447,4.401V3.746
				c-0.32-0.497-0.7-0.951-1.135-1.343h-0.863v1.998H48.447z M42.453,10.395v1.998h1.998v-1.998H42.453z M46.449,6.399V4.401h-1.998
				v1.998H46.449z M38.457,10.395v1.223c0.202,0.277,0.426,0.534,0.666,0.775h1.332v-1.998H38.457z"
			/>
		</g>
	</xsl:template>
	<xsl:template match="cap[pattern = 'spots']">
		<xsl:param name="fillcolor"/>
		<g>
			<xsl:attribute name="id">
				<xsl:text>cap_05</xsl:text>
			</xsl:attribute>
			<xsl:attribute name="display">
				<xsl:text>inline</xsl:text>
			</xsl:attribute>
			<xsl:call-template name="patternfill"/>
			<circle display="inline"  cx="43.35" cy="7.532" r="1.981"/>
			<ellipse display="inline"  cx="38.323" cy="7.532" rx="0.989" ry="1.981"/>
			<ellipse display="inline"  cx="48.437" cy="7.69" rx="1.056" ry="1.981"/>
			<ellipse display="inline"  cx="43.484" cy="2.271" rx="1.98" ry="1.132"/>
			<ellipse display="inline"  cx="43.418" cy="12.561" rx="1.98" ry="1.274"/>
		</g>
	</xsl:template>
	<xsl:template match="cap[pattern = 'quartered']">
		<xsl:param name="fillcolor"/>
		<g>
			<xsl:attribute name="id">
				<xsl:text>cap_06</xsl:text>
			</xsl:attribute>
			<xsl:attribute name="display">
				<xsl:text>inline</xsl:text>
			</xsl:attribute>
			<xsl:call-template name="patternfill"/>
			<path display="inline"  d="M43.346,7.576v6.726c-1.754,0-3.599-1.009-4.751-2.227c0,0-1.55-2.919-1.632-4.496
				l6.348,0.01l-0.188,0.198L43.346,7.576z M47.849,2.823c-1.153-1.218-2.747-1.974-4.503-1.974v6.725h6.372
				C49.718,5.723,49.004,4.042,47.849,2.823z"/>
		</g>
	</xsl:template>
	<xsl:template match="cap[pattern = 'star']">
		<xsl:param name="fillcolor"/>
		<g>
			<xsl:attribute name="id">
				<xsl:text>cap_07</xsl:text>
			</xsl:attribute>
			<xsl:attribute name="display">
				<xsl:text>inline</xsl:text>
			</xsl:attribute>
			<xsl:call-template name="patternfill"/>
			<path display="inline"  d="M43.342,2.877l-1.039,3.234h-3.422l2.777,2.011l-1.066,3.23l2.75-2.008l2.751,2.008
				L45.04,8.096l2.764-1.972h-3.408L43.342,2.877z"/>
		</g>
	</xsl:template>
	<xsl:template match="cap[pattern = 'diamond']">
		<xsl:param name="fillcolor"/>
		<g>
			<xsl:attribute name="id">
				<xsl:text>cap_08</xsl:text>
			</xsl:attribute>
			<xsl:attribute name="display">
				<xsl:text>inline</xsl:text>
			</xsl:attribute>
			<xsl:call-template name="patternfill"/>
			<polygon display="inline"  points="40.163,7.367 43.404,3.375 46.521,7.359 43.28,11.353 	"/>
		</g>
	</xsl:template>
	<xsl:template match="cap[pattern = 'stars']">
		<xsl:param name="fillcolor"/>
		<g>
			<xsl:attribute name="id">
				<xsl:text>cap_09</xsl:text>
			</xsl:attribute>
			<xsl:attribute name="display">
				<xsl:text>inline</xsl:text>
			</xsl:attribute>
			<xsl:call-template name="patternfill"/>
			<path  d="M37.371,9.246l0.16,0.222l0.006-1.712l1.619-0.507l-1.619-0.53l0.002-1.707l-0.028,0.039
				c-0.254,0.733-0.397,1.514-0.397,2.313C37.113,8.008,37.204,8.641,37.371,9.246z"/>
			<path  d="M49.078,6.627l-1.682,0.311l1.551,0.735l-0.23,1.686l0.743-0.786c0.069-0.396,0.108-0.8,0.108-1.208
				c0-0.713-0.114-1.412-0.318-2.076L49.078,6.627z"/>
			<path  d="M45.516,2.104l-1.385-0.753l0.263-0.62c-0.229-0.042-0.465-0.07-0.704-0.085l-0.408,0.228l-0.396-0.222
				c-0.238,0.019-0.473,0.05-0.701,0.097l0.256,0.591l-1.39,0.77h1.712l0.52,1.234l0.529-1.24H45.516z"/>
			<path  d="M44.582,13.965l-0.451-1.066l1.385-0.753h-1.705l-0.529-1.239l-0.52,1.234H41.05l1.39,0.77l-0.445,1.03
				c0.066,0.016,0.135,0.027,0.202,0.041l1.085-0.607l1.114,0.622C44.457,13.986,44.521,13.979,44.582,13.965z"/>
			<polygon  points="44.131,7.516 45.516,6.53 43.811,6.53 43.281,4.907 42.762,6.524 41.05,6.524 42.439,7.53 
				41.906,9.145 43.281,8.141 44.658,9.145 	"/>
		</g>
	</xsl:template>
	<xsl:template match="cap[pattern = 'diamonds']">
		<xsl:param name="fillcolor"/>
		<g>
			<xsl:attribute name="id">
				<xsl:text>cap_10</xsl:text>
			</xsl:attribute>
			<xsl:attribute name="display">
				<xsl:text>inline</xsl:text>
			</xsl:attribute>
			<xsl:call-template name="patternfill"/>
			<polygon display="inline"  points="45.784,7.448 47.608,6.037 49.427,7.453 47.601,8.866 	"/>
			<polygon display="inline"  points="45.819,7.548 47.644,6.137 49.462,7.554 47.638,8.965 	"/>
			<polygon display="inline"  points="44.79,5.372 44.509,3.083 46.656,2.245 46.937,4.535 	"/>
			<polygon display="inline"  points="42.314,5.122 40.191,4.224 40.537,1.946 42.661,2.845 	"/>
			<polygon display="inline"  points="44.629,9.495 46.836,10.163 46.733,12.466 44.526,11.795 	"/>
			<polygon display="inline"  points="42.014,9.331 42.229,11.627 40.059,12.405 39.844,10.108 	"/>
			<polygon display="inline"  points="40.85,7.363 39.16,8.933 37.223,7.688 38.91,6.117 	"/>
		</g>
	</xsl:template>
	<!-- end of parts -->
	<xsl:template match="silks">
		<svg version="1.1" id="Silks" x="0px" y="0px" width="300px" height="300px" viewBox="0 0 50 50" enable-background="new 0 0 50 50" xml:space="preserve">
			<metadata>
				<sfw xmlns="http://ns.adobe.com/SaveForWeb/1.0/">
					<slices/>
					<sliceSourceBounds y="0.04" x="-0.385" width="52.172" height="49.854" bottomLeftOrigin="true"/>
				</sfw>
			</metadata>
			<xsl:apply-templates select="body" mode="basebody"/>
			<xsl:apply-templates select="body"/>
			<xsl:apply-templates select="sleeve" mode="basesleeve"/>
			<xsl:if test="not(sleeve)">
				<xsl:call-template name="basesleeve"/>
			</xsl:if>
			<xsl:apply-templates select="sleeve"/>
			<xsl:apply-templates select="cap" mode="basecap"/>
			<xsl:apply-templates select="cap"/>
			<xsl:apply-templates select="body" mode="outline" />
			<xsl:apply-templates select="cap" mode="outline" />
		</svg>
	</xsl:template>
	<!-- outlines are run at the end -->
	<xsl:template match="body" mode="outline">
		<g id="body_outline">
			<g>
				<path fill="#020202" d="M19.313,12.775c0.31,0.14,0.633,0.261,0.967,0.361c0.156,0.047,0.307,0.104,0.45,0.167
			c0.145-0.064,0.295-0.121,0.451-0.167c0.335-0.103,0.658-0.223,0.968-0.361v-2.441c0-1.48,1.325-2.034,1.842-3.108
			c-0.873-0.605-2.014-0.972-3.261-0.972c-1.246,0-2.386,0.366-3.261,0.972c0.517,1.074,1.842,1.628,1.842,3.108L19.313,12.775
			L19.313,12.775z"/>
				<path fill="#676868" d="M19.125,21.022c0,9.102,0,18.204-0.004,27.303 M34.709,11.654l-0.824,1.807
			c-0.09,0.196-0.357,0.072-0.266-0.129l0.86-1.893l-8.687-3.2c-0.018,0.371-0.076,0.706-0.18,1.054
			c-0.064,0.217-0.337,0.114-0.278-0.096C25.441,8.82,25.5,8.428,25.5,8.025c-0.018-0.66-0.196-1.258-0.573-1.8
			c-0.23-0.331-0.513-0.615-0.813-0.854c0.131,0.283,0.205,0.609,0.205,0.957c0,0.921-0.515,1.477-1.036,2.041
			c-0.494,0.534-0.993,1.075-0.993,1.942v2.232c0.389-0.189,0.751-0.412,1.085-0.655c0.191-0.14,0.343,0.114,0.172,0.243
			c-0.673,0.509-1.442,0.884-2.321,1.145c-1.101,0.33-2.099,1.271-2.099,2.5c0,1.748,0,3.495,0,5.242c0,9.102,0,18.204-0.004,27.303
			c0.537,0.021,1.073,0.033,1.609,0.033c2.797,0,5.44-0.291,7.776-0.803c1.326-0.292,2.556-0.655,3.654-1.076l-1.216-27.183
			c-0.01-0.216,0.285-0.236,0.295-0.019l1.294,28.846l5.887,0.833l2.544-19.071c-0.493-4.067-0.913-6.988-1.797-9.731
			C38.302,17.47,36.984,14.942,34.709,11.654L34.709,11.654z M20.731,14.697c0.402,0,0.761,0.271,0.881,0.654
			c0.26,0.025,0.456,0.143,0.456,0.28c0,0.137-0.196,0.254-0.456,0.28c-0.12,0.384-0.479,0.653-0.881,0.653
			c-0.505,0-0.923-0.422-0.923-0.934S20.226,14.697,20.731,14.697L20.731,14.697z M20.731,14.999c-0.341,0-0.625,0.287-0.625,0.634
			c0,0.345,0.283,0.632,0.625,0.632c0.342,0,0.626-0.287,0.626-0.632C21.357,15.286,21.074,14.999,20.731,14.999L20.731,14.999z
			 M21.612,21.763c0.26,0.025,0.456,0.143,0.456,0.279c0,0.139-0.196,0.255-0.456,0.281c-0.12,0.385-0.479,0.653-0.881,0.653
			c-0.505,0-0.923-0.423-0.923-0.935s0.417-0.936,0.923-0.936C21.133,21.108,21.492,21.379,21.612,21.763L21.612,21.763z
			 M21.612,28.175c0.26,0.025,0.456,0.143,0.456,0.279c0,0.138-0.196,0.253-0.456,0.278c-0.12,0.387-0.479,0.654-0.881,0.654
			c-0.505,0-0.923-0.424-0.923-0.937c0-0.512,0.417-0.938,0.923-0.938C21.133,27.519,21.492,27.79,21.612,28.175L21.612,28.175z
			 M21.612,34.586c0.26,0.025,0.456,0.143,0.456,0.279c0,0.139-0.196,0.254-0.456,0.279c-0.12,0.384-0.479,0.653-0.881,0.653
			c-0.505,0-0.923-0.423-0.923-0.937c0-0.511,0.417-0.937,0.923-0.937C21.133,33.931,21.492,34.202,21.612,34.586L21.612,34.586z
			 M21.612,40.996c0.26,0.025,0.456,0.143,0.456,0.281c0,0.137-0.196,0.253-0.456,0.278c-0.12,0.385-0.479,0.652-0.881,0.652
			c-0.505,0-0.923-0.422-0.923-0.937c0-0.512,0.417-0.935,0.923-0.935C21.133,40.345,21.492,40.611,21.612,40.996L21.612,40.996z
			 M20.731,21.411c-0.341,0-0.625,0.287-0.625,0.632c0,0.347,0.283,0.633,0.625,0.633c0.342,0,0.626-0.286,0.626-0.633
			C21.357,21.698,21.074,21.411,20.731,21.411L20.731,21.411z M20.731,27.823c-0.341,0-0.625,0.285-0.625,0.633
			c0,0.345,0.283,0.632,0.625,0.632c0.342,0,0.626-0.287,0.626-0.632C21.358,28.108,21.074,27.823,20.731,27.823L20.731,27.823z
			 M20.731,34.233c-0.341,0-0.625,0.286-0.625,0.636c0,0.346,0.283,0.632,0.625,0.632c0.342,0,0.626-0.286,0.626-0.632
			C21.358,34.52,21.074,34.233,20.731,34.233L20.731,34.233z M20.731,40.645c-0.341,0-0.625,0.285-0.625,0.633
			c0,0.347,0.283,0.634,0.625,0.634c0.342,0,0.626-0.287,0.626-0.634C21.357,40.932,21.074,40.645,20.731,40.645L20.731,40.645z
			 M16.127,9.197c0.063,0.219-0.208,0.33-0.278,0.094c-0.104-0.349-0.162-0.68-0.18-1.052l-8.687,3.2l0.861,1.892
			c0.087,0.188-0.171,0.338-0.268,0.127l-0.823-1.803c-2.275,3.288-3.593,5.815-4.458,8.504c-0.884,2.742-1.303,5.661-1.797,9.729
			l2.544,19.073l5.888-0.833l1.294-28.837c0.01-0.228,0.303-0.211,0.293,0.013L9.3,46.481c1.101,0.421,2.328,0.784,3.654,1.076
			c1.797,0.395,3.777,0.654,5.87,0.756c0.004-9.097,0.003-18.193,0.003-27.29c0-1.748,0-3.494,0-5.242
			c0-1.051,0.665-1.956,1.542-2.458c-0.902-0.31-1.675-0.604-2.445-1.184c-0.172-0.13-0.011-0.379,0.167-0.248
			c0.333,0.246,0.695,0.466,1.084,0.656v-2.233c0-0.867-0.5-1.409-0.993-1.942c-0.521-0.563-1.036-1.12-1.036-2.041
			c0-0.347,0.075-0.674,0.205-0.957c-0.301,0.238-0.582,0.523-0.813,0.854c-0.385,0.546-0.576,1.167-0.576,1.8
			C15.961,8.429,16.019,8.822,16.127,9.197L16.127,9.197z M38.696,49.15c-0.012,0.074-0.096,0.139-0.168,0.129
			c-2.053-0.291-4.104-0.59-6.158-0.872c-0.061-0.008-0.126-0.082-0.129-0.143l-0.065-1.472c-1.091,0.412-2.302,0.771-3.604,1.058
			c-2.354,0.518-5.02,0.808-7.84,0.808c-2.569,0-5.349-0.261-7.838-0.808c-1.305-0.287-2.516-0.646-3.605-1.058l-0.066,1.472
			c-0.002,0.061-0.068,0.135-0.128,0.143l-6.157,0.872c-0.074,0.01-0.158-0.055-0.168-0.129L0.2,29.87
			c0.497-4.095,0.917-7.032,1.811-9.805c0.892-2.765,2.251-5.356,4.62-8.758l0.098-0.093c2.979-1.099,5.958-2.195,8.936-3.294
			c0.023-0.729,0.269-1.351,0.628-1.867c1.932-2.775,6.942-2.777,8.875,0c0.36,0.517,0.604,1.14,0.627,1.867l8.936,3.294l0.1,0.093
			c2.369,3.401,3.728,5.993,4.619,8.758c0.894,2.773,1.314,5.712,1.811,9.805C41.262,29.868,40.265,37.328,38.696,49.15
			L38.696,49.15z M23.266,4.839c-0.727-0.385-1.604-0.578-2.535-0.578c-0.931,0-1.809,0.192-2.534,0.578
			c-0.521,0.273-0.753,0.922-0.753,1.491c0,0.244,0.044,0.462,0.119,0.661c0.938-0.604,2.061-0.895,3.169-0.895
			c1.108,0,2.23,0.29,3.17,0.895c0.074-0.198,0.118-0.417,0.118-0.661C24.02,5.761,23.786,5.112,23.266,4.839L23.266,4.839z
			 M21.99,12.682l0.001-2.369c0-0.987,0.541-1.57,1.074-2.147c0.264-0.287,0.525-0.57,0.708-0.901
			c-0.897-0.587-1.977-0.867-3.042-0.867c-1.063,0-2.144,0.28-3.042,0.867c0.184,0.331,0.445,0.614,0.709,0.901
			c0.534,0.577,1.074,1.16,1.074,2.147v2.369c0.413,0.178,0.85,0.281,1.259,0.458C21.142,12.964,21.577,12.859,21.99,12.682
			L21.99,12.682z"/>
			</g>
		</g>
	</xsl:template>
	<xsl:template match="cap" mode="outline">
		<path id="cap_outline" fill="#676767" d="M49.862,10.988c0,3.606-2.8,6.89-6.521,6.89c-3.722,0-6.521-3.284-6.521-6.89v-3.51
	c0-3.606,2.801-6.89,6.521-6.89c3.723,0,6.521,3.284,6.521,6.89V10.988L49.862,10.988z M43.34,6.196c0.701,0,1.282,0.58,1.282,1.282
	c0,0.703-0.581,1.283-1.282,1.283c-0.7,0-1.282-0.58-1.282-1.283C42.058,6.776,42.638,6.196,43.34,6.196L43.34,6.196z M43.34,6.494
	c-0.537,0-0.98,0.446-0.98,0.982c0,0.539,0.443,0.983,0.98,0.983c0.538,0,0.983-0.445,0.983-0.983
	C44.323,6.94,43.878,6.494,43.34,6.494L43.34,6.494z M49.563,9.549c-0.82,2.733-3.296,4.818-6.223,4.818
	c-2.928,0-5.401-2.086-6.224-4.819v1.437c0,3.444,2.663,6.593,6.224,6.593c3.559,0,6.223-3.146,6.223-6.593V9.549L49.563,9.549z
	 M43.342,14.067c3.56,0,6.223-3.144,6.223-6.59c0-3.444-2.664-6.59-6.223-6.59c-3.56,0-6.223,3.146-6.223,6.59
	C37.12,10.923,39.78,14.067,43.342,14.067L43.342,14.067z"/>
	</xsl:template>
</xsl:stylesheet>