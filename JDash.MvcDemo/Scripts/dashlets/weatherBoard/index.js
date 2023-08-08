define(["require"], function (require) {
    return {
        getWeatherImage: function (result, isBig) {
            if (result && result.code) {
                var weatherImageInd = "";
                switch (parseInt(result.code)) {
                    case 0:
                        weatherImageInd = 4;
                        break;
                    case 1:
                        weatherImageInd = 4;
                        break;
                    case 2:
                        weatherImageInd = 4;
                        break;
                    case 3:
                        weatherImageInd = 4;
                        break;
                    case 4:
                        weatherImageInd = 4;
                        break;
                    case 5:
                        weatherImageInd = 7;
                        break;
                    case 6:
                        weatherImageInd = 7;
                        break;
                    case 7:
                        weatherImageInd = 7;
                        break;
                    case 8:
                        weatherImageInd = 13;
                        break;
                    case 9:
                        weatherImageInd = 7;
                        break;
                    case 10:
                        weatherImageInd = 13;
                        break;
                    case 11:
                    case 12:
                        weatherImageInd = 10;
                        break;
                    case 13:
                    case 16:
                        weatherImageInd = 6;
                        break;
                    case 14:
                        weatherImageInd = 6;
                        break;
                    case 15:
                        weatherImageInd = 12;
                        break;
                    case 17:
                        weatherImageInd = 13;
                        break;
                    case 18:
                        weatherImageInd = 7;
                        break;
                    case 19:
                        weatherImageInd = 9;
                        break;
                    case 20:
                        weatherImageInd = 2;
                        break;
                    case 21:
                        weatherImageInd = 11;
                        break;
                    case 22:
                        weatherImageInd = 11;
                        break;
                    case 23:
                        weatherImageInd = 9;
                        break;
                    case 24:
                        weatherImageInd = 9;
                        break;
                    case 25:
                        weatherImageInd = 3;
                        break;
                    case 26:
                    case 44:
                        weatherImageInd = 8;
                        break;
                    case 27:
                        weatherImageInd = 2;
                        break;
                    case 28:
                        weatherImageInd = 2;
                        break;
                    case 29:
                        weatherImageInd = 8;
                        break;
                    case 30:
                        weatherImageInd = 8;
                        break;
                    case 31:
                        weatherImageInd = 1;
                        break;
                    case 32:
                        weatherImageInd = 1;
                        break;
                    case 33:
                        weatherImageInd = 1;
                        break;
                    case 34:
                        weatherImageInd = 1;
                        break;
                    case 35:
                        weatherImageInd = 13;
                        break;
                    case 36:
                        weatherImageInd = 1;
                        break;
                    case 37:
                        weatherImageInd = 4;
                        break;
                    case 38:
                    case 39:
                        weatherImageInd = 4;
                        break;
                    case 40:
                        weatherImageInd = 10;
                        break;
                    case 41:
                    case 43:
                        weatherImageInd = 12;
                        break;
                    case 42:
                        weatherImageInd = 6;
                        break;
                    case 45:
                        weatherImageInd = 4;
                        break;
                    case 45:
                        weatherImageInd = 6;
                        break;
                    default:
                        var cond = "";

                }
            }
            var bgImage = "";
            switch (weatherImageInd) {
                case 1:
                    bgImage = "sunny";
                    break;
                case 2:
                    bgImage = "Sunny-Period";
                    break;
                case 3:
                    bgImage = "snow";
                    break;
                case 4:
                    bgImage = "Showers";
                    break;
                case 5:
                    rbgImage = "overcast";
                    break;
                case 6:
                    bgImage = "snow";
                    break;
                case 7:
                    bgImage = "Showers";
                    break;
                case 8:
                    bgImage = "Cloudy";
                    break;
                case 9:
                    bgImage = "wind";
                    break;
                case 10:
                    bgImage = "Showers";
                    break;
                case 11:
                    bgImage = "fog";
                    break;
                case 12:
                    bgImage = "light-rain";
                    break;
                case 13:
                    bgImage = "rain";
                    break;

            }
            if (!isBig) {
                bgImage += "-64";
            }
            return require.toUrl("./resources/" + bgImage + ".png");
        },
        setCurrentWeather: function (weather, locationInfo) {
            var self = this;
            var current = self.createBodyElement("div", "current", "", this.viewNode);
            var wImg = self.createBodyElement("img", "weatherImage", "", current);
            wImg.setAttribute("src", self.getWeatherImage(weather, true));
            self.createBodyElement("span", "temp", weather.temp + "&#8451;", current);
            var location = self.createBodyElement("div", "location", "", current);

            self.createBodyElement("h1", null, locationInfo, location);
            self.createBodyElement("span", null, weather.date, location);
            var conditions = self.createBodyElement("div", "conditions", "", current);
            self.createBodyElement("span", null, weather.text, conditions);
        },
        setForecast: function (forecastData) {
            var self = this;
            var forecast = $(".forecast", this.viewNode)[0];
            if (!forecast) {
                forecast = self.createBodyElement("ul", "forecast", "", this.viewNode);
            }
            var forecastli = self.createBodyElement("li", "tip", "", forecast);
            forecastli.setAttribute("title", forecastData.text);
            self.createBodyElement("span", "day", forecastData.day, forecastli);
            var wImg = self.createBodyElement("img",null, "", forecastli);
            wImg.setAttribute("src", self.getWeatherImage(forecastData, false));
            wImg.setAttribute("title", "");

            self.createBodyElement("span", "high", forecastData.high + "&#8451;", forecastli);
            self.createBodyElement("span", "low", forecastData.low + "&#8451;", forecastli);
        },
        createBodyElement: function (tag, classAttr, html, appendTo) {
            var domNode = document.createElement(tag);
            if(classAttr)
            domNode.setAttribute("class", classAttr);
            domNode.innerHTML = html;
            if (appendTo)
                appendTo.appendChild(domNode);
            return domNode;
        },
        getWeather: function (cityName) {
            var self = this;
            var now = new Date();
            var query = "select * from weather.forecast where woeid in (select woeid from geo.places where text='" + cityName + "' ) and u='c'";
            var api = 'http://query.yahooapis.com/v1/public/yql?q=' + encodeURIComponent(query) + '&rnd=' + now.getFullYear() + now.getMonth() + now.getDay() + now.getHours() + '&format=json&callback=?';
            $.getJSON(api, function (data) {
                var response = data.query.results.channel[0];
           
                self.setCurrentWeather(response.item.condition, response.location.city + "," + response.location.country);
                var forecast = response.item.forecast;
                for (var i = 0; i < forecast.length; i++) {
                    self.setForecast(forecast[i]);
                }
            });
        },
        initialize: function (context, viewNode) {
            var self = this;
            var city = self.context.config.get("city") ? self.context.config.get("city") : "";
            var isCurrentCity = self.context.config.get("isCurrentCity") != null ? self.context.config.get("isCurrentCity") : true;
            if (isCurrentCity) {
                $.get("http://smart-ip.net/geoip-json?callback=GetUserInfo", function (response) {                    
                    self.getWeather(response.city);
                }, "jsonp");
            } else {
                self.getWeather(city);
            }
        }
    }
});
