define(['dojo/_base/declare',
		'dojo/_base/lang'

],
	function (declare, lang) {

	    var mixinClass = declare('jdash.provider._ProviderMixin', null, {

	        onStartup: function () {

	        },

	        getDashboard: function (/* String */ id) {
	            // summary:
	            // 		Retrieves the Dashboard object for a specific id.
	            // example:
	            //|   require(["jdash/provider/Manager",
	            //|   		"jdash/model/DashboardModel",
	            //|   		"klt/core/when", "jdash/provider/JsonRest/JsonRestProvider"],
	            //|   	function (Manager, dashboard, when) {
	            //|   		var provider = Manager.getInstance();
	            //|   		when(provider.getDashboard(id),
	            //|   	function (Dashboards) {
	            //|   			//your logic here...
	            //|   		},
	            //|   	function (err) {
	            //|   			console.error(err);
	            //|   		});
	            //|   	});
	        },
	        searchDashboards: function () {
	            // summary:
	            //		 Returns an array of all Dashboard objects
	            // example:
	            //| 	 require(["jdash/provider/Manager",
	            //|    			  "jdash/model/DashboardModel",
	            //|     	      "klt/core/when","jdash/provider/JsonRest/JsonRestProvider"],
	            //|  	 function (Manager, dashboard, when) {                
	            //|   	 	 var provider = Manager.getInstance();
	            //|    	 when(provider.searchDashboards(), 
	            //|        function (Dashboards) {
	            //|           //your logic here...
	            //|         }, 
	            //|         function (err) 
	            //|         { 
	            //|           console.error(err);
	            //|         });
	            //|      });
	        },
	        saveDashboard: function (/* Dashboard object */ dashboard) {
	            // summary:
	            // 		Save changes for a dashboard object
	            // example:
	            //|		require(["jdash/provider/Manager",
	            //|    			 "jdash/ui/DashboardView",
	            //|    			 "klt/core/when","jdash/provider/JsonRest/JsonRestProvider"],
	            //|	    function (Manager, dashboard, when) {
	            //|  	   var provider = Manager.getInstance();        
	            //|     when(provider.getDashboard(id), 
	            //|   	  function (dashboard) {
	            //|            //update "title" property of dashboard
	            //|    	 dashboard.set("title", "My Dashboard");
	            //|             //Save changes
	            //|     when(provider.saveDashboard(dashboardToUpdate),
	            //|   	  function () {
	            //|             //logic on success
	            //|    	 },
	            //|   	  function () {
	            //|              //logic on fail
	            //|    	 });
	            //|     }, 
	            //|     function (err) {
	            //|             console.error(err);
	            //|      });
	            //|		});

	        },
	        saveDashboard: function (/* Dashboard */ dashboard) {
	            // summary:
	            //		Creates a new Dashboard object
	            // example:
	            //| require(["jdash/provider/Manager",
	            //|          "jdash/model/DashboardModel",
	            //|          "klt/core/when","jdash/provider/JsonRest/JsonRestProvider"], 
	            //|  function (Manager, dashboard, when) {
	            //|       // Create new DashboardModel instance and set its properties.
	            //|    var dashboard = new DashboardModel({
	            //|        title: "My first dashboard",
	            //|        layout: "table"
	            //|    });
	            //|    // Get instance of default client provider
	            //|    var provider = Manager.getInstance();
	            //|   // Call createDashboard method of provider. Use when function 
	            //|    // to handle both asynchronous and synchronous calls.
	            //|    when(provider.createDashboard(dashboard),
	            //|       // Handler for sucess
	            //|        function (result) {
	            //|            console.info("Dashboard created successfully. Assigned id is "+
	            //|                         result.id);
	            //|        },
	            //|        // Optional error handler
	            //|        function (err) {
	            //|            console.error(err);
	            //|        });
	            //|	 	});

	        },
	        deleteDashboard: function (/* String */ id) {
	            // summary:
	            //		Deletes a Dashboard object by id
	            // example:
	            //| require(["jdash/provider/Manager",
	            //|          "klt/core/when", "jdash/provider/JsonRest/JsonRestProvider"],
	            //|  function (Manager, when) {
	            //|    //Create provider instances
	            //|    var provider = Manager.getInstance();
	            //|    //Delete dashboard by id
	            //|    when(provider.deleteDashboard(id),
	            //|         //Handle deffered object
	            //|         function () {
	            //|             //logic on success
	            //|         },
	            //|         function () {
	            //|             //logic on fail                              
	            //|         });
	            //|	   });

	        },

	        getDashlet: function (/* String */ id) {
	            // summary:
	            //		Retrieves the Dashlet object for a specific id.
	            // example:
	            //| require(["jdash/provider/Manager",
	            //|          "jdash/model/DashletModel",
	            //|          "klt/core/when", "jdash/provider/JsonRest/JsonRestProvider"],
	            //|   function (Manager, dashlet, when) {
	            //|    var provider = Manager.getInstance();
	            //|    when(provider.getDashlet(id),
	            //|       function (Dashlet) {
	            //|           //your logic here...
	            //|       },
	            //|       function (err) {
	            //|           console.error(err);
	            //|       });
	            //|  });
	        },
	        searchDashlets: function () {
	            // summary:
	            //		 Returns an array of all Dashlet objects.
	            // example:
	            //| require(["jdash/provider/Manager",
	            //|          "klt/core/when",
	            //|          "jdash/provider/JsonRest/JsonRestProvider"],
	            //|  function (Manager, when, JsonRest) {
	            //|    var provider = Manager.getInstance();
	            //|    when(provider.searchDashlets(),
	            //|         function (modules) {
	            //|             //logic on success
	            //|         },
	            //|         function () {
	            //|             //logic on fail
	            //|         }
	            //|  );
	            //|	});
	        },
	        saveDashlet: function (/* Dashlet */ dashlet) {
	            // summary:
	            //		 Save changes for a Dashlet object
	            // example:
	            //|  require(["jdash/provider/Manager",
	            //|         "klt/core/when",
	            //|         "jdash/provider/JsonRest/JsonRestProvider"],
	            //|   function (Manager, when, JsonRest) {
	            //|     var provider = Manager.getInstance();
	            //|     when(provider.getDashlet(id),
	            //|        function (module) {
	            //|            //Update module title
	            //|            module.set("title", "Updated Title")
	            //|            //Get config object
	            //|            var config = module.get("config");
	            //|            //Change single instance property of module config
	            //|            config.set("singleInstance", false);
	            //|            //Save changes to your data source                
	            //|            when(provider.saveDashlet(module),
	            //|                //Handle deffered object
	            //|                function () {
	            //|                    //logic on success
	            //|                },
	            //|                 function () {
	            //|                     //logic on fail
	            //|                 });
	            //|        },
	            //|          function () {
	            //|              //logic on load fail
	            //|          }
	            //| 	 );
	            //|		});

	        },
	        createDashlet: function (/* Dashlet */ dashlet, /* array */ newPositions) {
	            // summary:
	            //		 For this example please go to the 'Dashlet Development' in documentation  
	        },
	        deleteDashlet: function (/*String*/ id) {
	            // summary:
	            //		 Deletes a dashlet object by id
	            // example:
	            //| require(["jdash/provider/Manager",
	            //|          "jdash/ui/DashletPane",
	            //|          "klt/core/when","jdash/provider/JsonRest/JsonRestProvider"],
	            //|  function (Manager, DashletPane, when) {
	            //|    //Create provider instances
	            //|    var provider = Manager.getInstance();
	            //|    //Delete dashlet by id
	            //|    when(provider.deleteDashlet(id),
	            //|         //Handle deffered object
	            //|         function () {
	            //|             //logic on success
	            //|         },
	            //|         function () {
	            //|             //logic on fail                              
	            //|         });
	            //|		});
	        },
	        deleteDashlets: function (/* Array List */ ids) {
	            // summary:
	            //		Deletes a dashlet object by ids
	            // example:
	            //| require(["jdash/provider/Manager",
	            //|          "jdash/ui/DashletPane",
	            //|          "klt/core/when","jdash/provider/JsonRest/JsonRestProvider"],
	            //|  function (Manager, DashletPane, when) {
	            //|    //Create provider instances
	            //|    var provider = Manager.getInstance();
	            //|    //Delete dashlet by id
	            //|    when(provider.deleteDashlets(["id", "id"]),
	            //|         //Handle deffered object
	            //|         function () {
	            //|             //logic on success
	            //|         },
	            //|         function () {
	            //|             //logic on fail                              
	            //|         });
	            //|  });
	        },
	        updateDashletPositions: function (positions) { },

	        getDashletModule: function (/* String*/ id) {
	            // summary:
	            // 		Returns a DashletModule object with a specific id.
	            // example:
	            //| require(["jdash/provider/Manager",
	            //|          "klt/core/when",
	            //|          "jdash/provider/JsonRest/JsonRestProvider"],
	            //|  function (Manager, when, JsonRest) {
	            //|    var provider = Manager.getInstance();
	            //|    when(provider.getDashletModule(id),
	            //|         function (modules) {
	            //|             //logic on success
	            //|         },
	            //|         function () {
	            //|             //logic on fail
	            //|         }
	            //|  );
	            //|	});
	        },	        
	        searchDashletModules: function () {
	            // summary:
	            // 		Returns an array of all DashletModule objects.
	            // example:
	            //| require(["jdash/provider/Manager",
	            //|          "klt/core/when",
	            //|          "jdash/provider/JsonRest/JsonRestProvider"],
	            //|  function (Manager, when, JsonRest) {
	            //|    var provider = Manager.getInstance();
	            //|    when(provider.searchDashletModules(),
	            //|         function (modules) {
	            //|             //logic on success
	            //|         },
	            //|         function () {
	            //|             //logic on fail
	            //|         }
	            //| 	 );
	            //|		});

	        },
	        searchDashletModules: function (query) { }
	        ,
	        saveDashletModule: function ( /* DashletModule*/ dashletModule) {
	            // summary:
	            //		 Save changes for a Dashlet module object
	            // example:
	            //|  require(["jdash/provider/Manager",
	            //|         "klt/core/when",
	            //|         "jdash/provider/JsonRest/JsonRestProvider"],
	            //|   function (Manager, when, JsonRest) {
	            //|     var provider = Manager.getInstance();
	            //|     when(provider.getDashletModule(id),
	            //|        function (module) {
	            //|            //Update module title
	            //|            module.set("title", "Updated Title")
	            //|            //Get config object
	            //|            var config = module.get("config");
	            //|            //Change single instance property of module config
	            //|            config.set("singleInstance", false);
	            //|            //Save changes to your data source                
	            //|            when(provider.saveDashletModule(module),
	            //|                //Handle deffered object
	            //|                function () {
	            //|                    //logic on success
	            //|                },
	            //|                 function () {
	            //|                     //logic on fail
	            //|                 });
	            //|        },
	            //|          function () {
	            //|              //logic on load fail
	            //|          }
	            //|  );
	            //| });
	        },
	        createDashletModule: function (/* DashletModule object*/ dashletModule) {
	            // summary:
	            //		 To create a new DashletModule object
	            // example:
	            //| require(["jdash/provider/Manager",
	            //|    "jdash/model/DashletModuleModel",
	            //|    "klt/core/when","jdash/provider/JsonRest/JsonRestProvider"],
	            //|    function (Manager, DashletModuleModel, when) {
	            //|        // Create new DashboardModuleModel instance and set its properties.
	            //|        var dashletModule = new DashletModuleModel({
	            //|            path: "jdash/dashlet/RssReader/RssReader",
	            //|            title: "Rss Reader"
	            //|        });
	            //|        var provider = Manager.getInstance();
	            //|        // Call createDashletModule method of provider. Use when function 
	            //|        // to handle both asynchronous and synchronous calls.                           
	            //|        when(provider.createDashletModule(dashletModule),
	            //|      // Handler for sucess
	            //|         function (result) {
	            //|             console.info("Dashlet created successfully. Assigned id is "+
	            //|              result.id);
	            //|         },
	            //|             // Optional error handler
	            //|         function (err) {
	            //|             console.error(err);
	            //|         });
	            //|    });
	        },
	        deleteDashletModule: function (/* string*/ id) {
	            // summary:
	            // 		Deletes a DashletModule object by id
	            // example:
	            //|  require(["jdash/provider/Manager",
	            //|         "klt/core/when",
	            //|         "jdash/provider/JsonRest/JsonRestProvider"],
	            //|   function (Manager, when, JsonRest) {
	            //|    var provider = Manager.getInstance();
	            //|    //Delete dashlet module by id               
	            //|    when(provider.deleteDashletModule(id).then(
	            //|    function () {
	            //|        //logic on success
	            //|    },
	            //|    function () {
	            //|        //logic on fail
	            //|    }));
	            //|	});
	        },
	        getDashletsOfDashboard: function (/* string*/dashboardId, /* Boolean */ withModules) {
	            // summary:
	            //		Returns an array of dashlet objects with a specific dashboard id
	            // example:
	            //| require(["jdash/provider/Manager",
	            //|          "jdash/model/DashletModuleModel",
	            //|          "klt/core/when","jdash/provider/JsonRest/JsonRestProvider"],
	            //| function (Manager, dashletModule, when) {
	            //|    var provider = Manager.getInstance();
	            //|    //Get  dashboard instances by user    
	            //|    when(provider.getDashletsOfDashboard(dashboardId), function (DashletModules) {
	            //|        //your logic here...
	            //|    }, function (err) {
	            //|        console.error(err);
	            //|    });
	            //|	});
	        },

	        startup: function () {
	            this._started = true;
	        }
	    });

	    return mixinClass;
	});


