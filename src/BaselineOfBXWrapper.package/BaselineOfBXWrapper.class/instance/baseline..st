baselines
baseline: spec
	<baseline>
	spec
		for: #common
		do: [ spec
				baseline: 'OSSubprocess'
				with: [ spec
						repository: 'github://marianopeck/OSSubprocess/repository';
						className: #BaselineOfOSSubprocess ].
			spec
				package: 'BXWrapper-Core'
				with: [ spec repository: 'github://eMaringolo/pharo-bx-wrapper/src' ] ]