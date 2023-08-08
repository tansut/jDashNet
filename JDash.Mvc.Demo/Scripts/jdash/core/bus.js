define(["dojo/_base/lang", "klt/core/messageBus"], function (lang, bus) {
    lang.setObject("jdash.msgBus", bus);
    return bus;
})