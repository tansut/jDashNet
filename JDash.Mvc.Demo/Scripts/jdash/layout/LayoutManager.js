define(['dojo/_base/declare', 'dojo/_base/lang', '../ui/_WidgetBase', '../ui/_TemplatedMixin'],
    function (declare, lang, _WidgetBase, _TemplatedMixin) {
        var LayoutManager = declare('jdash.LayoutManager', null, {
            constructor: function() {
                this._layouts = {};
            },

            list: function() {
                return this._layouts;
            },

            register: function (name, type) {
                if (this._layouts[name])
                    throw new Error('Layout is already registered');
                this._layouts[name] = { Class: type };
            },

            unRegister: function (name) {
                if (!this._layouts[name])
                    throw new Error('Layout is not registered');
                delete this._layouts[name];
            },

            get: function (name) {
                if (!this._layouts[name])
                    throw new Error('Layout is not registered');
                return this._layouts[name];
            }
        });

        var singleton = new LayoutManager();

        return singleton;
    }); 