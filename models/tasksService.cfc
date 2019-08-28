component singleton {

	function mergeURLAndPort( url, port ) {
		rtn = url2Struct( arguments.url, arguments.port );
		// loose default port
		if( (rtn.port==80 && "http://"==rtn.protocol ) || ( rtn.port==443 && "https://"==rtn.protocol ) ) {
			return rtn.protocol & rtn.domain & rtn.path;
		}
		return rtn.protocol & rtn.domain & ":" & rtn.port & rtn.path;
	}

	function url2Struct( url, port ) {
		rtn={};
		// extract protocol 
		indexStart=find("//",arguments.url);
		rtn.protocol=mid(arguments.url,1,indexStart+1);
		_url=mid(arguments.url,indexStart+2);
		// split domain from path
		index=find("/",_url);
		if(index==0) {
			rtn.domain=_url;
			rtn.path="";
		}
		else {
			rtn.domain=mid(_url,1,index-1);
			rtn.path=mid(_url,index);
		}
		// already has port?
		index=find(":",rtn.domain);
		if(index>0) {
			rtn.port=mid(rtn.domain,index+1);
			rtn.domain=mid(rtn.domain,1,index-1);
		}
		if(isNumeric(arguments.port) && arguments.port!=0) {
			rtn.port=arguments.port;
		}
		else if(isNull(rtn.port) || !isNumeric(rtn.port) || rtn.port==0) {
			if("https://"==rtn.protocol) rtn.port=443;
			else rtn.port=80;
		}
		return rtn;
	}

}