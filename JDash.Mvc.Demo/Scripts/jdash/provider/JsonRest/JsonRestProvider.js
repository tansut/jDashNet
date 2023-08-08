define(['dojo/_base/declare',
		'dojo/_base/lang',
        '../_ProviderMixin',
        '../Manager',
        './JsonRestStore',
        'dojo/_base/array',
        '../../model/DashletModuleModel',
        '../../model/DashletModel',
        '../../model/DashboardModel'
],
	function (declare, lang, _ProviderMixin, ProviderManager, DashboardStore, array, DashletModuleModel, DashletModel, DashboardModel) {
	    var classDef = declare('DDJRP', [_ProviderMixin], {

	        apiPath: "jdash/api/",

	        postscript: function(args) {
	            declare.safeMixin(this, args);
	        },

	        getDashletModuleClass: function () {
	            return DashletModuleModel;
	        },

	        inTransaction: false,

	        transaction: function () {
	            this.operations = [];
	            this.inTransaction = true;
	            var store = this;
	            return {
	                commit: function () {
	                    var tempStore = new DashboardStore({ target: '/api/Transact/Transact' }).put(store.operations);
	                    tempStore.then(function (tempStore) {
	                        store.inTransaction = false;
	                        store.operations = [];
	                    });
	                    return tempStore;
	                },
	                abort: function () {
	                    store.inTransaction = false;
	                }
	            };
	        },

	        callMethod: function (target, args, method) {

	            if (this.inTransaction)
	                this.operations.push({ Method: target, Args: args });
	            else {
	                var obj = new DashboardStore({ target: this.apiPath + target });
	                if (method == "query") {
	                    if (args.length == 0) args[0] = {};
	                    if (lang.isObject(args[0]))
	                        lang.mixin(args[0], { guid: Math.floor(Math.random() * 100000000000) + 1 });
	                }
	                var methodFunction = obj[method];
	                return methodFunction.apply(obj, args);
	            }
	        },

	        _createSingleModel: function (items, modelClass) {
	            return new modelClass(lang.mixin(items, { _serialized: true }));
	        },

	        _createModels: function (items, modelClass) {
	            return array.map(items, function (item) {
	                return this._createSingleModel(item, modelClass);
	            }, this);
	        },

	        //#region Dashboard Methods
	        getDashboard: function (/* String */ id) {
	            // summary:
	            //		Retrieves the Dashboard object for a specific id.
	            // id:
	            //		Dashboard id
	            // example:
	            // |	require(["jdash/provider/Manager",
	            // |			"klt/core/when"],
	            // |		function (Manager, when) {
	            // |		var provider = Manager.getInstance();
	            // |		when(provider.getDashboard("2"),
	            // |			function (Dashboard) {
	            // |	            //your logic here...
	            // |			},
	            // |			function (err) {
	            // |				console.error(err);
	            // |			});
	            // |	});
	            var self = this;
	            return this.callMethod('GetDashboard', [{ id: id }], 'query').then(function (result) {
	                return self._createSingleModel(result, DashboardModel);
	            }); //Dashboard Object
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
	            var self = this;
	            var advQuery = arguments.length > 0 && lang.isObject(arguments[0]);
	            var query = arguments[0] || {};
	            return this.callMethod('SearchDashboards', [query], 'add').then(function (result) {
	                result.data = self._createModels(result.data, DashboardModel)
	                return advQuery ? result : result.data;
	            });
	        },
	        saveDashboard: function (/* Dashboard */ dashboard) {
	            // summary:
	            //      Save changes for a dashboard object.
	            // dashboard:
	            //      Dashboard object
	            // example:
	            // |	    require(["jdash/provider/Manager",
	            // |	             "jdash/ui/DashboardView",
	            // |	             "klt/core/when"],
	            // |	     function (Manager, dashboard, when) {
	            // |	       var provider = Manager.getInstance();        
	            // |	       when(provider.getDashboard("2"), 
	            // |	            function (dashboard) {
	            // |	                //update "title" property of dashboard
	            // |	                dashboard.set("title", "My Dashboard");
	            // |	                //Save changes
	            // |	                when(provider.saveDashboard(dashboardToUpdate),
	            // |	                     function () {
	            // |	                         //logic on success
	            // |	                     },
	            // |	                     function () {
	            // |	                         //logic on fail
	            // |	                     }
	            // |	                );
	            // |	            }, 
	            // |	            function (err) {
	            // |	                console.error(err);
	            // |	            });
	            // |	    });
	            var self = this;
	            return this.callMethod('SaveDashboard/', [dashboard.serialized()], 'put').then(function (result) {
	                return self._createSingleModel(result, DashboardModel);
	            });
	        },

	        createDashboard: function (/* Dashboard */ dashboard) {
	            // summary:
	            //      Creates a new Dashboard at datasource.
	            // dashboard: 
	            //      Dashboard object
	            // example:  
	            // |	   require(["jdash/provider/Manager",
	            // |	            "klt/core/when"], 
	            // |	    function (Manager, when) {
	            // |	          // Create new DashboardModel instance and set its properties.
	            // |	       var dashboard = new DashboardModel({
	            // |	           title: "My first dashboard",
	            // |	           layout: "table"
	            // |	       });
	            // |	       // Get instance of default client provider
	            // |	       var provider = Manager.getInstance();
	            // |	       // Call createDashboard method of provider. Use when function 
	            // |	       // to handle both asynchronous and synchronous calls.
	            // |	       when(provider.createDashboard(dashboard),
	            // |	          // Handler for sucess
	            // |	           function (result) {
	            // |	               console.info("Dashboard created successfully. Assigned id is "+
	            // |	               result.id);
	            // |	           },
	            // |	           // Optional error handler
	            // |	           function (err) {
	            // |	               console.error(err);
	            // |	          });
	            // |	   });
	            var self = this;
	            return this.callMethod('CreateDashboard', [dashboard.serialized()], 'add').then(function (result) {
	                return self._createSingleModel(result, DashboardModel);
	            });
	        },

	        deleteDashboard: function (/* String */ id) {
	            // summary:
	            //      Deletes a Dashboard  by id.
	            // id:
	            //      Dashboard id
	            // example:
	            // |	    require(["jdash/provider/Manager",
	            // |	             "jdash/ui/DashboardView",
	            // |	             "klt/core/when"],
	            // |	     function (Manager, dashboard, when) {
	            // |	       //Create provider instances
	            // |	       var provider = Manager.getInstance();
	            // |	       //Delete dashboard by id
	            // |	       when(provider.deleteDashboard("2"),
	            // |	            //Handle deffered object
	            // |	            function () {
	            // |	                //logic on success
	            // |	            },
	            // |	            function () {
	            // |	                //logic on fail                              
	            // |	            });
	            // |	   });
	            return this.callMethod('DeleteDashboard/', [id], 'remove');
	        },
	        //#endregion

	        //#region Dashlet Methods
	        getDashlet: function (/* String */ id) {
	            // summary:
	            //		Retrieves the Dashlet object for a specific id.
	            // id:
	            //      Dashlet id
	            // example:
	            // |	    require(["jdash/provider/Manager",
	            // |	             "klt/core/when"],
	            // |	      function (Manager, when) {
	            // |	       var provider = Manager.getInstance();
	            // |	       when(provider.getDashlet("2"), 
	            // |	          function (Dashlet) {
	            // |	              //your logic here...
	            // |	          },
	            // |	          function (err) {
	            // |	              console.error(err);
	            // |	          });
	            // |	   });
	            var self = this;
	            return this.callMethod('GetDashlet', [{ id: id }], 'query').then(function (result) {
	                return self._createSingleModel(result, DashletModel);
	            });
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

	            var self = this;
	            var advQuery = arguments.length > 0 && lang.isObject(arguments[0]);
	            var query = arguments[0] || {};
	            return this.callMethod('SearchDashlets', [query], 'add').then(function (result) {
	                result.data = self._createModels(result.data, DashletModel)
	                return advQuery ? result : result.data;
	            });
	        },
	        saveDashlet: function (/* Dashlet */ dashlet) {
	            // summary:
	            //      Save changes for a Dashlet object.
	            // dashlet:
	            //      Dashlet object
	            // example:
	            // |	    require(["jdash/provider/Manager",
	            // |	             "klt/core/when",
	            // |	             "jdash/provider/JsonRest/JsonRestProvider"],
	            // |	     function (Manager, when, JsonRest) {
	            // |	        var provider = Manager.getInstance();
	            // |	        when(provider.getDashlet("2"),
	            // |	           function (module) {
	            // |	               //Update module title
	            // |	               module.set("title", "Updated Title")
	            // |	               //Get config object
	            // |	               var config = module.get("config");
	            // |	               //Change single instance property of module config
	            // |	               config.set("singleInstance", false);
	            // |	               //Save changes to your data source                
	            // |	               when(provider.saveDashlet(module),
	            // |	                   //Handle deffered object
	            // |	                   function () {
	            // |	                       //logic on success
	            // |	                   },
	            // |	                    function () {
	            // |	                       //logic on fail
	            // |	                   });
	            // |	                },
	            // |	             function () {
	            // |	                 //logic on load fail
	            // |	             }
	            // |	         );
	            // |	   });
	            var self = this;
	            return this.callMethod('SaveDashlet/', [dashlet.serialized()], 'put').then(function (result) {
	                return self._createSingleModel(result, DashletModel);
	            });
	        },

	        createDashlet: function (/* Dashlet */ dashlet, /* array */ newPositions) {
	            // summary:
	            //		 For this example please go to the 'Dashlet Development' in documentation.
	            var self = this;
	            var reqParam = { model: dashlet.serialized() };
	            if (newPositions && newPositions.length > 0) {
	                lang.mixin(reqParam, { positions: newPositions });
	            }
	            return this.callMethod('CreateDashlet', [reqParam], 'add').then(function (result) {
	                return self._createSingleModel(result, DashletModel);
	            });
	        },

	        deleteDashlet: function (/* String */ id) {
	            // summary:
	            //      Deletes a dashlet object by id.
	            // id:
	            //      Dashlet id
	            // example:
	            // |	require(["jdash/provider/Manager",
	            // |			 "jdash/ui/DashletPane",
	            // |			 "klt/core/when"],
	            // |		function (Manager, DashletPane, when) {
	            // |		//Create provider instances
	            // |		var provider = Manager.getInstance();
	            // |		//Delete dashlet by id
	            // |		when(provider.deleteDashlet("2"),
	            // |		//Handle deffered object
	            // |			function () {
	            // |				//logic on success
	            // |			},
	            // |				function () {
	            // |			//logic on fail                              
	            // |			});
	            // |	});
	            return this.callMethod('DeleteDashlet/', [id], 'remove');
	        },

	        getDashletsOfDashboard: function (/* String */ dashboardId, /* Boolean */ withModules) {
	            // summary:
	            //      Returns an array of dashlet objects with a specific dashboard id and with dashletModule mode.
	            // dashboardId:
	            //      Dashboard id
	            // withModules:
	            //      Include modules
	            // example:
	            // |	    require(["jdash/provider/Manager",
	            // |	             "klt/core/when"],
	            // |	     function (Manager, when) {
	            // |	       var provider = Manager.getInstance();
	            // |	       //Get  dashboard instances by user    
	            // |	       when(provider.getDashletsOfDashboard("2"), function (DashboardDashlets) {
	            // |	           //your logic here...
	            // |	       }, function (err) {
	            // |	           console.error(err);
	            // |	       });
	            // |	   });
	            if (!withModules) withModules = false;
	            var self = this;
	            return this.callMethod('GetDashboardDashlets', [{ dashboardId: dashboardId, withModules: withModules }], 'query').then(
                    function (result) {
                        if (withModules) {
                            var modules = result.modules.data;
                            var dashlets = result.dashlets.data;
                            array.forEach(dashlets, function (dashlet) {
                                var module = array.filter(modules, function (module) {
                                    return module.id == dashlet.moduleId;
                                });
                                dashlet.module = self._createSingleModel(lang.clone(module[0]), self.getDashletModuleClass()) ;
                            });
                            return self._createModels(dashlets, DashletModel);
                        } else
                            return self._createModels(result.dashlets.data, DashletModel);
                    });
	        },

	        updateDashletPositions: function (/* String Array */positions) {
	            // summary:
	            //		When the user changes dashlet position, this function runs automatically.
	            var self = this;
	            return this.callMethod('UpdateDashletPositions', [positions], 'add');

	        },
	        //#endregion

	        //#region DashletModule Methods
	        getDashletModule: function (/* String */ id) {
	            // summary:
	            //      Returns a DashletModule object with a specific id.
	            // id:
	            //      DashletModule id
	            // example:
	            // |	    require(["jdash/provider/Manager",
	            // |	             "klt/core/when",
	            // |	             "jdash/provider/JsonRest/JsonRestProvider"],
	            // |	     function (Manager, when, JsonRest) {
	            // |	       var provider = Manager.getInstance();
	            // |	       when(provider.getDashletModule("2"),
	            // |	            function (DashletModule) {
	            // |	                //logic on success
	            // |	            },
	            // |	            function () {
	            // |	                //logic on fail
	            // |	            }
	            // |	       );
	            // |	   });
	            var self = this;
	            return this.callMethod('GetDashletModule', [{ id: id }], 'query').then(function (result) {
	                return self._createSingleModel(result, self.getDashletModuleClass());
	            });
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
	            var self = this;
	            var advQuery = arguments.length > 0 && lang.isObject(arguments[0]);
	            var query = arguments[0] || {};
	            return this.callMethod('SearchDashletModules', [query], 'add').then(
                    function (result) {
                        result.data = self._createModels(result.data, self.getDashletModuleClass());
                        return advQuery ? result : result.data;
                    }
                );
	        },
	        saveDashletModule: function (/* DashletModule */ dashletModule) {
	            // summary:
	            //      Save changes for a DashletModule object.
	            // dashletModule:
	            //      DashletModule object
	            // example:
	            // |	    require(["jdash/provider/Manager",
	            // |	             "klt/core/when",
	            // |	             "jdash/provider/JsonRest/JsonRestProvider"],
	            // |	      function (Manager, when, JsonRest) {
	            // |	      var provider = Manager.getInstance();
	            // |	      when(provider.getDashletModule("2"),
	            // |	           function (module) {
	            // |	               //Update module title
	            // |	               module.set("title", "Updated Title")
	            // |	               //Get config object
	            // |	               var config = module.get("config");
	            // |	               //Change single instance property of module config
	            // |	               config.set("singleInstance", false);
	            // |	               //Save changes to your data source                
	            // |	               when(provider.saveDashletModule(DashletModule),
	            // |	                   //Handle deffered object
	            // |	                   function () {
	            // |	                       //logic on success
	            // |	                   },
	            // |	                    function () {
	            // |	                       //logic on fail
	            // |	                    });
	            // |	           },
	            // |	        function () {
	            // |	            //logic on load fail
	            // |	        }
	            // |	     );
	            // |	   });
	            var self = this;
	            return this.callMethod('SaveDashletModule/', [dashletModule.serialized()], 'put').then(function (result) {
	                return self._createSingleModel(result, self.getDashletModuleClass());
	            });
	        },

	        createDashletModule: function (/* DashletModule */ dashletModule) {
	            // summary:
	            //      Creates a new DashletModule object.     
	            // dashletModule:
	            //      DashletModule object
	            // example:
	            // |	    require(["jdash/provider/Manager",
	            // |	             "klt/core/when"],
	            // |	       function (Manager, when) {
	            // |	           // Create new DashboardModuleModel instance and set its properties.
	            // |	           var dashletModule = new DashletModuleModel({
	            // |	               path:  "jdash/dashlet/RssReader/RssReader",
	            // |	               title: "Rss Reader"
	            // |	           });
	            // |	           var provider = Manager.getInstance();
	            // |	           // Call createDashletModule method of provider. Use when function 
	            // |	           // to handle both asynchronous and synchronous calls.                           
	            // |	           when(provider.createDashletModule(dashletModule),
	            // |	           // Handler for sucess
	            // |	            function (result) {
	            // |	                console.info("Dashlet created successfully. Assigned id is "+
	            // |	                              result.id);
	            // |	            },
	            // |	                // Optional error handler
	            // |	            function (err) {
	            // |	                console.error(err);
	            // |	            });
	            // |	    });
	            var self = this;
	            return this.callMethod('CreateDashletModule', [dashletModule.serialized()], 'add').then(function (result) {
	                return self._createSingleModel(result, self.getDashletModuleClass());
	            });
	        },
	        getDashletGroups: function () {
	            return this.callMethod('GetDashletGroups/',[], 'query');
	        },
	        deleteDashletModule: function (/* String */ id) {
	            // summary:
	            //      Deletes a DashletModule object by id.
	            // id:
	            //       DashletModule id
	            // example:
	            // |	    require(["jdash/provider/Manager",
	            // |	             "klt/core/when",
	            // |	             "jdash/provider/JsonRest/JsonRestProvider"],
	            // |	      function (Manager, when, JsonRest) {
	            // |	       var provider = Manager.getInstance();
	            // |	       //Delete dashlet module by id               
	            // |	       when(provider.deleteDashletModule("2").then(
	            // |	       function () {
	            // |	           //logic on success
	            // |	       },
	            // |	       function () {
	            // |	           //logic on fail
	            // |	       }));
	            // |	   });
	            return this.callMethod('DeleteDashletModule/', [id], 'remove');
	        }
	        //#endregion
	    });

	    lang.mixin(classDef, {
	        description: "Provider for Jsonrest data stores. © 2012 Kalitte."
	    });

	    ProviderManager.register('JsonRest', classDef);

	    return classDef;
	});