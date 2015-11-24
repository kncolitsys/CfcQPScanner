<cfcomponent output="false">

	<cfset This.Name = "qpscanner_v0.7.5@#CGI.SERVER_NAME#"/>
	<cfset This.SessionManagement = true/>


	<cffunction name="onApplicationStart" returntype="Boolean" output="false">
		<cfset var Result = True/>

		<cfset Application.Version = "v0.7.5"/>

		<cfset Application.Cfcs =
			{ Settings = new cfcs.settings( ConfigDirectory : expandPath('./config') )
			, Scanner  = createObject("component","cfcs.qpscanner")
			}
			/>

		<cfreturn Result/>
	</cffunction>


	<cffunction name="onRequestStart" returntype="Boolean" output="false">
		<cfset var Result = True/>

		<cfif StructKeyExists(Url,'AppReload')>
			<cfset Result = Result AND onApplicationStart()/>
		</cfif>

		<cfreturn Result/>
	</cffunction>


</cfcomponent>