var CityBox = function (context, queryName, displayName, container) {
    this.queryName = queryName;
    this.displayName = displayName;
    this.container = container;
    this.context = context;
    this.initUI();
}
CityBox.prototype.initUI = function () {
    this.domNode = this.createBodyElement("div", "CityBox", "", this.container);
    var table = this.createBodyElement("table", "", "", this.domNode);
    var tr = this.createBodyElement("tr", "", "", table);
    var td = this.createBodyElement("td", "", "YQL Sorgu Adı: ", tr);    
    var td2 = this.createBodyElement("td", "", "", tr);
    this.queryDom = this.createBodyElement("input", "", "", td2);
    this.queryDom.setAttribute("type", "text");
    this.queryDom.value = this.queryName || "";

    this.delete = this.createBodyElement("img", "delete", "", this.domNode);
    this.delete.context = this;
    this.delete.setAttribute("src", "/Scripts/app/dashlets/WeatherBoard/resources/Images/delete.png");
    this.delete.onclick = this.remove;

    var tr2 = this.createBodyElement("tr", "", "", table);
    var td3 = this.createBodyElement("td", "", "Şehir Görünen Ad: ", tr2);
    var td4 = this.createBodyElement("td", "", "", tr2);
    this.displayDom = this.createBodyElement("input", "", "", td4);
    this.displayDom.setAttribute("type", "text");
    this.displayDom.value = this.displayName || "";
    this.initilized = true;
}
CityBox.prototype.remove = function () {
    this.context.container.removeChild(this.context.domNode);
    this.context.context.removeBox(this.context);

}
CityBox.prototype.createBodyElement = function (tag, classAttr, html, appendTo) {
    var domNode = document.createElement(tag);
    domNode.appendChild
    domNode.setAttribute("class", classAttr);
    domNode.innerHTML = html;
    if (appendTo) appendTo.appendChild(domNode);
    return domNode;
}