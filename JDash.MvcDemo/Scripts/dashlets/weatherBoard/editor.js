define(["require"], function (require) {
    return {


        initialize: function (context, node) {
            var self = this;

            var currentCityCheck = $('.defaultCityCheck', this.ViewNode);

            var city = $('.city', this.ViewNode);

            var isCurrentCity = self.context.config.isCurrentCity != null ? self.context.config.isCurrentCity : true;
            if (!isCurrentCity) {
                city.show();
            }
            else {
                city.hide();
            }
            currentCityCheck.click(function () {
                $(this).attr('checked') ? city.hide() : city.show();
            });
        }
    }
})