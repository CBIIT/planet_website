//creates appropriate pop-up window
function popWindow(theurl)
{
	theurl = theurl.replace(/\s/g, '+');
	window.open(theurl,'','toolbar=yes,location=yes,scrollbars=yes,resizable=yes,width=725,height=400');
}

function popWindowBig(theurl)
{
	theurl = theurl.replace(/\s/g, '+');
	window.open(theurl,'','toolbar=yes,location=yes,scrollbars=yes,resizable=no,width=900,height=650');
}



//* <a href="http://www.cdc.gov/cancer/ncccp/guidelines/index.htm" onclick="javascript:popWindow('http://www.cdc.gov/cancer/ncccp/guidelines/index.htm'); return false;"> *//
