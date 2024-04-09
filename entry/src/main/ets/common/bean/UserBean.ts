export default class UserBean{
  nickname:string = '金克斯';//昵称
  signature:string = '金克斯的含义就是金克斯';//签名

  public getNickName():string{
    return this.nickname
  }
  public setNickName(nickname:string):void{
    this.nickname = nickname
  }
  public getSignature():string{
    return this.signature
  }
  public setSignature(signature:string):void{
    this.signature = signature
  }
}
