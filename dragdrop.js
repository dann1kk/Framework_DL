var dataTransfer=
                {
                    dropEffect:'',
                    effectAllowed:'all',
                    files:[],
                    items:{},
                    types:[],
                    setData:function(format,data)
                    {
                        this.items[format]=data;
                        this.types.push(format);
                    },
                    getData:function(format)
                    {
                        return this.items[format];
                    },
                    clearData:function(format){}
                };
var emit=function(event,target)
                {
                    var evt=document.createEvent('Event');
                    evt.initEvent(event,true,false);
                    evt.dataTransfer=dataTransfer;
                    target.dispatchEvent(evt);
                };
                
var DragNDrop1=function(src,tgt) {
    src = getElementByXpath('//*[@id="root"]/section/section/main/div[2]/form/div/div[2]/div/div[1]/div[2]')
    tgt = getElementByXpath('//*[@id="root"]/section/section/main/div[2]/form/div/div[1]/div[4]/p[2]')
    emit('dragstart',src);
    emit('dragenter',tgt);
    emit('dragover',tgt);
    emit('drop',tgt);
    emit('dragend',src);
    return true;
}   

var DragNDrop2=function(src,tgt) {
    src = getElementByXpath('//*[@id="root"]/section/section/main/div[2]/form/div/div[2]/div/div[1]/div[2]')
    tgt = getElementByXpath('//*[@id="root"]/section/section/main/div[2]/form/div/div[1]/div[4]/p[2]')
    emit('dragstart',src);
    emit('dragenter',tgt);
    emit('dragover',tgt);
    emit('drop',tgt);
    emit('dragend',src);
    return true;
}  

var DragNDrop3=function(src,tgt) {
    src = getElementByXpath('//*[@id="root"]/section/section/main/div[2]/form/div/div[2]/div/div[1]/div[2]')
    tgt = getElementByXpath('//*[@id="root"]/section/section/main/div[2]/form/div/div[1]/div[4]/p[2]')
    emit('dragstart',src);
    emit('dragenter',tgt);
    emit('dragover',tgt);
    emit('drop',tgt);
    emit('dragend',src);
    return true;
}  

var DragNDrop4=function(src,tgt) {
    src = getElementByXpath('//*[@id="root"]/section/section/main/div[2]/form/div/div[2]/div/div[1]/div[2]')
    tgt = getElementByXpath('//*[@id="root"]/section/section/main/div[2]/form/div/div[1]/div[4]/p[2]')
    emit('dragstart',src);
    emit('dragenter',tgt);
    emit('dragover',tgt);
    emit('drop',tgt);
    emit('dragend',src);
    return true;
}  

var DragNDrop5=function(src,tgt) {
    src = getElementByXpath('//*[@id="root"]/section/section/main/div[2]/form/div/div[1]/div[4]/div[1]/div[1]/div/div[1]')
    tgt = getElementByXpath('//*[@id="root"]/section/section/main/div[2]/form/div/div[1]/div[4]/p[1]')
    emit('dragstart',src);
    emit('dragenter',tgt);
    emit('dragover',tgt);
    emit('drop',tgt);
    emit('dragend',src);
    return true;
}  

function getElementByXpath(path) {return document.evaluate(path, document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue;}