// xmlrequest
// const xmlReq = new XMLHttpRequest();
// xmlReq.onreadystatechange = function(){
//     if(this.readyState==4&&this.status==200){
        
//     }
// };

// fetch


const xml_url = "cards.xml";
  // promise
  const xmlReq = (url, method = "GET") =>
    new Promise((resolve, reject) => {
      const xhttpReq = new XMLHttpRequest();
      xhttpReq.onreadystatechange = function () {
        if (this.readyState == 4 && this.status == 200) {
          resolve(this.responseXML);
        }
      };
      xhttpReq.open(method, url);
      xhttpReq.send();
    });
  console.log("Promise");
  //   xmlReq(xml_url).then((data) => console.log(data));

  // async
  console.log("Async");
  const main_async = async () => {
    const xml_ele = await xmlReq("cards.xml");
    console.log(xml_ele);
  };

  //   main_async(xml_url);

  //   fetch
  console.log("Fetch");
  fetch(xml_url)
    .then((response) => response.text())
    .then((str) => new DOMParser().parseFromString(str, "text/xml"))
    .then((xml) => console.log(xml));
