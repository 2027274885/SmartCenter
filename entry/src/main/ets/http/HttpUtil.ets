import http from '@ohos.net.http';


export class HttpUtil {

  /**
   * @param method 请求类型
   */
  private setHttpRequestOptions(method: string, params: any) {
    return {
      method: method == 'get' ? http.RequestMethod.GET : http.RequestMethod.POST,
      header: {
        'Content-Type': 'application/json',
        'X-Auth-Token': globalThis.token,
      },
      extraData: params,
      expectDataType: http.HttpDataType.STRING, // 可选，指定返回数据的类型
    }
  }

  /**
   * @param url 接口地址
   * @param fn  回调函数
   */
  get(url: string, fn: Function) {
    let httpRequest = http.createHttp();
    httpRequest.request(url, this.setHttpRequestOptions('get', null), (err, data) => {
      if (!err) {
        // get data from api
        let result = JSON.parse(`${data.result}`)

        // 调用外层传入进来的回调函数，将api-data作为参数传入到回调函数中，为回调函数中定义的方法参数赋值
        fn(result)

        // 当该请求使用完毕时，调用destroy方法主动销毁
        httpRequest.destroy();
      } else {
        console.info('error:' + JSON.stringify(err));
        httpRequest.destroy();
      }
    });
  }

  /**
   *
   * @param url 接口地址
   * @param params 请求参数
   * @param fn  回调函数
   */
  post(url: string, params: any, fn: Function) {
    let httpRequest = http.createHttp();
    httpRequest.request(url, this.setHttpRequestOptions('post', params), (err, data) => {
      if (!err) {

        if (url.indexOf('/auth/tokens') > 0) {
          console.log('Token:', data.header['x-subject-token'])
          globalThis.token = data.header['x-subject-token'];
        }

        // get data from api
        let result = JSON.parse(`${data.result}`)

        // 调用外层传入进来的回调函数，将api-data作为参数传入到回调函数中，为回调函数中定义的方法参数赋值
        fn(result)

        // 当该请求使用完毕时，调用destroy方法主动销毁
        httpRequest.destroy();
      } else {
        console.info('error:' + JSON.stringify(err));
        httpRequest.destroy();
      }
    });
  }
}


export default new HttpUtil()