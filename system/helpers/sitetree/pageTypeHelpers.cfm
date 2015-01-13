<cffunction name="getAllowableChildPageTypes" access="public" returntype="any" output="false">
	<cfscript>
		var args     = arguments;
		var cacheKey = "getAllowableChildPageTypes" & SerializeJson( args );

		return simpleRequestCache( cacheKey, function(){
			var pageTypesService = getSingleton( "pageTypesService" );

			if ( pageTypesService.pageTypeExists( argumentCollection=args ) ) {
				return pageTypesService.getPageType( argumentCollection=args ).getAllowedChildTypes();
			}

			return "";
		} );
	</cfscript>
</cffunction>

<cffunction name="getManagedChildPageTypes" access="public" returntype="any" output="false">
	<cfscript>
		var args     = arguments;
		var cacheKey = "getManagedChildPageTypes" & SerializeJson( args );

		return simpleRequestCache( cacheKey, function(){
			var pageTypesService = getSingleton( "pageTypesService" );

			if ( pageTypesService.pageTypeExists( argumentCollection=args ) ) {
				return pageTypesService.getPageType( argumentCollection=args ).getManagedChildTypes();
			}

			return "";
		} );
	</cfscript>
</cffunction>

<cffunction name="isSystemPageType" access="public" returntype="any" output="false">
	<cfscript>
		var args     = arguments;
		var cacheKey = "isSystemPageType" & SerializeJson( args );

		return simpleRequestCache( cacheKey, function(){
			var pageTypesService = getSingleton( "pageTypesService" );

			return pageTypesService.pageTypeExists( argumentCollection=args ) && pageTypesService.isSystemPageType( argumentCollection=args );
		} );
	</cfscript>
</cffunction>