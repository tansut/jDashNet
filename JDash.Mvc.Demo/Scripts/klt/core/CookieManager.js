
define(['dojo/_base/declare',
		'dojo/_base/lang'],
	function (declare, lang) {
	    return declare('klt.core.CookieManager',null, {	 

	        EPOCH : 'Thu, 01-Jan-1970 00:00:01 GMT',	        
	        RATIO : 1000 * 60 * 60 * 24,	        
	        KEYS : ['expires', 'path', 'domain'],	        
	        esc : escape, un : unescape,
	        enabled: false,

	        _get_now : function() {
	            var r = new Date();
	            r.setTime(r.getTime());
	            return r;
	        },

	        _cookify : function(c_key, c_val /*, opt */) {
	            var i, key, val, r = [],
                opt = (arguments.length > 2) ? arguments[2] : {};
	            r.push(this.esc(c_key) + '=' + this.esc(c_val));
	            for (i = 0; i < this.KEYS.length; i++) {
	                key = this.KEYS[i];
	                if (val = opt[key])
	                    r.push(key + '=' + val);
	            }
	            if (opt.secure)
	                r.push('secure');
	            return r.join('; ');
	        },
	 
	        _alive : function() {
	            var k = '__EC_TEST__', 
                    v = new Date();
	            v = v.toGMTString();
	            this.set(k, v);
	            this.enabled = (this.remove(k) == v);
	            return this.enabled;
	        },

	        
	        set: function(key, val /*, opt */) {
	            var opt = (arguments.length > 2) ? arguments[2] : {}, 
                    now = this._get_now(),
                    expire_at,
                    cfg = {};
	            
	            if (opt.expires) {
	                opt.expires *= this.RATIO;	                
	                cfg.expires = new Date(now.getTime() + opt.expires);
	                cfg.expires = cfg.expires.toGMTString();
	            }
	           
	            var keys = ['path', 'domain', 'secure'];
	            for (i = 0; i < keys.length; i++)
	                if (opt[keys[i]])
	                    cfg[keys[i]] = opt[keys[i]];

	            var r = this._cookify(key, val, cfg);
	            document.cookie = r;

	            return val;
	        },

	       
	        has: function(key) {
	            key = this.esc(key);

	            var c = document.cookie,
                    ofs = c.indexOf(key + '='),
                    len = ofs + key.length + 1,
                    sub = c.substring(0, key.length);	            
	            return ((!ofs && key != sub) || ofs < 0) ? false : true;
	        },

	       
	        get: function(key) {
	            key = this.esc(key);

	            var c = document.cookie, 
                    ofs = c.indexOf(key + '='),
                    len = ofs + key.length + 1,
                    sub = c.substring(0, key.length),
                    end;	            
	            if ((!ofs && key != sub) || ofs < 0)
	                return null;	            
	            end = c.indexOf(';', len);
	            if (end < 0) 
	                end = c.length;	            
	            return this.un(c.substring(len, end));
	        },

	        
	        remove: function(k) {
	            var r = this.get(k), 
                    opt = { expires: this.EPOCH };
	            document.cookie = this._cookify(k, '', opt);
	            return r;
	        },

	     
	        keys: function() {
	            var c = document.cookie, 
                    ps = c.split('; '),
                    i, p, r = [];
	            for (i = 0; i < ps.length; i++) {
	                p = ps[i].split('=');
	                r.push(this.un(p[0]));
	            }
	            return r;
	        },
  
	       
	        all: function() {
	            var c = document.cookie, 
                    ps = c.split('; '),
                    i, p, r = [];
	            for (i = 0; i < ps.length; i++) {
	                p = ps[i].split('=');
	                r.push([this.un(p[0]), this.un(p[1])]);
	            }
	            return r;
	        }
	})
});