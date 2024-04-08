import router from '@ohos.router'
@Entry
@Component
struct Loading {
  @State showSeconds:number = 1
  private timerId:number = -1

  build() {
    Flex({
      direction:FlexDirection.Column,
      alignItems:ItemAlign.Center,justifyContent:FlexAlign.SpaceAround
    }){
      // Text('系统登录中...')
      Text(`系统登录中(${this.showSeconds})...`)
        .fontSize(24)
        .fontColor(Color.Blue)
        .fontWeight(FontWeight.Bolder)
      LoadingProgress().color(Color.Black)
        .width('50%')
        .height('50%')
    }
    .width('100%')
    .height('100%')
    // .backgroundColor('#f1f2f3')
    .backgroundImage($r('app.media.housebg'))
    .backgroundImageSize(ImageSize.Cover)
  }
  aboutToAppear(){
    this.timerId = setInterval(()=>{
      if (this.showSeconds >0) {
        this.showSeconds --;
      }else{
        clearInterval(this.timerId)
        router.pushUrl({
          url:"pages/MainPage"
        })
      }
    },1000)
  }
}