(function() {
	'use strict';
	var $asm = {};
	global.ScriptProject = global.ScriptProject || {};
	ss.initAssembly($asm, 'ScriptProject');
	////////////////////////////////////////////////////////////////////////////////
	// ScriptProject.Person
	var $ScriptProject_Person = function() {
		this.$name = '';
	};
	$ScriptProject_Person.__typeName = 'ScriptProject.Person';
	global.ScriptProject.Person = $ScriptProject_Person;
	////////////////////////////////////////////////////////////////////////////////
	// ScriptProject.Program
	var $ScriptProject_Program = function() {
	};
	$ScriptProject_Program.__typeName = 'ScriptProject.Program';
	$ScriptProject_Program.$main = function() {
		$(function() {
			$('#main h2').click(ss.thisFix(function(el, evt) {
				var $state = 0, $t1, $t2;
				var $sm = function() {
					$sm1:
					for (;;) {
						switch ($state) {
							case 0: {
								$state = -1;
								$t1 = ss.Task.fromDoneCallback($('#main p'), 'fadeOut');
								$state = 1;
								$t1.continueWith($sm);
								return;
							}
							case 1: {
								$state = -1;
								$t1.getAwaitedResult();
								$t2 = ss.Task.fromDoneCallback($('#main p'), 'fadeIn');
								$state = 2;
								$t2.continueWith($sm);
								return;
							}
							case 2: {
								$state = -1;
								$t2.getAwaitedResult();
								window.alert('Done');
								$state = -1;
								break $sm1;
							}
							default: {
								break $sm1;
							}
						}
					}
				};
				$sm();
			}));
		});
	};
	global.ScriptProject.Program = $ScriptProject_Program;
	////////////////////////////////////////////////////////////////////////////////
	// ScriptProject.Todd
	var $ScriptProject_Todd = function() {
		this.$myname = 'Todd';
		$ScriptProject_Person.call(this);
	};
	$ScriptProject_Todd.__typeName = 'ScriptProject.Todd';
	global.ScriptProject.Todd = $ScriptProject_Todd;
	ss.initClass($ScriptProject_Person, $asm, {});
	ss.initClass($ScriptProject_Program, $asm, {});
	ss.initClass($ScriptProject_Todd, $asm, {}, $ScriptProject_Person);
	$ScriptProject_Program.$main();
})();
