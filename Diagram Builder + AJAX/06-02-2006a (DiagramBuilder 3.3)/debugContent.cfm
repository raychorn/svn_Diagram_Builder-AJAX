<cfsetting enablecfoutputonly="Yes" showdebugoutput="No">
	<cfoutput>
		<table width="100%" border="0" cellspacing="-1" cellpadding="-1" bgcolor="##FFFF80" style="margin-top: 20px;">
			<tr>
				<td>
					<table>
						<tr>
							<td>
								<table>
									<tr>
										<td align="left" valign="top">
											<button name="btn_getContents2" id="btn_getContents2" class="buttonMenuClass" title="This is the faster method for getting data because this method simply reads the desired data from the Db without the need to read flat files or perform a parsing function." onclick="displayDbBrowserGUI(this);  return false;">[?Wafer Analysis]</button>
										</td>
										<td>
											<span class="textClass">Portions of this Prototype have been provided under a Limited Runtime License by Hierarchical Applications Limited, &copy; 1990-#Year(Now())# and may not be used in a Commercial Product without specific written permission !</span>
										</td>
									</tr>
								</table>
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
</cfoutput>

