var profile = {
	basePath: '../',

	releaseDir: "release-msmvc",
	releaseName: "",
	action: 'release',

	cssOptimize: 'comments',

	mini: true,
    
	optimize: '',
	
	

	layerOptimize: '',
	
	

	stripConsole: 'warn',
	selectorEngine: 'lite',

	localeList: ["ar", "az", "ca", "cs", "da", "de", "el", "es", "fi", "fr", "he", "hr", "hu", "it", "ja", "kk", "ko", "nb", "nl", "pl", "pt", "pt-pt", "ro", "ru", "sk", "sl", "sv", "th", "tr", "zh", "zh-tw"],

	defaultConfig: {
		hasCache: {
			'dojo-built': 1,
			'dojo-loader': 1,
			'dom': 1,
			'host-browser': 1,
			'config-selectorEngine': 'lite'
			//'config-stripStrict': true
		},
		async: 1
	},

	staticHasFeatures: {
		'config-stripStrict': true
	},

	packages: [{ name: 'dojo', location: 'dojo' }, { name: 'klt', location: '' }, { name: 'jdash', location: '' }],

	// Builds can be split into multiple different JavaScript files called "layers". This allows applications to
	// defer loading large sections of code until they are actually required while still allowing multiple modules to
	// be compiled into a single file.
	layers: {
		// This is the main loader module. It is a little special because it is treated like an AMD module even though
		// it is actually just plain JavaScript. There is some extra magic in the build system specifically for this
		// module ID.
		'jdash/jdash': {
			// In addition to the loader `dojo/dojo` and the loader configuration file `app/run`, we are also including
			// the main application `app/main` and the `dojo/i18n` and `dojo/domReady` modules because, while they are
			// all conditional dependencies in `app/main`, we do not want to have to make extra HTTP requests for such
			// tiny files.
		    include: [
            "jdash/init",
			"jdash/core/declare",
			"jdash/core/Deferred",
			"jdash/core/when",
			"jdash/core/bus",
            "jdash/core/CommandName",
            "jdash/core/CommandType",
            "jdash/core/DashletCommand",
            "jdash/core/DashletContext",
            "jdash/core/DashletEditorContext",
            "jdash/core/DesignMode",
            "jdash/layout/AbsoluteLayout",
            "jdash/layout/AbsoluteMoveable",
            "jdash/layout/AutoScroll",
            "jdash/layout/DropIndicator",
            "jdash/layout/LayoutManager",
            "jdash/layout/GridLayout",
            "jdash/layout/MDropManager",
            "jdash/layout/MMoveable",
            "jdash/layout/OverDropMode",
            "jdash/layout/Section",
            "jdash/layout/StepMover",
            "jdash/layout/VerticalDropMode",
            "jdash/layout/Zone",
            "jdash/layout/_BaseDndLayout",
            "jdash/layout/_Container",
            "jdash/layout/_Layout",
            "jdash/layout/_LayoutItem",
            "jdash/layout/_LayoutWidget",
            "jdash/layout/VerticalDropMode",
			"jdash/model/AuthorizationModel",
            "jdash/model/ConfigModel",
            "jdash/model/DashboardModel",
            "jdash/model/DashletModel",
            "jdash/model/DashletModuleModel",
            "jdash/model/DashletPositionModel",
            "jdash/model/MetadataModel",
            "jdash/model/ModelBase",
            "jdash/nls/language",
            "jdash/nls/tr/language",
            "jdash/provider/Manager",
            "jdash/provider/_ProviderMixin",
            "jdash/provider/JsonRest/JsonRestProvider",
            "jdash/provider/JsonRest/JsonRestStore",
            "jdash/ui/Button",
            "jdash/ui/ButtonSet",
            "jdash/ui/DashboardView",
            "jdash/ui/DashletEditView",
            "jdash/ui/DashletPane",
            "jdash/ui/DashletPaneBase",
            "jdash/ui/DashletStylesList",
            "jdash/ui/ThemeStylesList",
            "jdash/ui/Menu",
            "jdash/ui/MenuItem",
            "jdash/ui/ModuleAvatar",
            "jdash/ui/PaneButtons",
            "jdash/ui/registry",
            "jdash/ui/ThemeManager",
            "jdash/ui/TitleEditor",
            "jdash/ui/DashletPropertyEditor",
            "jdash/ui/Viewport",
            "jdash/ui/_BidiMixin",
            "jdash/ui/_busyMixin",
            "jdash/ui/_DomMixin",
            "jdash/ui/_TemplatedMixin",
            "jdash/ui/_ThemeMixin",
            "jdash/ui/_WidgetBase",
			"jdash/ui/Widget",
			"jdash/ui/DashletCreateLink",
			"jdash/ui/DashboardLoadLink",
			"jdash/ui/DashboardTitle",
			"jdash/ui/animation",
            "jdash/ui/_WidgetsInTemplateMixin",
			"jdash/ui/linker",
			"jdash/mvc/Dashlet",
			"jdash/mvc/DashletBase",
			"jdash/mvc/DashletEditor",
			"jdash/mvc/DashletForm",
			"jdash/mvc/InternalCompiler",
			"jdash/mvc/JQueryCompiler",			
			"jdash/mvc/mvc",
            "klt/domReady"
			],

			boot: true,
			customBase: true,
			exclude: [

			]

			// By default, the build system will try to include `dojo/main` in the built `dojo/dojo` layer, which adds
			// a bunch of stuff we do not want or need. We want the initial script load to be as small and quick to
			// load as possible, so we configure it as a custom, bootable base.

		}
	},

	// Providing hints to the build system allows code to be conditionally removed on a more granular level than
	// simple module dependencies can allow. This is especially useful for creating tiny mobile builds.
	// Keep in mind that dead code removal only happens in minifiers that support it! Currently, only Closure Compiler
	// to the Dojo build system with dead code removal.
	// A documented list of has-flags in use within the toolkit can be found at
	// <http://dojotoolkit.org/reference-guide/dojo/has.html>.
	staticHasFeatures: {
		// The trace & log APIs are used for debugging the loader, so we do not need them in the build.
		'dojo-trace-api': 0,
		'dojo-log-api': 0,

		// This causes normally private loader data to be exposed for debugging. In a release build, we do not need
		// that either.
		'dojo-publish-privates': 0,

		// This application is pure AMD, so get rid of the legacy loader.
		'dojo-sync-loader': 0,

		// `dojo-xhr-factory` relies on `dojo-sync-loader`, which we have removed.
		'dojo-xhr-factory': 0,

		// We are not loading tests in production, so we can get rid of some test sniffing code.
		'dojo-test-sniff': 0
	}
};