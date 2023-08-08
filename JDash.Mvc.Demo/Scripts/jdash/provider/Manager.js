define(['dojo/_base/declare',
		'dojo/_base/lang',
        './_ProviderMixin',
        'require'
],
	function (declare, lang, _Provider, require) {

	    return (function (window) {
	        var _providers = {};

	        function _getDefaultProviderName() {
	            var id = null;
	            for (var i in _providers) {	                
	                id = i;
	                break;
	            }
	            return id;
	        }

	        var res = {

	            getInstance: function (name, args) {
	                if (!name && res.current)
	                    return res.current;
	                name = name || _getDefaultProviderName();
	                var info = this.get(name);
	                if (!info.instance) {
	                    info.instance = new info.type(args);
	                }
	                return info.instance;
	            },


	            register: function (name, type, isDefault, args) {
	                if (_providers[name])
	                    throw new Error('Provider is already registered');
	                _providers[name] = { type: type };
	                if (!res.current)
	                    res.current = res.getInstance(name, args);
	                else if (isDefault)
	                    res.current = res.getInstance(name, args);
	            },

	            unRegister: function (name) {
	                if (!_providers[name])
	                    throw new Error('Provider is not registered');
	                delete _providers[name];
	            },

	            get: function (name) {
	                if (!name)
	                    return _providers;
	                if (!_providers[name])
	                    throw new Error('Provider is not registered');
	                return _providers[name];
	            },

	            list: function () {
	                return this.get();
	            }
	        }	        

	        lang.setObject("jdash.ProviderManager", res);
	        return res;

	    }(window));
	});