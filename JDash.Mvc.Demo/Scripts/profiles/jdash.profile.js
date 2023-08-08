var profile = {
    // `basePath` is relative to the directory containing this profile file; in this case, it is being set to the
    // src/ directory, which is the same place as the `baseUrl` directory in the loader configuration. (If you change
    // this, you will also need to update run.js.)
    basePath: '../',

    releaseDir: "release",
    releaseName: "",

    // This is the directory within the release directory where built packages will be placed. The release directory
    // itself is defined by `build.sh`. You should probably not use this; it is a legacy option dating back to Dojo
    // 0.4.
    // If you do use this, you will need to update build.sh, too.
    // releaseName: '',

    // Builds a new release.
    action: 'release',

    // Strips all comments and whitespace from CSS files and inlines @imports where possible.
    cssOptimize: 'comments',

    // Excludes tests, demos, and original template files from being included in the built version.
    mini: true,

    // Uses Closure Compiler as the JavaScript minifier. This can also be set to "shrinksafe" to use ShrinkSafe,
    // though ShrinkSafe is deprecated and not recommended.
    // This option defaults to "" (no compression) if not provided.
    optimize: '',

    // We're building layers, so we need to set the minifier to use for those, too.
    // This defaults to "shrinksafe" if not provided.
    layerOptimize: '',

    // Strips all calls to console functions within the code. You can also set this to "warn" to strip everything
    // but console.error, and any other truthy value to strip everything but console.warn and console.error.
    // This defaults to "normal" (strip all but warn and error) if not provided.
    stripConsole: 'warn',

    // The default selector engine is not included by default in a dojo.js build in order to make mobile builds
    // smaller. We add it back here to avoid that extra HTTP request. There is also a "lite" selector available; if
    // you use that, you will need to set the `selectorEngine` property in `app/run.js`, too. (The "lite" engine is
    // only suitable if you are not supporting IE7 and earlier.)
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
            "jdash/model/ConfigModel",
             "jdash/model/AuthorizationModel",
			"jdash/model/PermissionModel",
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