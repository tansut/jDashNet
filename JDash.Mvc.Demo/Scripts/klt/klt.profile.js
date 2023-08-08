var profile = {
    basePath: "../",
    releaseDir: "release",
    releaseName: "klt",
    layerOptimize: "closure",
    hasReport: false,
    optimize: "closure",
    cssOptimize: "comments",
    mini: true,
    stripConsole: "warn",
    selectorEngine: "lite",
    action: "release",
    defaultConfig: {
        hasCache: {
            "dojo-built": 1,
            "dojo-loader": 1,
            "dom": 1,
            "host-browser": 1,
            "config-selectorEngine": "lite"
        },
        async: 1
    },

    packages: [

        {
            name: "dojo",
            location: "dojo"
        },
              {
                  name: "klt",
                  location: "klt"
              }

    ],




    resourceTags: {
        amd: function (filename, mid) {
            return /\.js$/.test(filename);
        }
    }


}
