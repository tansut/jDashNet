define([
    "require",
    "dojo/_base/lang"],
    function (require, lang) {
        return function (params) {
            this.context = params.context;
            this.context.loadResource(require.toUrl("./resources/weatherStyle.css"), "css");

            params.context.pane.containerNode.parentNode.style.padding = "0 0 0 0";
            this.createBodyElement = function (tag, classAttr, html, appendTo) {
                var domNode = document.createElement(tag);
                domNode.appendChild
                domNode.setAttribute("class", classAttr);
                domNode.innerHTML = html;
                if (appendTo) appendTo.appendChild(domNode);
                return domNode;
            }
            this.getDate = function () {
                var today = new Date();
                var dd = today.getDate();
                var mm = today.getMonth() + 1;
                var yyyy = today.getFullYear();
                if (dd < 10) { dd = '0' + dd } if (mm < 10) { mm = '0' + mm } today = dd + '/' + mm + '/' + yyyy;
                return today;
            }
            this.appendDateBox = function (dateBoxModel) {
                var board = this.createBodyElement("div", "board", "", this.container);
                this.createBodyElement("span", "cityLabel", dateBoxModel.city, board);
                var wImg = this.createBodyElement("img", "weatherImage", "", board);
                wImg.setAttribute("src", require.toUrl(dateBoxModel.img));
                this.createBodyElement("span", "watherLabel", dateBoxModel.heat, board);
                this.createBodyElement("span", "desc", dateBoxModel.desc, board);
            }
            this.loadWeather = function (slc, disp) {
                var self = this;
                var weatherImage = null;
                var weatherImageInd;
                var target = "http://query.yahooapis.com/v1/public/yql?q=select%20*%20from%20weather.forecast%20where%20location%20in%20(%0Aselect%20id%20from%20weather.search%20where%20query%3D%22" + slc + "%2C%20turkey%22%0A)%20and%20u%3D'c'%3B&format=json&diagnostics=true&env=store%3A%2F%2Fdatatables.org%2Falltableswithkeys&callback=?";
                $.getJSON(target, function (data) {                    
                    if (data.query.results) {
                        var response = data.query.results.channel[0] || data.query.results.channel;
                        var result = response.item.condition;
                        if (result && result.code) {
                            switch (parseInt(result.code)) {
                                case 0:
                                    var cond = "Fırtına";
                                    weatherImageInd = 4;
                                    break;
                                case 1:
                                    var cond = "Tropik Fırtına";
                                    weatherImageInd = 4;
                                    break;
                                case 2:
                                    var cond = "Kasırga";
                                    weatherImageInd = 4;
                                    break;
                                case 3:
                                    var cond = "Şiddetli Fırtına";
                                    weatherImageInd = 4;
                                    break;
                                case 4:
                                    var cond = "Gökgürültülü Fırtına";
                                    weatherImageInd = 4;
                                    break;
                                case 5:
                                    var cond = "Karla Karışık Yağmur";
                                    weatherImageInd = 7;
                                    break;
                                case 6:
                                    var cond = "Yağmur ve Sulu Kar";
                                    weatherImageInd = 7;
                                    break;
                                case 7:
                                    var cond = "Kar ve Sulu Kar";
                                    weatherImageInd = 7;
                                    break;
                                case 8:
                                    var cond = "Soğuk Hafif Yağmur";
                                    weatherImageInd = 13;
                                    break;
                                case 9:
                                    var cond = "Yağmur ve Sulu Kar";
                                    weatherImageInd = 7;
                                    break;
                                case 10:
                                    var cond = "Soğuk Yağmur";
                                    weatherImageInd = 13;
                                    break;
                                case 11:
                                case 12:
                                    var cond = "Sağnak Yağmur";
                                    weatherImageInd = 10;
                                    break;
                                case 13:
                                case 16:
                                    var cond = "Kar";
                                    weatherImageInd = 6;
                                    break;
                                case 14:
                                    var cond = "Hafif Kar";
                                    weatherImageInd = 6;
                                    break;
                                case 15:
                                    var cond = "Tipi";
                                    weatherImageInd = 12;
                                    break;
                                case 17:
                                    var cond = "Dolu";
                                    weatherImageInd = 13;
                                    break;
                                case 18:
                                    var cond = "Sulu Kar";
                                    weatherImageInd = 7;
                                    break;
                                case 19:
                                    var cond = "Tozlu";
                                    weatherImageInd = 9;
                                    break;
                                case 20:
                                    var cond = "Bulutlu";
                                    weatherImageInd = 2;
                                    break;
                                case 21:
                                    var cond = "Hafif Sis";
                                    weatherImageInd = 11;
                                    break;
                                case 22:
                                    var cond = "Sisli";
                                    weatherImageInd = 11;
                                    break;
                                case 23:
                                    var cond = "Sert Rüzgarlı";
                                    weatherImageInd = 9;
                                    break;
                                case 24:
                                    var cond = "Rüzgarlı";
                                    weatherImageInd = 9;
                                    break;
                                case 25:
                                    var cond = "Don";
                                    weatherImageInd = 3;
                                    break;
                                case 26:
                                case 44:
                                    var cond = "Parçalı Bulutlu";
                                    weatherImageInd = 8;
                                    break;
                                case 27:
                                    var cond = "Gece Bulutlu";
                                    weatherImageInd = 2;
                                    break;
                                case 28:
                                    var cond = "Gündüz Bulutlu";
                                    weatherImageInd = 2;
                                    break;
                                case 29:
                                    var cond = "Gece Parçarlı Bulutlu";
                                    weatherImageInd = 8;
                                    break;
                                case 30:
                                    var cond = "Gündüz Parçalı Bulutlu";
                                    weatherImageInd = 8;
                                    break;
                                case 31:
                                    var cond = "Açık";
                                    weatherImageInd = 1;
                                    break;
                                case 32:
                                    var cond = "Güneşli";
                                    weatherImageInd = 1;
                                    break;
                                case 33:
                                    var cond = "Gece Açık";
                                    weatherImageInd = 1;
                                    break;
                                case 34:
                                    var cond = "Gündüz Açık";
                                    weatherImageInd = 1;
                                    break;
                                case 35:
                                    var cond = "Yağmur ve Dolu Karışık";
                                    weatherImageInd = 13;
                                    break;
                                case 36:
                                    var cond = "Sıcak";
                                    weatherImageInd = 1;
                                    break;
                                case 37:
                                    var cond = "İsole Fırtına";
                                    weatherImageInd = 4;
                                    break;
                                case 38:
                                case 39:
                                    var cond = "Parçalı Fırtına";
                                    weatherImageInd = 4;
                                    break;
                                case 40:
                                    var cond = "Parçalı Şağnak Yağış";
                                    weatherImageInd = 10;
                                    break;
                                case 41:
                                case 43:
                                    var cond = "Yoğun Kar Yağışı";
                                    weatherImageInd = 12;
                                    break;
                                case 42:
                                    var cond = "Parçalı Kar Yağışı";
                                    weatherImageInd = 6;
                                    break;
                                case 45:
                                    var cond = "Gökgürültülü Sağnak";
                                    weatherImageInd = 4;
                                    break;
                                case 45:
                                    var cond = "Sağnak Kar";
                                    weatherImageInd = 6;
                                    break;
                                default:
                                    var cond = "";

                            }
                        } else { return; }

                        //weatherResult.innerHTML = disp + "<br>" + result.temp + " derece <br>" + cond;
                        
                        var bgImage = "";
                        switch (weatherImageInd) {
                            case 1:
                                bgImage = "acik.png";
                                break;
                            case 2:
                                bgImage = "azbulutlu.png";
                                break;
                            case 3:
                                bgImage = "don.png";
                                break;
                            case 4:
                                bgImage = "gokgurultulusagnak.png";
                                break;
                            case 5:
                                rbgImage = "kapali.png";
                                break;
                            case 6:
                                bgImage = "kar.png";
                                break;
                            case 7:
                                bgImage = "karlakarisik.png";
                                break;
                            case 8:
                                bgImage = "parcalibulutlu.png";
                                break;
                            case 9:
                                bgImage = "ruzgarli.png";
                                break;
                            case 10:
                                bgImage = "sagnak.png";
                                break;
                            case 11:
                                bgImage = "sis.png";
                                break;
                            case 12:
                                bgImage = "tipi.png";
                                break;
                            case 13:
                                bgImage = "yagmur.png";
                                break;

                        }
                        
                        self.appendDateBox({ city: disp, heat: result.temp + " c", desc: cond, img: "./resources/Images/" + bgImage });
                        
                    }
                    //else
                    //    loadFailed();
                });
            }
            this.renderCities = function () {
                if (!this.context.config.cities) return;
                this.container.innerHTML = "";
                for (var i = 0; i < this.context.config.cities.length; i++) {
                    var c = this.context.config.cities[i];
                    this.loadWeather(c.query, c.display);
                }
            }
            this.domNode = this.createBodyElement("div", "weatherBoard", "");
            this.captionLabel = this.createBodyElement("div", "caption", "Hava Durumu", this.domNode);
            this.dateLabel = this.createBodyElement("div", "date", this.getDate(), this.domNode);
            this.container = this.createBodyElement("div", "container", "", this.domNode);
            this.renderCities();                    
            var self = this;
            this.context.config.watch("cities", function (name, oldVal, newVal) {

                setTimeout(lang.hitch(self, self.renderCities));
            });

        }
    });

